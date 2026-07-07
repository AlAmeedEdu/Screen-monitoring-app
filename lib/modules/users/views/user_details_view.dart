import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/user_details_controller.dart';

/// يبني شاشة UserDetailsView ويربطها بالـ controller أو البيانات الخاصة بها.
class UserDetailsView extends GetView<UserDetailsController> {
  const UserDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('UserDetails')),
      body: const Center(child: Text('UserDetails')),
    );
  }
}
