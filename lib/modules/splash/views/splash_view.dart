import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../core/constants/app_assets.dart';
import '../../../core/theme/app_palette.dart';

/// يبني شاشة SplashView ويربطها بالـ controller أو البيانات الخاصة بها.
class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

/// يمثل جزءا داخليا صغيرا من الواجهة لفصل التفاصيل عن الملف الرئيسي.
class _SplashViewState extends State<SplashView>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<double> _backgroundAnimation;
  late final Animation<double> _mainLogoAnimation;
  late final Animation<double> _footerLogoAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1350),
    )..forward();

    _backgroundAnimation = CurvedAnimation(
      parent: _controller,
      curve: const Interval(0, .62, curve: Curves.easeOutCubic),
    );
    _mainLogoAnimation = CurvedAnimation(
      parent: _controller,
      curve: const Interval(.16, .86, curve: Curves.easeOutBack),
    );
    _footerLogoAnimation = CurvedAnimation(
      parent: _controller,
      curve: const Interval(.52, 1, curve: Curves.easeOutCubic),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final reduceMotion = MediaQuery.of(context).disableAnimations;
    final mainLogoWidth = (size.width * .48).clamp(150.0, 172.0);
    final mainLogoHeight = mainLogoWidth * (139 / 172);
    final footerLogoWidth = (size.width * .27).clamp(82.0, 97.0);
    final footerLogoHeight = footerLogoWidth * (55 / 97);
    final isDark = context.isAppDarkMode;

    return Scaffold(
      backgroundColor: isDark ? context.colors.canvas : const Color(0xFFF3F6F6),
      body: AnimatedBuilder(
        animation: _controller,
        builder: (context, _) {
          final backgroundValue =
              reduceMotion ? 1.0 : _backgroundAnimation.value;
          final mainLogoValue = reduceMotion ? 1.0 : _mainLogoAnimation.value;
          final footerLogoValue =
              reduceMotion ? 1.0 : _footerLogoAnimation.value;

          return Stack(
            fit: StackFit.expand,
            children: [
              Opacity(
                opacity: backgroundValue,
                child: Transform.scale(
                  scale: 1.035 - (.035 * backgroundValue),
                  child: Image.asset(
                    AppAssets.figmaSplashBackground,
                    fit: BoxFit.cover,
                    color: isDark
                        ? const Color(0xFF061113).withValues(alpha: .52)
                        : null,
                    colorBlendMode: isDark ? BlendMode.multiply : null,
                  ),
                ),
              ),
              Positioned(
                top: size.height * (295 / 800),
                left: (size.width - mainLogoWidth) / 2,
                width: mainLogoWidth,
                height: mainLogoHeight,
                child: Opacity(
                  opacity: mainLogoValue.clamp(0, 1),
                  child: Transform.translate(
                    offset: Offset(0, 18 * (1 - mainLogoValue)),
                    child: Transform.scale(
                      scale: .82 + (.18 * mainLogoValue),
                      child: SvgPicture.asset(
                        AppAssets.figmaSplashLogoLockup,
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                ),
              ),
              Positioned(
                left: (size.width - footerLogoWidth) / 2,
                bottom: MediaQuery.of(context).padding.bottom + 33,
                width: footerLogoWidth,
                height: footerLogoHeight,
                child: Opacity(
                  opacity: footerLogoValue.clamp(0, 1),
                  child: Transform.translate(
                    offset: Offset(0, 10 * (1 - footerLogoValue)),
                    child: Image.asset(
                      AppAssets.figmaSplashFooterLogo,
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
