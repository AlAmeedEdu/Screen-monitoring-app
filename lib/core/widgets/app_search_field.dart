import 'package:flutter/material.dart';

import '../constants/app_assets.dart';
import '../theme/app_colors.dart';
import '../theme/app_radius.dart';
import '../theme/app_text_styles.dart';
import 'app_svg_icon.dart';

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
          color: AppColors.surface,
          borderRadius: BorderRadius.circular(AppRadius.pill),
        ),
        child: Row(
          children: [
            const AppSvgIcon(AppAssets.searchIcon,
                color: AppColors.primary, size: 22),
            const SizedBox(width: 10),
            Expanded(
              child: TextField(
                onChanged: onChanged,
                textAlign: TextAlign.right,
                textDirection: TextDirection.rtl,
                decoration: InputDecoration.collapsed(
                  hintText: hintText,
                  hintStyle:
                      AppTextStyles.body.copyWith(color: AppColors.textHint),
                ),
              ),
            ),
            const SizedBox(width: 10),
            const AppSvgIcon(AppAssets.tuningIcon,
                color: Color(0xFF42AEB7), size: 24),
          ],
        ),
      ),
    );
  }
}
