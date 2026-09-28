import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';

import '../../l10n/gen/app_localizations.dart';
import '../localization/locale_controller.dart';

class DateFormatter {
  const DateFormatter._();

  static String get _locale => LocaleController.instance.languageCode.value;

  static String matchTime(DateTime dateTime, {String? locale}) {
    return DateFormat.MMMd(locale ?? _locale).add_jm().format(dateTime.toLocal());
  }

  static String dayMonth(DateTime dateTime, {String? locale}) {
    return DateFormat.MMMd(locale ?? _locale).format(dateTime.toLocal());
  }

  static String fullDate(DateTime dateTime, {String? locale}) {
    return DateFormat.yMMMd(locale ?? _locale).format(dateTime.toLocal());
  }

  static String weekdayDay(DateTime dateTime, {String? locale}) {
    return DateFormat.MMMEd(locale ?? _locale).format(dateTime.toLocal());
  }

  static String weekdayShort(DateTime dateTime, {String? locale}) {
    return DateFormat.E(locale ?? _locale).format(dateTime.toLocal());
  }

  static String time(DateTime dateTime, {String? locale}) {
    return DateFormat.jm(locale ?? _locale).format(dateTime.toLocal());
  }

  static String monthYear(DateTime dateTime, {String? locale}) {
    return DateFormat.yMMM(locale ?? _locale).format(dateTime.toLocal());
  }

  static String dateRange(DateTime start, DateTime end, {String? locale}) {
    final formatter = DateFormat.MMMd(locale ?? _locale);
    if (start.year == end.year && start.month == end.month && start.day == end.day) {
      return formatter.format(start);
    }
    return '${formatter.format(start)} – ${formatter.format(end)}';
  }

  /// "In 3h" / "2d ago" — localized.
  static String relative(BuildContext context, DateTime dateTime) {
    final l10n = AppLocalizations.of(context);
    final diff = dateTime.toLocal().difference(DateTime.now());
    final future = !diff.isNegative;
    final d = diff.abs();
    if (d.inMinutes < 1) return l10n.timeNow;
    if (d.inMinutes < 60) return future ? l10n.timeInMinutes(d.inMinutes) : l10n.timeMinutesAgo(d.inMinutes);
    if (d.inHours < 24) return future ? l10n.timeInHours(d.inHours) : l10n.timeHoursAgo(d.inHours);
    return future ? l10n.timeInDays(d.inDays) : l10n.timeDaysAgo(d.inDays);
  }

  /// Backwards-compatible alias for the original English-only helper.
  static String relativeFromNow(BuildContext context, DateTime dateTime) => relative(context, dateTime);

  /// Day bucket used to group notification lists.
  static String dayBucket(BuildContext context, DateTime dateTime) {
    final l10n = AppLocalizations.of(context);
    final local = dateTime.toLocal();
    final now = DateTime.now();
    final today = DateTime(now.year, now.month, now.day);
    final day = DateTime(local.year, local.month, local.day);
    final diff = today.difference(day).inDays;
    if (diff == 0) return l10n.dayToday;
    if (diff == 1) return l10n.dayYesterday;
    if (diff < 7) return DateFormat.EEEE(_locale).format(local);
    return fullDate(local);
  }

  static String apiDate(DateTime date) => DateFormat('yyyy-MM-dd').format(date);
}
