import 'package:flutter/material.dart';

import '../../../core/constants/app_assets.dart';
import '../../../core/theme/app_palette.dart';
import '../../../core/theme/app_radius.dart';
import '../../../core/widgets/app_svg_icon.dart';

/// يمثل ScreenActionButtons كجزء من بنية المشروع ويجمع المسؤولية الخاصة به في مكان واحد.
class ScreenActionButtons extends StatelessWidget {
  const ScreenActionButtons({
    super.key,
    this.onDelete,
    this.onPower,
    this.onEdit,
    this.onInbox,
    this.size = 41,
    this.spacing = 16,
    this.radius = AppRadius.sm,
  });

  final VoidCallback? onDelete;
  final VoidCallback? onPower;
  final VoidCallback? onEdit;
  final VoidCallback? onInbox;
  final double size;
  final double spacing;
  final double radius;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        _ScreenActionIcon(
          asset: AppAssets.trashIcon,
          color: colors.danger,
          background: colors.dangerSoft,
          onTap: onDelete,
          size: size,
          radius: radius,
        ),
        SizedBox(width: spacing),
        _ScreenActionIcon(
          asset: AppAssets.powerIcon,
          color: colors.danger,
          background: colors.dangerSoft,
          onTap: onPower,
          size: size,
          radius: radius,
        ),
        SizedBox(width: spacing),
        _ScreenActionIcon(
          asset: AppAssets.penIcon,
          color: colors.warning,
          background: colors.warningSoft,
          onTap: onEdit,
          size: size,
          radius: radius,
        ),
        SizedBox(width: spacing),
        _ScreenActionIcon(
          asset: AppAssets.inboxIcon,
          color: context.isAppDarkMode
              ? const Color(0xFF60A5FA)
              : const Color(0xFF2F75DF),
          background: context.isAppDarkMode
              ? const Color(0xFF10233C)
              : const Color(0xFFF4F8FF),
          onTap: onInbox,
          size: size,
          radius: radius,
        ),
      ],
    );
  }
}

/// يعرض عنصر تفاعل صغير موحد الشكل داخل الواجهة.
class _ScreenActionIcon extends StatelessWidget {
  const _ScreenActionIcon({
    required this.asset,
    required this.color,
    required this.background,
    required this.size,
    required this.radius,
    this.onTap,
  });

  final String asset;
  final Color color;
  final Color background;
  final VoidCallback? onTap;
  final double size;
  final double radius;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: background,
      borderRadius: BorderRadius.circular(radius),
      child: InkWell(
        onTap: onTap ??
            () => ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('تم تنفيذ الإجراء'),
                    duration: Duration(milliseconds: 900),
                  ),
                ),
        borderRadius: BorderRadius.circular(radius),
        child: SizedBox(
          height: size,
          width: size,
          child: Center(child: AppSvgIcon(asset, size: 20, color: color)),
        ),
      ),
    );
  }
}
