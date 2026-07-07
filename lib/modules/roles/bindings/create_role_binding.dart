import 'package:get/get.dart';

import '../controllers/create_role_controller.dart';

/// يسجل الاعتمادات والـ controllers اللازمة قبل فتح هذه الصفحة في GetX.
class CreateRoleBinding extends Bindings {
  /// يسجل الـ controllers أو الخدمات التي تحتاجها الصفحة قبل عرضها.
  @override
  void dependencies() {
    Get.lazyPut<CreateRoleController>(() => CreateRoleController());
  }
}
