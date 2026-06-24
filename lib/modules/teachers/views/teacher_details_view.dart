import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/teacher_details_controller.dart';

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
