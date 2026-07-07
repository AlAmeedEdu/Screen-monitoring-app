import 'package:get/get.dart';

import '../controllers/profile_controller.dart';

/// يسجل الاعتمادات والـ controllers اللازمة قبل فتح هذه الصفحة في GetX.
class ProfileBinding extends Bindings {
  /// يسجل الـ controllers أو الخدمات التي تحتاجها الصفحة قبل عرضها.
  @override
  void dependencies() {
    Get.lazyPut<ProfileController>(() => ProfileController());
  }
}
