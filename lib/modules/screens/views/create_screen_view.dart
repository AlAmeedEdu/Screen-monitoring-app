import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/create_screen_controller.dart';

/// يبني شاشة CreateScreenView ويربطها بالـ controller أو البيانات الخاصة بها.
class CreateScreenView extends GetView<CreateScreenController> {
  const CreateScreenView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('CreateScreen')),
      body: const Center(child: Text('CreateScreen')),
    );
  }
}
