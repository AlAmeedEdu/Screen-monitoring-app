import 'package:flutter/material.dart';

import '../../../core/constants/app_assets.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_radius.dart';
import '../../../core/widgets/app_svg_icon.dart';

class ScreenActionButtons extends StatelessWidget {
  const ScreenActionButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: const [
        _ScreenActionIcon(
            asset: AppAssets.trashIcon,
            color: AppColors.danger,
            background: AppColors.dangerSoft),
        SizedBox(width: 16),
        _ScreenActionIcon(
            asset: AppAssets.powerIcon,
            color: AppColors.danger,
            background: AppColors.dangerSoft),
        SizedBox(width: 16),
        _ScreenActionIcon(
            asset: AppAssets.penIcon,
            color: Color(0xFFF2A400),
            background: AppColors.warningSoft),
        SizedBox(width: 16),
        _ScreenActionIcon(
            asset: AppAssets.inboxIcon,
            color: Color(0xFF2F75DF),
            background: Color(0xFFF4F8FF)),
      ],
    );
  }
}

class _ScreenActionIcon extends StatelessWidget {
  const _ScreenActionIcon(
      {required this.asset, required this.color, required this.background});

  final String asset;
  final Color color;
  final Color background;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: background,
      borderRadius: BorderRadius.circular(AppRadius.sm),
      child: InkWell(
        onTap: () => ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
              content: Text('تم تنفيذ الإجراء'),
              duration: Duration(milliseconds: 900)),
        ),
        borderRadius: BorderRadius.circular(AppRadius.sm),
        child: SizedBox(
          height: 41,
          width: 41,
          child: Center(child: AppSvgIcon(asset, size: 20, color: color)),
        ),
      ),
    );
  }
}
