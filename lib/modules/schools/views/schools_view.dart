import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/schools_controller.dart';

class SchoolsView extends GetView<SchoolsController> {
  const SchoolsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Schools')),
      body: const Center(child: Text('Schools')),
    );
  }
}
