import 'package:flutter/material.dart';

import '../../../core/constants/app_assets.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_radius.dart';
import '../../../core/theme/app_text_styles.dart';
import '../../../core/widgets/app_svg_icon.dart';
import '../../../data/models/home_dashboard_model.dart';

class AttendanceSummaryCard extends StatelessWidget {
  const AttendanceSummaryCard({required this.summary, super.key});

  final AttendanceSummaryModel summary;

  @override
  Widget build(BuildContext context) {
    final accent =
        summary.isPositive ? const Color(0xFF39A8B3) : AppColors.danger;
    final background =
        summary.isPositive ? AppColors.secondary50 : AppColors.dangerSoft;

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
