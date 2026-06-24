import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/constants/app_assets.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_text_styles.dart';
import '../controllers/splash_controller.dart';

class SplashView extends GetView<SplashController> {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: Stack(
        fit: StackFit.expand,
        children: [
          ImageFiltered(
            imageFilter: ImageFilter.blur(sigmaX: 3, sigmaY: 3),
            child: Image.asset(
              AppAssets.classesHeader,
              fit: BoxFit.cover,
              alignment: const Alignment(-0.05, 0),
            ),
          ),
          Container(color: Colors.white.withValues(alpha: .28)),
          const _SplashLogo(),
        ],
      ),
    );
  }
}

class _SplashLogo extends StatelessWidget {
  const _SplashLogo();

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.sizeOf(context).height;

    return Positioned(
      top: height * .34,
      left: 0,
      right: 0,
      child: Column(
        children: [
          Image.asset(AppAssets.logo, width: 118),
          const SizedBox(height: 4),
          Text(
            'نظام مراقبة الشاشات',
            textAlign: TextAlign.center,
            style: AppTextStyles.caption.copyWith(
              color: const Color(0xFF42AEB7),
              fontWeight: FontWeight.w600,
              height: 1,
            ),
          ),
        ],
      ),
    );
  }
}
