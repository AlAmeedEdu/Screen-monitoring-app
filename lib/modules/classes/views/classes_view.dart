import 'package:flutter/material.dart';

import '../../../core/constants/app_assets.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_radius.dart';
import '../../../core/theme/app_text_styles.dart';
import '../../../core/widgets/app_svg_icon.dart';
import '../../../core/widgets/blurred_header_image.dart';
import '../widgets/class_schedule_card.dart';

class ClassesView extends StatelessWidget {
  const ClassesView({super.key});

  @override
  Widget build(BuildContext context) {
    const items = [
      ('الصف الاول الابتدائي -أ', 'ندى محمد حميد عباس'),
      ('الصف الاول الابتدائي -ب', 'ندى محمد حميد عباس'),
      ('الصف الاول الابتدائي -أ', 'ندى محمد حميد عباس'),
      ('الصف الاول الابتدائي -ب', 'ندى محمد حميد عباس'),
    ];

    return Directionality(
      textDirection: TextDirection.rtl,
      child: Column(
        children: [
          const _ClassesHeader(),
          Expanded(
            child: ListView(
              padding: const EdgeInsets.only(bottom: 116),
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(16, 14, 16, 0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Text('الصف الاول الابتدائي',
                          textAlign: TextAlign.right,
                          style: AppTextStyles.body
                              .copyWith(fontWeight: FontWeight.w500)),
                      const SizedBox(height: 8),
                      for (var index = 0; index < items.length; index++) ...[
                        ClassScheduleCard(
                            section: items[index].$1, teacher: items[index].$2),
                        if (index == 1) ...[
                          const SizedBox(height: 13),
                          Text('الصف الاول الابتدائي',
                              textAlign: TextAlign.right,
                              style: AppTextStyles.body
                                  .copyWith(fontWeight: FontWeight.w500)),
                        ],
                        const SizedBox(height: 12),
                      ],
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _ClassesHeader extends StatelessWidget {
  const _ClassesHeader();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 129,
      child: Stack(
        fit: StackFit.expand,
        children: [
          const BlurredHeaderImage(
            asset: AppAssets.classesHeader,
            alignment: Alignment(0, -0.08),
            borderRadius: BorderRadius.vertical(bottom: Radius.circular(34)),
          ),
          Positioned(
            left: 12,
            bottom: 29,
            child: Row(
              children: [
                _HeaderButton(asset: AppAssets.tuningIcon, onTap: () {}),
                const SizedBox(width: 14),
                _HeaderButton(
                    icon: Icons.refresh_rounded, filled: true, onTap: () {}),
              ],
            ),
          ),
          Positioned(
            right: 20,
            bottom: 27,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text('أبتدائية القمر للبنات',
                    style: AppTextStyles.title
                        .copyWith(fontSize: 19, fontWeight: FontWeight.w800)),
                const SizedBox(height: 5),
                Text('متابعة جميع صفوف المدرسة',
                    style: AppTextStyles.tiny
                        .copyWith(color: const Color(0xFF596466))),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _HeaderButton extends StatelessWidget {
  const _HeaderButton(
      {this.asset, this.icon, required this.onTap, this.filled = false});

  final String? asset;
  final IconData? icon;
  final VoidCallback onTap;
  final bool filled;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: filled ? const Color(0xFF62BBC1) : AppColors.surface,
      borderRadius: BorderRadius.circular(AppRadius.md),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(AppRadius.md),
        child: SizedBox(
          height: 44,
          width: 44,
          child: Center(
            child: icon != null
                ? Icon(icon,
                    color: filled ? Colors.white : const Color(0xFF42AEB7),
                    size: 20)
                : AppSvgIcon(asset!,
                    color: filled ? Colors.white : const Color(0xFF42AEB7),
                    size: 20),
          ),
        ),
      ),
    );
  }
}
