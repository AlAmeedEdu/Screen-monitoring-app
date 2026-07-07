import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/roles_controller.dart';

/// يبني شاشة RolesView ويربطها بالـ controller أو البيانات الخاصة بها.
class RolesView extends GetView<RolesController> {
  const RolesView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Roles')),
      body: const Center(child: Text('Roles')),
    );
  }
}
