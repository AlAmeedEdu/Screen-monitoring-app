import 'package:flutter/material.dart';

import '../../../core/constants/app_assets.dart';
import '../../../core/theme/app_palette.dart';
import '../../../core/theme/app_radius.dart';
import '../../../core/theme/app_text_styles.dart';
import '../../../core/widgets/app_svg_icon.dart';
import '../../../data/models/home_dashboard_model.dart';

/// يعرض بطاقة واجهة قابلة لإعادة الاستخدام داخل هذه الميزة.
class AttendanceSummaryCard extends StatelessWidget {
  const AttendanceSummaryCard({required this.summary, super.key});

  final AttendanceSummaryModel summary;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final accent = summary.isPositive ? colors.accent : colors.danger;
    final background =
        summary.isPositive ? colors.surfaceSoft : colors.dangerSoft;

    return Container(
      height: 67,
      padding: const EdgeInsetsDirectional.fromSTEB(8, 8, 8, 7),
      decoration: BoxDecoration(
          color: background, borderRadius: BorderRadius.circular(AppRadius.md)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            textDirection: TextDirection.rtl,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              AppSvgIcon(AppAssets.sidebarIcon, size: 13, color: accent),
              const SizedBox(width: 4),
              Flexible(
                child: Text(
                  summary.title,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.right,
                  textDirection: TextDirection.rtl,
                  style: AppTextStyles.tiny.copyWith(color: accent),
                ),
              ),
            ],
          ),
          const Spacer(),
          Text(
            '${summary.value} استاذ',
            textAlign: TextAlign.right,
            textDirection: TextDirection.rtl,
            style: AppTextStyles.title.copyWith(
                color: accent, fontSize: 25, fontWeight: FontWeight.w800),
          ),
        ],
      ),
    );
  }
}
