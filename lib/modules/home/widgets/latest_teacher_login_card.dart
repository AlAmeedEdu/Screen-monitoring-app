import 'package:flutter/material.dart';

import '../../../core/constants/app_assets.dart';
import '../../../core/theme/app_palette.dart';
import '../../../core/theme/app_radius.dart';
import '../../../core/theme/app_text_styles.dart';
import '../../../data/models/home_dashboard_model.dart';

/// يعرض بطاقة واجهة قابلة لإعادة الاستخدام داخل هذه الميزة.
class LatestTeacherLoginCard extends StatelessWidget {
  const LatestTeacherLoginCard({required this.login, super.key});

  final LatestTeacherLoginModel login;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
      decoration: BoxDecoration(
        color: context.colors.surfaceSoft,
        borderRadius: BorderRadius.circular(AppRadius.md),
      ),
      child: Directionality(
        textDirection: TextDirection.ltr,
        child: Row(
          children: [
            Expanded(
              child: Text(
                login.loginTime,
                textDirection: TextDirection.ltr,
                style: AppTextStyles.title.copyWith(
                  color: const Color(0xFF246CE8),
                  fontSize: 27,
                  fontWeight: FontWeight.w800,
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: Directionality(
                textDirection: TextDirection.rtl,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      login.teacherName,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.right,
                      textDirection: TextDirection.rtl,
                      style: AppTextStyles.caption.copyWith(
                        color: context.colors.primaryText,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const Spacer(),
                    Text(
                      'وقت تسجيل الدخول',
                      textAlign: TextAlign.right,
                      textDirection: TextDirection.rtl,
                      style: AppTextStyles.tiny
                          .copyWith(color: context.colors.secondaryText),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(width: 8),
            ClipOval(
              child: Image.asset(AppAssets.avatar,
                  height: 38, width: 38, fit: BoxFit.cover),
            ),
          ],
        ),
      ),
    );
  }
}
