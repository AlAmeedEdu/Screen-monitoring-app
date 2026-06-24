import 'package:get/get.dart';

import '../controllers/school_classes_controller.dart';

class SchoolClassesBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SchoolClassesController>(() => SchoolClassesController());
  }
}
