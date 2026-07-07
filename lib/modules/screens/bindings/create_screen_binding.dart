import 'package:get/get.dart';

import '../controllers/create_screen_controller.dart';

/// يسجل الاعتمادات والـ controllers اللازمة قبل فتح هذه الصفحة في GetX.
class CreateScreenBinding extends Bindings {
  /// يسجل الـ controllers أو الخدمات التي تحتاجها الصفحة قبل عرضها.
  @override
  void dependencies() {
    Get.lazyPut<CreateScreenController>(() => CreateScreenController());
  }
}
