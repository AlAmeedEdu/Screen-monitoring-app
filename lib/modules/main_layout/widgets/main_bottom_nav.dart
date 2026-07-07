import 'dart:ui';

import 'package:flutter/material.dart';

import '../../../core/constants/app_assets.dart';
import '../../../core/theme/app_palette.dart';
import '../../../core/theme/app_radius.dart';
import '../../../core/theme/app_shadows.dart';
import '../../../core/theme/app_text_styles.dart';
import '../../../core/widgets/app_svg_icon.dart';

/// يمثل MainBottomNav كجزء من بنية المشروع ويجمع المسؤولية الخاصة به في مكان واحد.
class MainBottomNav extends StatelessWidget {
  const MainBottomNav({
    required this.currentIndex,
    required this.onTap,
    super.key,
  });

  final int currentIndex;
  final ValueChanged<int> onTap;

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final colors = context.colors;
    final navWidth = screenWidth - 40;
    const selectedItemWidth = 51.0;
    const horizontalPadding = 20.0;
    const totalGap = 24.0;
    final unselectedItemWidth =
        (navWidth - horizontalPadding - totalGap - selectedItemWidth) / 3;

    return SafeArea(
      top: false,
      minimum: const EdgeInsets.only(bottom: 2),
      child: Center(
        child: Container(
          height: 67,
          width: navWidth,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(AppRadius.pill),
            boxShadow: AppShadows.softFor(context),
          ),
          child: CustomPaint(
            foregroundPainter: const _GradientBorderPainter(),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(AppRadius.pill),
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 30, sigmaY: 30),
                child: Container(
                  padding: const EdgeInsets.fromLTRB(10, 8, 10, 8),
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        colors.surface.withValues(alpha: .72),
                        colors.surfaceSoft.withValues(alpha: .58),
                      ],
                    ),
                  ),
                  child: Directionality(
                    textDirection: TextDirection.ltr,
                    child: Row(
                      children: [
                        _NavItem(
                          label: 'الحساب',
                          asset: AppAssets.userIcon,
                          selected: currentIndex == 0,
                          selectedWidth: selectedItemWidth,
                          unselectedWidth: unselectedItemWidth,
                          onTap: () => onTap(0),
                        ),
                        const SizedBox(width: 8),
                        _NavItem(
                          label: 'الصفوف',
                          asset: AppAssets.libraryIcon,
                          selected: currentIndex == 1,
                          selectedWidth: selectedItemWidth,
                          unselectedWidth: unselectedItemWidth,
                          onTap: () => onTap(1),
                        ),
                        const SizedBox(width: 8),
                        _NavItem(
                          label: 'الشاشات',
                          asset: AppAssets.monitorIcon,
                          selected: currentIndex == 2,
                          selectedWidth: selectedItemWidth,
                          unselectedWidth: unselectedItemWidth,
                          onTap: () => onTap(2),
                        ),
                        const SizedBox(width: 8),
                        _NavItem(
                          label: 'الرئيسية',
                          asset: AppAssets.homeIcon,
                          selected: currentIndex == 3,
                          selectedWidth: selectedItemWidth,
                          unselectedWidth: unselectedItemWidth,
                          onTap: () => onTap(3),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

/// يمثل جزءا داخليا صغيرا من الواجهة لفصل التفاصيل عن الملف الرئيسي.
class _NavItem extends StatelessWidget {
  const _NavItem({
    required this.label,
    required this.asset,
    required this.selected,
    required this.selectedWidth,
    required this.unselectedWidth,
    required this.onTap,
  });

  final String label;
  final String asset;
  final bool selected;
  final double selectedWidth;
  final double unselectedWidth;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final color = selected ? colors.accent : colors.inactive;

    return Semantics(
      button: true,
      selected: selected,
      label: label,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 220),
        curve: Curves.easeOutCubic,
        height: 51,
        width: selected ? selectedWidth : unselectedWidth,
        decoration: BoxDecoration(
          gradient: selected
              ? LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    colors.surface.withValues(alpha: .98),
                    colors.surface.withValues(alpha: .9),
                  ],
                )
              : LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    colors.surfaceSoft.withValues(alpha: .78),
                    colors.surfaceSoft.withValues(alpha: .58),
                  ],
                ),
          borderRadius: BorderRadius.circular(AppRadius.pill),
          boxShadow: selected
              ? [
                  BoxShadow(
                    color: context.isAppDarkMode
                        ? Colors.black.withValues(alpha: .32)
                        : const Color(0x100F363B),
                    blurRadius: context.isAppDarkMode ? 12 : 8,
                    offset: const Offset(0, 2),
                  ),
                ]
              : null,
        ),
        child: Material(
          color: Colors.transparent,
          borderRadius: BorderRadius.circular(AppRadius.pill),
          child: InkWell(
            borderRadius: BorderRadius.circular(AppRadius.pill),
            onTap: onTap,
            child: AnimatedSwitcher(
              duration: const Duration(milliseconds: 160),
              child: selected
                  ? Center(
                      key: const ValueKey('selected'),
                      child: AppSvgIcon(asset, color: color, size: 24),
                    )
                  : Directionality(
                      key: const ValueKey('unselected'),
                      textDirection: TextDirection.rtl,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 9),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            AppSvgIcon(asset, color: color, size: 16),
                            const SizedBox(width: 4),
                            Flexible(
                              child: Text(
                                label,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: AppTextStyles.caption.copyWith(
                                  color: color,
                                  fontWeight: FontWeight.w400,
                                  height: 1,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
            ),
          ),
        ),
      ),
    );
  }
}

/// يمثل جزءا داخليا صغيرا من الواجهة لفصل التفاصيل عن الملف الرئيسي.
class _GradientBorderPainter extends CustomPainter {
  const _GradientBorderPainter();

  /// يرسم الشكل المخصص على الـ canvas الخاص بالواجهة.
  @override
  void paint(Canvas canvas, Size size) {
    final rect = Offset.zero & size;
    final paint = Paint()
      ..shader = const LinearGradient(
        begin: Alignment.bottomLeft,
        end: Alignment.topRight,
        colors: [
          Color(0xFF8EDCE1),
          Color(0x99C5EDF0),
          Color(0x33FFFFFF),
        ],
      ).createShader(rect)
      ..style = PaintingStyle.stroke
      ..strokeWidth = .5;

    canvas.drawRRect(
      RRect.fromRectAndRadius(
        rect.deflate(.25),
        Radius.circular(size.height / 2),
      ),
      paint,
    );
  }

  /// يحدد هل يحتاج الرسم المخصص إلى إعادة رسم عند تغير البيانات.
  @override
  bool shouldRepaint(covariant _GradientBorderPainter oldDelegate) => false;
}
