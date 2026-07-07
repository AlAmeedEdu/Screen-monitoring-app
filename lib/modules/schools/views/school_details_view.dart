import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/school_details_controller.dart';

/// يبني شاشة SchoolDetailsView ويربطها بالـ controller أو البيانات الخاصة بها.
class SchoolDetailsView extends GetView<SchoolDetailsController> {
  const SchoolDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('SchoolDetails')),
      body: const Center(child: Text('SchoolDetails')),
    );
  }
}
