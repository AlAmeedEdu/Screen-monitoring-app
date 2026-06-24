import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/timetable_controller.dart';

class TimetableView extends GetView<TimetableController> {
  const TimetableView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Timetable')),
      body: const Center(child: Text('Timetable')),
    );
  }
}
