import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/screen_logs_controller.dart';

class ScreenLogsView extends GetView<ScreenLogsController> {
  const ScreenLogsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('ScreenLogs')),
      body: const Center(child: Text('ScreenLogs')),
    );
  }
}
