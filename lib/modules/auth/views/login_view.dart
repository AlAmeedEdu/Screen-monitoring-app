import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/constants/app_assets.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_radius.dart';
import '../../../core/theme/app_text_styles.dart';
import '../../../core/widgets/app_text_field.dart';
import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    final sheetHeight = size.height * 0.53;

    return Scaffold(
      backgroundColor: AppColors.surface,
      body: Stack(
        children: [
          PositionedDirectional(
            top: 0,
            start: 0,
            end: 0,
            height: size.height * 0.55,
            child: Image.asset(
              AppAssets.loginHeroReference,
              fit: BoxFit.cover,
              alignment: Alignment.topCenter,
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: sheetHeight,
              width: double.infinity,
              padding: const EdgeInsets.fromLTRB(13, 13, 13, 28),
              decoration: const BoxDecoration(
                color: AppColors.surface,
                borderRadius: BorderRadius.vertical(top: Radius.circular(34)),
              ),
              child: Column(
                children: [
                  Container(
                    height: 4,
                    width: 54,
                    decoration: BoxDecoration(
                      color: const Color(0xFF40AEB7),
                      borderRadius: BorderRadius.circular(AppRadius.pill),
                    ),
                  ),
                  const SizedBox(height: 18),
                  Image.asset(AppAssets.logo, width: 72),
                  const SizedBox(height: 8),
                  Text(
                    'مرحبا بك 👋',
                    textAlign: TextAlign.center,
                    style: AppTextStyles.title.copyWith(
                      color: AppColors.primary,
                      fontSize: 18,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    'سجل دخول للوصول الى التطبيق',
                    textAlign: TextAlign.center,
                    style: AppTextStyles.subtitle.copyWith(
                      color: const Color(0xFF8E8E8E),
                      fontSize: 14,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                  const SizedBox(height: 16),
                  AppTextField(
                    controller: controller.usernameController,
                    hintText: 'أسم المستخدم',
                    iconAsset: AppAssets.userIcon,
                    height: 51,
                    radius: 26,
                    borderColor: const Color(0xFFECEEEF),
                    fillColor: const Color(0xFFF7FAFA),
                    focusedFillColor: const Color(0xFFEAF7F9),
                    hintFontSize: 15,
                    iconColor: AppColors.textHint,
                  ),
                  const SizedBox(height: 10),
                  Obx(
                    () => AppTextField(
                      controller: controller.passwordController,
                      hintText: 'كلمة المرور',
                      iconAsset: AppAssets.commandIcon,
                      obscureText: controller.obscurePassword.value,
                      height: 51,
                      radius: 26,
                      borderColor: const Color(0xFFECEEEF),
                      fillColor: const Color(0xFFF7FAFA),
                      focusedFillColor: const Color(0xFFEAF7F9),
                      hintFontSize: 15,
                      iconColor: AppColors.textHint,
                      suffix: IconButton(
                        onPressed: controller.togglePasswordVisibility,
                        icon: Icon(
                          controller.obscurePassword.value
                              ? Icons.visibility_off_outlined
                              : Icons.visibility_outlined,
                          color: AppColors.textHint,
                          size: 20,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 14),
                  SlideLoginButton(onComplete: controller.login),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class SlideLoginButton extends StatefulWidget {
  const SlideLoginButton({required this.onComplete, super.key});

  final VoidCallback onComplete;

  @override
  State<SlideLoginButton> createState() => _SlideLoginButtonState();
}

class _SlideLoginButtonState extends State<SlideLoginButton> {
  double _progress = 0;

  @override
  Widget build(BuildContext context) {
    const handleWidth = 54.0;
    const handleHeight = 43.0;
    const padding = 4.0;

    return SizedBox(
      height: 51,
      width: double.infinity,
      child: LayoutBuilder(
        builder: (context, constraints) {
          final travel = constraints.maxWidth - handleWidth - (padding * 2);
          final left = padding + (travel * (1 - _progress));

          return GestureDetector(
            onHorizontalDragUpdate: (details) {
              setState(() {
                _progress =
                    (_progress - (details.delta.dx / travel)).clamp(0.0, 1.0);
              });
            },
            onHorizontalDragEnd: (_) {
              if (_progress > 0.82) {
                setState(() => _progress = 1);
                widget.onComplete();
                return;
              }
              setState(() => _progress = 0);
            },
            child: Container(
              decoration: BoxDecoration(
                color: const Color(0xFF42AEB7),
                borderRadius: BorderRadius.circular(26),
              ),
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Text(
                    'اسحب لتسجيل الدخول',
                    style: AppTextStyles.caption.copyWith(
                      color: AppColors.surface,
                      fontSize: 13,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                  AnimatedPositioned(
                    duration: const Duration(milliseconds: 160),
                    curve: Curves.easeOut,
                    left: left,
                    top: padding,
                    child: Container(
                      height: handleHeight,
                      width: handleWidth,
                      decoration: BoxDecoration(
                        color: AppColors.surface,
                        borderRadius: BorderRadius.circular(24),
                        boxShadow: const [
                          BoxShadow(
                            color: Color(0xF2FFFFFF),
                            blurRadius: 18,
                            spreadRadius: 2,
                          ),
                          BoxShadow(
                            color: Color(0x1A0F363B),
                            blurRadius: 8,
                            offset: Offset(0, 3),
                          ),
                        ],
                      ),
                      child: const Icon(
                        Icons.arrow_back_ios_new_rounded,
                        color: Color(0xFF42AEB7),
                        size: 22,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
