import 'dart:ui';

import 'package:flutter/material.dart';

import '../../../core/constants/app_assets.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_radius.dart';
import '../../../core/theme/app_shadows.dart';
import '../../../core/theme/app_text_styles.dart';
import '../../../core/widgets/app_svg_icon.dart';

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
    return SafeArea(
      top: false,
      minimum: const EdgeInsets.only(bottom: 2),
      child: Center(
        child: Container(
          height: 67,
          width: 293,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(AppRadius.pill),
            boxShadow: AppShadows.soft,
          ),
          child: CustomPaint(
            foregroundPainter: const _GradientBorderPainter(),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(AppRadius.pill),
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 30, sigmaY: 30),
                child: Container(
                  padding: const EdgeInsets.fromLTRB(10, 8, 10, 8),
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Color(0x80F7FAFA),
                        Color(0x66EAF2F3),
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
                          onTap: () => onTap(0),
                        ),
                        const SizedBox(width: 8),
                        _NavItem(
                          label: 'الصفوف',
                          asset: AppAssets.libraryIcon,
                          selected: currentIndex == 1,
                          onTap: () => onTap(1),
                        ),
                        const SizedBox(width: 8),
                        _NavItem(
                          label: 'الشاشات',
                          asset: AppAssets.monitorIcon,
                          selected: currentIndex == 2,
                          onTap: () => onTap(2),
                        ),
                        const SizedBox(width: 8),
                        _NavItem(
                          label: 'الرئيسية',
                          asset: AppAssets.homeIcon,
                          selected: currentIndex == 3,
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

class _NavItem extends StatelessWidget {
  const _NavItem({
    required this.label,
    required this.asset,
    required this.selected,
    required this.onTap,
  });

  final String label;
  final String asset;
  final bool selected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final color = selected ? const Color(0xFF42AEB7) : AppColors.inactive;

    return Semantics(
      button: true,
      selected: selected,
      label: label,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 220),
        curve: Curves.easeOutCubic,
        height: 51,
        width: selected ? 51 : 66,
        decoration: BoxDecoration(
          gradient: selected
              ? const LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [Color(0xFAFFFFFF), Color(0xE8FFFFFF)],
                )
              : const LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [Color(0xB8EEF2F2), Color(0x99E1E7E8)],
                ),
          borderRadius: BorderRadius.circular(AppRadius.pill),
          boxShadow: selected
              ? const [
                  BoxShadow(
                    color: Color(0x100F363B),
                    blurRadius: 8,
                    offset: Offset(0, 2),
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
                        padding: const EdgeInsets.symmetric(horizontal: 7),
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

class _GradientBorderPainter extends CustomPainter {
  const _GradientBorderPainter();

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

  @override
  bool shouldRepaint(covariant _GradientBorderPainter oldDelegate) => false;
}
