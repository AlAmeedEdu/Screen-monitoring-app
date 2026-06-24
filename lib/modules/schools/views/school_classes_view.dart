import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/school_classes_controller.dart';

class SchoolClassesView extends GetView<SchoolClassesController> {
  const SchoolClassesView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('SchoolClasses')),
      body: const Center(child: Text('SchoolClasses')),
    );
  }
}
