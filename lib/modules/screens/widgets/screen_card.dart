import 'package:flutter/material.dart';

import '../../../core/constants/app_assets.dart';
import '../../../core/theme/app_palette.dart';
import '../../../core/theme/app_shadows.dart';
import '../../../core/theme/app_text_styles.dart';
import '../../../core/widgets/app_svg_icon.dart';
import '../../../data/models/monitor_item_model.dart';
import 'screen_status_badge.dart';

/// يعرض بطاقة واجهة قابلة لإعادة الاستخدام داخل هذه الميزة.
class ScreenCard extends StatelessWidget {
  const ScreenCard({
    required this.screen,
    this.isSelected = false,
    this.selectionMode = false,
    this.onTap,
    this.onLongPress,
    this.onSelectionTap,
    super.key,
  });

  final MonitorItemModel screen;
  final bool isSelected;
  final bool selectionMode;
  final VoidCallback? onTap;
  final VoidCallback? onLongPress;
  final VoidCallback? onSelectionTap;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    const accent = Color(0xFF42AEB7);
    const radius = 20.0;

    return Directionality(
      textDirection: TextDirection.rtl,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 180),
        decoration: BoxDecoration(
          color: colors.surface,
          borderRadius: BorderRadius.circular(radius),
          border: Border.all(
            color: isSelected ? accent : Colors.transparent,
            width: 1.1,
          ),
          boxShadow: AppShadows.cardFor(context),
        ),
        child: Material(
          color: Colors.transparent,
          borderRadius: BorderRadius.circular(radius),
          child: InkWell(
            onTap: onTap,
            onLongPress: onLongPress,
            borderRadius: BorderRadius.circular(radius),
            child: Padding(
              padding: const EdgeInsets.fromLTRB(12, 13, 12, 15),
              child: Column(
                children: [
                  Directionality(
                    textDirection: TextDirection.ltr,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ScreenStatusBadge(status: screen.status),
                        const SizedBox(width: 12),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text(
                                screen.name,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                textAlign: TextAlign.right,
                                style: AppTextStyles.caption.copyWith(
                                  color: accent,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                              const SizedBox(height: 2),
                              Text(
                                screen.ipAddress,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                textAlign: TextAlign.right,
                                style: AppTextStyles.tiny.copyWith(
                                  color: colors.primaryText.withValues(
                                    alpha: context.isAppDarkMode ? .78 : .68,
                                  ),
                                  fontSize: 13,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(width: 10),
                        if (selectionMode)
                          _SelectionMark(
                            selected: isSelected,
                            onTap: onSelectionTap ?? onTap,
                          )
                        else
                          const _MenuButtonIcon(),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 13),
                    child: Divider(
                      height: 1,
                      thickness: 1,
                      color: colors.border,
                    ),
                  ),
                  _SchoolSummary(schoolName: screen.schoolName),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

/// يمثل جزءا داخليا صغيرا من الواجهة لفصل التفاصيل عن الملف الرئيسي.
class _SchoolSummary extends StatelessWidget {
  const _SchoolSummary({required this.schoolName});

  final String schoolName;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;

    return Row(
      textDirection: TextDirection.rtl,
      children: [
        Container(
          height: 38,
          width: 38,
          decoration: BoxDecoration(
            color: colors.surfaceSoft,
            borderRadius: BorderRadius.circular(14),
          ),
          child: Center(
            child: AppSvgIcon(
              AppAssets.buildingsIcon,
              color: colors.accent,
              size: 21,
            ),
          ),
        ),
        const SizedBox(width: 11),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'المدرسة',
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.right,
                style: AppTextStyles.caption.copyWith(
                  color: colors.secondaryText,
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                schoolName,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.right,
                style: AppTextStyles.body.copyWith(
                  color: colors.primaryText,
                  fontSize: 15,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

/// يعرض عنصر تفاعل صغير موحد الشكل داخل الواجهة.
class _MenuButtonIcon extends StatelessWidget {
  const _MenuButtonIcon();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 38,
      width: 38,
      decoration: BoxDecoration(
        color: context.colors.surfaceSoft,
        borderRadius: BorderRadius.circular(14),
      ),
      child: Center(
        child: AppSvgIcon(
          AppAssets.menuDotsIcon,
          color: context.colors.icon,
          size: 22,
        ),
      ),
    );
  }
}

/// يمثل جزءا داخليا صغيرا من الواجهة لفصل التفاصيل عن الملف الرئيسي.
class _SelectionMark extends StatelessWidget {
  const _SelectionMark({required this.selected, this.onTap});

  final bool selected;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    const accent = Color(0xFF42AEB7);

    return GestureDetector(
      onTap: onTap,
      child: SizedBox(
        height: 38,
        width: 38,
        child: Center(
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 160),
            height: 22,
            width: 22,
            decoration: BoxDecoration(
              color: selected ? accent : Colors.transparent,
              border: Border.all(color: accent, width: 2),
              borderRadius: BorderRadius.circular(7),
            ),
            child: selected
                ? const Icon(Icons.check_rounded, color: Colors.white, size: 16)
                : null,
          ),
        ),
      ),
    );
  }
}
