import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/timetable_controller.dart';

/// يبني شاشة TimetableView ويربطها بالـ controller أو البيانات الخاصة بها.
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
