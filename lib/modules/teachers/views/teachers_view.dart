import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/teachers_controller.dart';

class TeachersView extends GetView<TeachersController> {
  const TeachersView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Teachers')),
      body: const Center(child: Text('Teachers')),
    );
  }
}
