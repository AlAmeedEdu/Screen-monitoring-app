import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../../core/constants/app_assets.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_palette.dart';
import '../../../core/theme/app_radius.dart';
import '../../../core/theme/app_text_styles.dart';
import '../../../core/widgets/app_svg_icon.dart';
import '../../../core/widgets/app_text_field.dart';
import '../controllers/login_controller.dart';

part 'parts/login_components.dart';

/// يبني شاشة LoginView ويربطها بالـ controller أو البيانات الخاصة بها.
class LoginView extends GetView<LoginController> {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final widthScale = size.width / 360;
    final heightScale = size.height / 800;
    final sheetHeight = size.height * (424 / 800);
    final heroSize = size.width * (416 / 360);
    final isDark = context.isAppDarkMode;

    return Scaffold(
      backgroundColor: context.colors.canvas,
      body: Stack(
        children: [
          Positioned(
            top: 0,
            left: -41 * widthScale,
            width: heroSize,
            height: heroSize,
            child: Image.asset(
              AppAssets.figmaLoginHero,
              fit: BoxFit.cover,
              alignment: Alignment.topCenter,
              color: isDark
                  ? const Color(0xFF061113).withValues(alpha: .42)
                  : null,
              colorBlendMode: isDark ? BlendMode.multiply : null,
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: sheetHeight,
              width: double.infinity,
              decoration: BoxDecoration(
                color: context.colors.surface,
                borderRadius: const BorderRadius.vertical(
                  top: Radius.circular(24),
                ),
              ),
              child: Stack(
                children: [
                  Positioned(
                    top: 13 * heightScale,
                    left: (size.width - (54 * widthScale)) / 2,
                    child: Container(
                      height: 4 * heightScale,
                      width: 54 * widthScale,
                      decoration: BoxDecoration(
                        color: const Color(0xFF42A7B5),
                        borderRadius: BorderRadius.circular(AppRadius.pill),
                      ),
                    ),
                  ),
                  Positioned(
                    top: 46 * heightScale,
                    left: 13 * widthScale,
                    width: size.width - (26 * widthScale),
                    child: const _LoginWelcome(),
                  ),
                  Positioned(
                    top: 182 * heightScale,
                    left: 12 * widthScale,
                    right: 13 * widthScale,
                    child: Column(
                      children: [
                        AppTextField(
                          controller: controller.usernameController,
                          hintText: 'أسم المستخدم',
                          iconAsset: AppAssets.userIcon,
                          height: 56 * heightScale,
                          radius: 16,
                          borderColor: Colors.transparent,
                          focusedBorderColor: const Color(0xFF71BDC8),
                          fillColor: context.colors.surfaceSoft,
                          focusedFillColor: context.colors.accentSoft,
                          hintFontSize: 14,
                          horizontalPadding: 20,
                          iconColor: context.colors.hintText,
                          focusedIconColor: const Color(0xFF42A7B5),
                        ),
                        SizedBox(height: 16 * heightScale),
                        Obx(
                          () => AppTextField(
                            controller: controller.passwordController,
                            hintText: 'كلمة المرور',
                            iconAsset: AppAssets.passwordInputIcon,
                            obscureText: controller.obscurePassword.value,
                            height: 56 * heightScale,
                            radius: 16,
                            borderColor: Colors.transparent,
                            focusedBorderColor: const Color(0xFF71BDC8),
                            fillColor: context.colors.surfaceSoft,
                            focusedFillColor: context.colors.accentSoft,
                            hintFontSize: 14,
                            horizontalPadding: 20,
                            iconColor: context.colors.hintText,
                            focusedIconColor: const Color(0xFF42A7B5),
                            suffixBuilder: (isFocused) => GestureDetector(
                              behavior: HitTestBehavior.opaque,
                              onTap: controller.togglePasswordVisibility,
                              child: AppSvgIcon(
                                AppAssets.eyeClosedIcon,
                                color: isFocused
                                    ? const Color(0xFF42A7B5)
                                    : context.colors.hintText,
                                size: 21 * widthScale,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 16 * heightScale),
                        SlideLoginButton(onComplete: controller.login),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
