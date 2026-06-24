import 'package:get/get.dart';

import '../controllers/schools_controller.dart';

class SchoolsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SchoolsController>(() => SchoolsController());
  }
}
