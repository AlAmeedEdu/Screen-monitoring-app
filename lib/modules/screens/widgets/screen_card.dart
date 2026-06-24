import 'package:flutter/material.dart';

import '../../../core/constants/app_assets.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_radius.dart';
import '../../../core/theme/app_shadows.dart';
import '../../../core/theme/app_text_styles.dart';
import '../../../core/widgets/app_svg_icon.dart';
import '../../../data/models/monitor_item_model.dart';
import 'screen_action_buttons.dart';
import 'screen_info_row.dart';
import 'screen_status_badge.dart';

class ScreenCard extends StatelessWidget {
  const ScreenCard({required this.screen, super.key});

  final MonitorItemModel screen;

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Container(
        padding: const EdgeInsets.fromLTRB(16, 12, 16, 14),
        decoration: BoxDecoration(
          color: AppColors.surface,
          borderRadius: BorderRadius.circular(AppRadius.lg),
          boxShadow: AppShadows.card,
        ),
        child: Column(
          children: [
            Directionality(
              textDirection: TextDirection.ltr,
              child: Row(
                children: [
                  ScreenStatusBadge(status: screen.status),
                  const Spacer(),
                  Directionality(
                    textDirection: TextDirection.ltr,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          screen.name,
                          textAlign: TextAlign.right,
                          style: AppTextStyles.caption.copyWith(
                            color: const Color(0xFF42AEB7),
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          _formatDate(screen.lastSeen),
                          textAlign: TextAlign.right,
                          style: AppTextStyles.tiny
                              .copyWith(color: AppColors.textSecondary),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 10),
                  const AppSvgIcon(AppAssets.menuDotsIcon,
                      color: AppColors.primary, size: 22),
                ],
              ),
            ),
            const SizedBox(height: 20),
            Row(
              children: [
                Expanded(
                  flex: 3,
                  child: ScreenInfoRow(
                    title: 'المدرسة',
                    value: screen.schoolName,
                    iconAsset: AppAssets.buildingsIcon,
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  flex: 2,
                  child: ScreenInfoRow(
                    title: 'App status',
                    value: screen.appStatus,
                    iconAsset: AppAssets.sidebarIcon,
                    textDirection: TextDirection.ltr,
                  ),
                ),
              ],
            ),
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 16),
              child: Divider(height: 1, color: AppColors.border),
            ),
            Row(
              children: [
                Expanded(
                  child: ScreenInfoRow(
                    title: 'Mac Address',
                    value: screen.macAddress,
                    iconAsset: AppAssets.commandIcon,
                    textDirection: TextDirection.ltr,
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: ScreenInfoRow(
                    title: 'Ip Address',
                    value: screen.ipAddress,
                    iconAsset: AppAssets.wifiRouterIcon,
                    textDirection: TextDirection.ltr,
                  ),
                ),
              ],
            ),
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 16),
              child: Divider(height: 1, color: AppColors.border),
            ),
            Directionality(
              textDirection: TextDirection.ltr,
              child: Row(
                children: [
                  const ScreenActionButtons(),
                  const Spacer(),
                  Directionality(
                    textDirection: TextDirection.rtl,
                    child: Text(
                      'أجراء سريع',
                      textAlign: TextAlign.right,
                      style: AppTextStyles.caption.copyWith(
                        color: AppColors.textPrimary,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  String _formatDate(DateTime date) {
    String two(int value) => value.toString().padLeft(2, '0');
    return '${date.year}-${two(date.month)}-${two(date.day)} ${two(date.hour)}-${two(date.minute)}';
  }
}
