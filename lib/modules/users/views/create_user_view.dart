import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/create_user_controller.dart';

/// يبني شاشة CreateUserView ويربطها بالـ controller أو البيانات الخاصة بها.
class CreateUserView extends GetView<CreateUserController> {
  const CreateUserView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('CreateUser')),
      body: const Center(child: Text('CreateUser')),
    );
  }
}
