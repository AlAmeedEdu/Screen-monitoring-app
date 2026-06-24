import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/quick_monitor_controller.dart';

class QuickMonitorView extends GetView<QuickMonitorController> {
  const QuickMonitorView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('QuickMonitor')),
      body: const Center(child: Text('QuickMonitor')),
    );
  }
}
