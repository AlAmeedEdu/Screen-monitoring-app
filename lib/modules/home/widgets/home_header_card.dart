import 'package:flutter/material.dart';

import '../../../core/constants/app_assets.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_radius.dart';
import '../../../core/theme/app_shadows.dart';
import '../../../core/theme/app_text_styles.dart';
import '../../../core/widgets/app_svg_icon.dart';
import '../../../core/widgets/blurred_header_image.dart';

class HomeHeaderCard extends StatelessWidget {
  const HomeHeaderCard(
      {required this.userName, required this.subtitle, super.key});

  final String userName;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 143,
      child: Stack(
        fit: StackFit.expand,
        children: [
          const BlurredHeaderImage(
            asset: AppAssets.homeHeader,
            alignment: Alignment(0, -0.18),
            borderRadius: BorderRadius.vertical(bottom: Radius.circular(34)),
          ),
          Positioned(
            left: 16,
            top: 51,
            child: Material(
              color: AppColors.surface,
              borderRadius: BorderRadius.circular(AppRadius.md),
              elevation: 1,
              shadowColor: Colors.black12,
              child: InkWell(
                onTap: () {},
                borderRadius: BorderRadius.circular(AppRadius.md),
                child: SizedBox(
                  height: 48,
                  width: 48,
                  child: Stack(
                    children: [
                      const Center(
                          child: AppSvgIcon(AppAssets.bellIcon,
                              color: Color(0xFF62BBC1), size: 24)),
                      PositionedDirectional(
                        top: 8,
                        start: 9,
                        child: Container(
                          width: 7,
                          height: 7,
                          decoration: const BoxDecoration(
                              color: AppColors.success, shape: BoxShape.circle),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            right: 13,
            top: 51,
            child: Directionality(
              textDirection: TextDirection.ltr,
              child: Row(
                children: [
                  SizedBox(
                    width: 220,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          'مرحبا $userName',
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: AppTextStyles.title.copyWith(
                              fontSize: 19, fontWeight: FontWeight.w800),
                        ),
                        const SizedBox(height: 5),
                        Text(
                          subtitle,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: AppTextStyles.tiny
                              .copyWith(color: const Color(0xFF5F6A6C)),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 8),
                  Container(
                    height: 46,
                    width: 46,
                    padding: const EdgeInsets.all(3),
                    decoration: const BoxDecoration(
                        color: AppColors.surface,
                        shape: BoxShape.circle,
                        boxShadow: AppShadows.soft),
                    child: ClipOval(
                        child:
                            Image.asset(AppAssets.avatar, fit: BoxFit.cover)),
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
