import 'package:flutter/material.dart';
import '../../../core/constants/app_assets.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_radius.dart';
import '../../../core/theme/app_text_styles.dart';
import '../../../core/widgets/app_svg_icon.dart';

class ClassScheduleCard extends StatelessWidget {
  const ClassScheduleCard(
      {required this.section, required this.teacher, super.key});

  final String section;
  final String teacher;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 161,
      padding: const EdgeInsets.all(13),
      decoration: BoxDecoration(
          color: AppColors.surface,
          borderRadius: BorderRadius.circular(AppRadius.md)),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                flex: 2,
                child: _InfoTile(
                  label: 'الصف والشعبة',
                  value: section,
                  height: 60,
                ),
              ),
              const SizedBox(width: 8),
              Expanded(
                  child: _InfoTile(
                      label: 'الوقت',
                      value: '09:25 الى 10:05',
                      accent: AppColors.success,
                      height: 60)),
            ],
          ),
          const SizedBox(height: 7),
          Row(
            children: [
              Expanded(
                  child: _InfoTile(
                      label: 'وقت تسجيل الدخول', value: '09:26', large: true)),
              const SizedBox(width: 8),
              Expanded(child: _InfoTile(label: 'الاستاذ', value: teacher)),
            ],
          ),
        ],
      ),
    );
  }
}

class _InfoTile extends StatelessWidget {
  const _InfoTile(
      {required this.label,
      required this.value,
      this.large = false,
      this.accent,
      this.height = 67});

  final String label;
  final String value;
  final bool large;
  final Color? accent;
  final double height;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
      decoration: BoxDecoration(
          color: AppColors.secondary50,
          borderRadius: BorderRadius.circular(AppRadius.sm)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            textDirection: TextDirection.rtl,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const AppSvgIcon(AppAssets.sidebarIcon,
                  color: Color(0xFF62BBC1), size: 13),
              const SizedBox(width: 3),
              Text(label,
                  textAlign: TextAlign.right,
                  textDirection: TextDirection.rtl,
                  style: AppTextStyles.tiny
                      .copyWith(color: const Color(0xFF62BBC1))),
            ],
          ),
          const Spacer(),
          Text(
            value,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.right,
            textDirection: TextDirection.rtl,
            style: large
                ? AppTextStyles.title.copyWith(
                    color: const Color(0xFF39A8B3),
                    fontSize: 29,
                    fontWeight: FontWeight.w700)
                : AppTextStyles.caption.copyWith(
                    color: accent ?? const Color(0xFF52595A),
                    fontWeight: FontWeight.w500),
          ),
        ],
      ),
    );
  }
}
