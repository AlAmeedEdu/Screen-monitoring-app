import 'package:flutter/material.dart';

import '../../../core/theme/app_palette.dart';
import '../../../core/theme/app_radius.dart';
import '../../../core/theme/app_text_styles.dart';
import '../../../core/widgets/app_svg_icon.dart';

/// يمثل ScreenInfoRow كجزء من بنية المشروع ويجمع المسؤولية الخاصة به في مكان واحد.
class ScreenInfoRow extends StatelessWidget {
  const ScreenInfoRow({
    required this.title,
    required this.value,
    required this.iconAsset,
    super.key,
    this.textDirection = TextDirection.rtl,
    this.valueColor,
    this.titleColor,
    this.iconColor,
  });

  final String title;
  final String value;
  final String iconAsset;
  final TextDirection textDirection;
  final Color? valueColor;
  final Color? titleColor;
  final Color? iconColor;

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Row(
        children: [
          Container(
            height: 30,
            width: 30,
            decoration: BoxDecoration(
              color: context.colors.surfaceSoft,
              borderRadius: BorderRadius.circular(AppRadius.sm),
            ),
            child: Center(
              child: AppSvgIcon(
                iconAsset,
                size: 16,
                color: iconColor ?? context.colors.accent,
              ),
            ),
          ),
          const SizedBox(width: 8),
          Expanded(
            child: Directionality(
              textDirection: textDirection,
              child: Column(
                crossAxisAlignment: textDirection == TextDirection.rtl
                    ? CrossAxisAlignment.end
                    : CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    textAlign: textDirection == TextDirection.rtl
                        ? TextAlign.right
                        : TextAlign.left,
                    style: AppTextStyles.tiny.copyWith(
                        color: titleColor ?? context.colors.secondaryText),
                  ),
                  const SizedBox(height: 6),
                  Text(
                    value,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    textAlign: textDirection == TextDirection.rtl
                        ? TextAlign.right
                        : TextAlign.left,
                    style: AppTextStyles.tiny.copyWith(
                      color: valueColor ?? context.colors.primaryText,
                      fontWeight: FontWeight.w600,
                    ),
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
