import 'package:dio/dio.dart';

import '../../localization/locale_controller.dart';

/// Stamps `Accept-Language` on every request from the app's current locale,
/// which drives backend translation + validation-message language.
class LocaleInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    options.headers['Accept-Language'] = LocaleController.instance.languageCode.value;
    options.headers['Accept'] = 'application/json';
    handler.next(options);
  }
}
