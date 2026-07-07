import 'package:flutter/material.dart';

import '../../../core/theme/app_palette.dart';
import '../../../core/theme/app_radius.dart';
import '../../../core/theme/app_text_styles.dart';
import '../../../data/models/home_dashboard_model.dart';

/// يعرض بطاقة واجهة قابلة لإعادة الاستخدام داخل هذه الميزة.
class HomeScreenCard extends StatelessWidget {
  const HomeScreenCard({required this.stat, super.key});

  final HomeScreenStatModel stat;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      padding: const EdgeInsetsDirectional.only(start: 14, end: 10),
      decoration: BoxDecoration(
        color: context.colors.surface,
        borderRadius: BorderRadius.circular(AppRadius.md),
      ),
      child: Stack(
        children: [
          PositionedDirectional(
            end: -24,
            top: -32,
            child: Image.asset(stat.asset,
                width: 112, height: 112, fit: BoxFit.contain),
          ),
          Align(
            alignment: AlignmentDirectional.centerStart,
            child: SizedBox(
              width: 118,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    stat.title,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.right,
                    style: AppTextStyles.caption.copyWith(
                      color: context.colors.primaryText,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    stat.value,
                    textAlign: TextAlign.right,
                    style: AppTextStyles.caption
                        .copyWith(color: context.colors.secondaryText),
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
