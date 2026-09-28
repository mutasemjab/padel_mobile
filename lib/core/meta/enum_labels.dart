import 'package:flutter/widgets.dart';

import '../di/injection.dart';
import 'enums_service.dart';

/// `context.enums.label(EnumGroup.bookingStatuses, 'confirmed')`.
extension EnumLabels on BuildContext {
  EnumsService get enums => sl<EnumsService>();
}
