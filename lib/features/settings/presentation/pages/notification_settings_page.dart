import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import '../../../../core/constants/api_endpoints.dart';
import '../../../../core/di/injection.dart';
import '../../../../core/error/exception_mapper.dart';
import '../../../../core/network/api_envelope.dart';
import '../../../../core/theme/app_spacing.dart';
import '../../../../core/theme/app_tokens.dart';
import '../../../../core/widgets/app_card.dart';
import '../../../../core/widgets/feedback.dart';
import '../../../../l10n/gen/app_localizations.dart';

/// One switch per notification category (`GET/PUT me/notification-settings`).
/// A category switched off is neither pushed nor added to the bell.
class NotificationSettingsPage extends StatefulWidget {
  const NotificationSettingsPage({super.key});

  @override
  State<NotificationSettingsPage> createState() => _NotificationSettingsPageState();
}

class _Category {
  final String key;
  final String label;
  final String? description;
  bool enabled;

  _Category({required this.key, required this.label, this.description, required this.enabled});

  factory _Category.fromJson(Map<String, dynamic> json) => _Category(
        key: json['key'].toString(),
        label: (json['label'] ?? json['key']).toString(),
        description: json['description']?.toString(),
        enabled: json['enabled'] == true,
      );
}

class _NotificationSettingsPageState extends State<NotificationSettingsPage> {
  final _dio = sl<Dio>();
  List<_Category>? _items;
  Object? _error;

  @override
  void initState() {
    super.initState();
    _load();
  }

  Future<void> _load() async {
    setState(() => _error = null);
    try {
      final response = await _dio.get(ApiEndpoints.notificationSettings);
      final list = ApiEnvelope.list(response).map(_Category.fromJson).toList();
      if (mounted) setState(() => _items = list);
    } catch (e) {
      if (mounted) setState(() => _error = e);
    }
  }

  Future<void> _toggle(_Category item, bool value) async {
    setState(() => item.enabled = value);
    try {
      await _dio.put(ApiEndpoints.notificationSettings, data: {item.key: value});
    } catch (e, s) {
      if (!mounted) return;
      setState(() => item.enabled = !value);
      showFailure(context, ExceptionMapper.map(e, s));
    }
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final items = _items;
    return Scaffold(
      appBar: AppBar(title: Text(l10n.notificationSettingsTitle)),
      body: _error != null
          ? Center(child: TextButton.icon(onPressed: _load, icon: const Icon(Icons.refresh_rounded), label: Text(l10n.actionRetry)))
          : items == null
              ? const Center(child: CircularProgressIndicator())
              : ListView(
                  padding: AppSpacing.page,
                  children: [
                    Text(l10n.notificationSettingsHint, style: context.text.bodySmall),
                    Gap.md,
                    AppCard(
                      padding: EdgeInsets.zero,
                      child: Column(
                        children: [
                          for (final item in items)
                            SwitchListTile(
                              value: item.enabled,
                              onChanged: (v) => _toggle(item, v),
                              title: Text(item.label),
                              subtitle: item.description == null ? null : Text(item.description!),
                            ),
                        ],
                      ),
                    ),
                  ],
                ),
    );
  }
}
