import 'package:flutter/material.dart';

import '../../../core/enums/screen_status.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_radius.dart';
import '../../../core/theme/app_text_styles.dart';

class ScreenStatusBadge extends StatelessWidget {
  const ScreenStatusBadge({required this.status, super.key});

  final ScreenStatus status;

  @override
  Widget build(BuildContext context) {
    final label = switch (status) {
      ScreenStatus.online => 'Active',
      ScreenStatus.offline => 'Offline',
      ScreenStatus.maintenance => 'Maintenance',
    };
    final color = switch (status) {
      ScreenStatus.online => AppColors.success,
      ScreenStatus.offline => AppColors.danger,
      ScreenStatus.maintenance => AppColors.warning,
    };
    final background = switch (status) {
      ScreenStatus.online => const Color(0xFFDDFBE9),
      ScreenStatus.offline => AppColors.dangerSoft,
      ScreenStatus.maintenance => AppColors.warningSoft,
    };

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 7),
      decoration: BoxDecoration(
        color: background,
        borderRadius: BorderRadius.circular(AppRadius.pill),
      ),
      child: Text(
        label,
        style: AppTextStyles.tiny
            .copyWith(color: color, fontWeight: FontWeight.w600),
      ),
    );
  }
}
