import 'package:flutter/material.dart';

import '../constants/app_assets.dart';
import '../theme/app_palette.dart';
import '../theme/app_radius.dart';
import '../theme/app_text_styles.dart';
import 'app_svg_icon.dart';

/// يعرض حقل إدخال موحد الشكل ويستقبل النص من المستخدم.
class AppSearchField extends StatelessWidget {
  const AppSearchField({
    required this.hintText,
    super.key,
    this.onChanged,
  });

  final String hintText;
  final ValueChanged<String>? onChanged;

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Container(
        height: 51,
        padding: const EdgeInsets.symmetric(horizontal: 14),
        decoration: BoxDecoration(
          color: context.colors.surface,
          borderRadius: BorderRadius.circular(AppRadius.pill),
        ),
        child: Row(
          children: [
            AppSvgIcon(AppAssets.searchIcon,
                color: context.colors.icon, size: 22),
            const SizedBox(width: 10),
            Expanded(
              child: TextField(
                onChanged: onChanged,
                textAlign: TextAlign.right,
                textDirection: TextDirection.rtl,
                decoration: InputDecoration.collapsed(
                  hintText: hintText,
                  hintStyle: AppTextStyles.body
                      .copyWith(color: context.colors.hintText),
                ),
              ),
            ),
            const SizedBox(width: 10),
            AppSvgIcon(AppAssets.tuningIcon,
                color: context.colors.accent, size: 24),
          ],
        ),
      ),
    );
  }
}
