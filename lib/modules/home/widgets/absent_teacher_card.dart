import 'package:flutter/material.dart';

import '../../../core/constants/app_assets.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_radius.dart';
import '../../../core/theme/app_text_styles.dart';
import '../../../core/widgets/app_svg_icon.dart';
import '../../../data/models/home_dashboard_model.dart';

class AbsentTeacherCard extends StatelessWidget {
  const AbsentTeacherCard({required this.login, super.key});

  final LatestTeacherLoginModel login;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 79,
      padding: const EdgeInsetsDirectional.fromSTEB(10, 8, 8, 8),
      decoration: BoxDecoration(
        color: AppColors.secondary50,
        borderRadius: BorderRadius.circular(AppRadius.md),
      ),
      child: Directionality(
        textDirection: TextDirection.ltr,
        child: Row(
          children: [
            Expanded(
              child: Directionality(
                textDirection: TextDirection.rtl,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      login.className,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.right,
                      textDirection: TextDirection.rtl,
                      style: AppTextStyles.body
                          .copyWith(fontWeight: FontWeight.w500),
                    ),
                    const SizedBox(height: 10),
                    Row(
                      textDirection: TextDirection.rtl,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const AppSvgIcon(AppAssets.userIcon,
                            size: 15, color: Color(0xFF62BBC1)),
                        const SizedBox(width: 3),
                        Text('الاستاذ:',
                            style: AppTextStyles.caption
                                .copyWith(color: const Color(0xFF62BBC1))),
                        const SizedBox(width: 8),
                        Text(login.teacherName,
                            textAlign: TextAlign.right,
                            textDirection: TextDirection.rtl,
                            style: AppTextStyles.caption
                                .copyWith(fontWeight: FontWeight.w500)),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(width: 8),
            ClipRRect(
              borderRadius: BorderRadius.circular(14),
              child: ColorFiltered(
                colorFilter:
                    const ColorFilter.mode(Colors.grey, BlendMode.saturation),
                child: Image.asset(AppAssets.loginHeroReference,
                    width: 63, height: 63, fit: BoxFit.cover),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
