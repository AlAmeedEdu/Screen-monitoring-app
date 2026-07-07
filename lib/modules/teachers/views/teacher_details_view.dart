import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/teacher_details_controller.dart';

/// يبني شاشة TeacherDetailsView ويربطها بالـ controller أو البيانات الخاصة بها.
class TeacherDetailsView extends GetView<TeacherDetailsController> {
  const TeacherDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('TeacherDetails')),
      body: const Center(child: Text('TeacherDetails')),
    );
  }
}
