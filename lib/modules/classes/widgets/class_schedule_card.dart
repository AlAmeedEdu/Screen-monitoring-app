import 'package:flutter/material.dart';
import '../../../core/constants/app_assets.dart';
import '../../../core/theme/app_palette.dart';
import '../../../core/theme/app_radius.dart';
import '../../../core/theme/app_text_styles.dart';
import '../../../core/widgets/app_svg_icon.dart';

/// يعرض بطاقة واجهة قابلة لإعادة الاستخدام داخل هذه الميزة.
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
          color: context.colors.surface,
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
                      accent: context.colors.success,
                      height: 60)),
            ],
          ),
          const SizedBox(height: 7),
          Row(
            children: [
              const Expanded(
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

/// يمثل جزءا داخليا صغيرا من الواجهة لفصل التفاصيل عن الملف الرئيسي.
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
          color: context.colors.surfaceSoft,
          borderRadius: BorderRadius.circular(AppRadius.sm)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            textDirection: TextDirection.rtl,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              AppSvgIcon(AppAssets.sidebarIcon,
                  color: context.colors.accent, size: 13),
              const SizedBox(width: 3),
              Text(label,
                  textAlign: TextAlign.right,
                  textDirection: TextDirection.rtl,
                  style: AppTextStyles.tiny
                      .copyWith(color: context.colors.accent)),
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
                    color: context.colors.accent,
                    fontSize: 29,
                    fontWeight: FontWeight.w700)
                : AppTextStyles.caption.copyWith(
                    color: accent ?? context.colors.primaryText,
                    fontWeight: FontWeight.w500),
          ),
        ],
      ),
    );
  }
}
