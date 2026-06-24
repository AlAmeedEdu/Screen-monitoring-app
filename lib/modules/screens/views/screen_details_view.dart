import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/screen_details_controller.dart';

class ScreenDetailsView extends GetView<ScreenDetailsController> {
  const ScreenDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('ScreenDetails')),
      body: const Center(child: Text('ScreenDetails')),
    );
  }
}
