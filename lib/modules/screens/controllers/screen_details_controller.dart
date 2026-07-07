import 'package:get/get.dart';

import '../../../data/models/monitor_item_model.dart';

/// يدير حالة هذه الشاشة وينفذ أوامرها بعيدا عن كود الواجهة.
class ScreenDetailsController extends GetxController {
  /// يوفر قيمة screen المحسوبة لاستخدامها داخل الواجهة أو المنطق.
  MonitorItemModel? get screen {
    final argument = Get.arguments;
    return argument is MonitorItemModel ? argument : null;
  }
}
