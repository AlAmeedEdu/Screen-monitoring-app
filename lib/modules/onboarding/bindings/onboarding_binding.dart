import 'package:get/get.dart';

import '../controllers/onboarding_controller.dart';

/// يسجل الاعتمادات والـ controllers اللازمة قبل فتح هذه الصفحة في GetX.
class OnboardingBinding extends Bindings {
  /// يسجل الـ controllers أو الخدمات التي تحتاجها الصفحة قبل عرضها.
  @override
  void dependencies() {
    Get.lazyPut<OnboardingController>(() => OnboardingController());
  }
}
