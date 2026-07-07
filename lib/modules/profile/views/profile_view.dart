import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../app/app_routes.dart';
import '../../../core/constants/app_assets.dart';
import '../../../core/controllers/theme_controller.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_palette.dart';
import '../../../core/theme/app_radius.dart';
import '../../../core/theme/app_shadows.dart';
import '../../../core/theme/app_text_styles.dart';
import '../../../core/widgets/app_svg_icon.dart';
import '../controllers/profile_controller.dart';

part 'parts/profile_identity.dart';
part 'parts/profile_settings.dart';

/// يبني شاشة ProfileView ويربطها بالـ controller أو البيانات الخاصة بها.
class ProfileView extends GetView<ProfileController> {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.colors.canvas,
      body: Directionality(
        textDirection: TextDirection.rtl,
        child: ListView(
          padding: const EdgeInsets.fromLTRB(16, 58, 16, 124),
          children: [
            _ProfileCard(onLogout: () => Get.offAllNamed(AppRoutes.login)),
          ],
        ),
      ),
    );
  }
}
