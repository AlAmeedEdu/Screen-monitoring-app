import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/create_role_controller.dart';

/// يبني شاشة CreateRoleView ويربطها بالـ controller أو البيانات الخاصة بها.
class CreateRoleView extends GetView<CreateRoleController> {
  const CreateRoleView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('CreateRole')),
      body: const Center(child: Text('CreateRole')),
    );
  }
}
