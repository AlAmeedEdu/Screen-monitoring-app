import 'package:get/get.dart';

import '../controllers/create_role_controller.dart';

class CreateRoleBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CreateRoleController>(() => CreateRoleController());
  }
}
