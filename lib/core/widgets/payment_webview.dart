import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../../l10n/gen/app_localizations.dart';

/// Opens the payment page the backend generated (MEPS / PayTabs hosted page)
/// inside the app. Completes when the payer reaches our return URL or closes
/// the page; the caller then shows the payment status, which the backend
/// confirms with the provider — the app never decides a payment is paid.
///
/// Platforms without a WebView (web, desktop) fall back to the browser.
Future<void> openPaymentPage(BuildContext context, String url) async {
  final supported = !kIsWeb && (defaultTargetPlatform == TargetPlatform.android || defaultTargetPlatform == TargetPlatform.iOS);
  if (!supported) {
    await launchUrl(Uri.parse(url), mode: LaunchMode.externalApplication);
    return;
  }
  await Navigator.of(context, rootNavigator: true).push(
    MaterialPageRoute<void>(fullscreenDialog: true, builder: (_) => PaymentWebViewPage(url: url)),
  );
}

class PaymentWebViewPage extends StatefulWidget {
  final String url;

  /// Reaching a URL containing this path means the payment page is done.
  static const returnPath = '/payments/return';

  const PaymentWebViewPage({super.key, required this.url});

  @override
  State<PaymentWebViewPage> createState() => _PaymentWebViewPageState();
}

class _PaymentWebViewPageState extends State<PaymentWebViewPage> {
  late final WebViewController _controller;
  int _progress = 0;
  bool _done = false;

  @override
  void initState() {
    super.initState();
    _controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setNavigationDelegate(
        NavigationDelegate(
          onProgress: (p) {
            if (mounted) setState(() => _progress = p);
          },
          // GET redirects are caught before loading; MEPS may also POST the
          // result to the return URL, which is caught once it starts loading.
          onNavigationRequest: (request) {
            if (_isReturn(request.url)) {
              _finish();
              return NavigationDecision.prevent;
            }
            return NavigationDecision.navigate;
          },
          onPageStarted: (url) {
            if (_isReturn(url)) _finish();
          },
          onUrlChange: (change) {
            final url = change.url;
            if (url != null && _isReturn(url)) _finish();
          },
        ),
      )
      ..loadRequest(Uri.parse(widget.url));
  }

  bool _isReturn(String url) => url.contains(PaymentWebViewPage.returnPath);

  void _finish() {
    if (_done || !mounted) return;
    _done = true;
    Navigator.of(context).maybePop();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          tooltip: l10n.actionClose,
          icon: const Icon(Icons.close_rounded),
          onPressed: _finish,
        ),
        title: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(Icons.lock_rounded, size: 18),
            const SizedBox(width: 8),
            Flexible(child: Text(l10n.paymentSecureTitle, overflow: TextOverflow.ellipsis)),
          ],
        ),
        bottom: _progress < 100
            ? PreferredSize(
                preferredSize: const Size.fromHeight(2),
                child: LinearProgressIndicator(value: _progress == 0 ? null : _progress / 100, minHeight: 2),
              )
            : null,
      ),
      body: WebViewWidget(controller: _controller),
    );
  }
}
