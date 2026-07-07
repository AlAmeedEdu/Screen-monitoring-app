import 'package:flutter/material.dart';

import '../../../core/enums/screen_status.dart';
import '../../../core/theme/app_palette.dart';
import '../../../core/theme/app_radius.dart';
import '../../../core/theme/app_text_styles.dart';

/// يعرض شارة حالة مختصرة بلون ونص مناسبين.
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
      ScreenStatus.online => context.colors.success,
      ScreenStatus.offline => context.colors.danger,
      ScreenStatus.maintenance => context.colors.warning,
    };
    final background = switch (status) {
      ScreenStatus.online => context.colors.successSoft,
      ScreenStatus.offline => context.colors.dangerSoft,
      ScreenStatus.maintenance => context.colors.warningSoft,
    };

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 13, vertical: 8),
      decoration: BoxDecoration(
        color: background,
        borderRadius: BorderRadius.circular(AppRadius.pill),
      ),
      child: Text(
        label,
        style: AppTextStyles.caption.copyWith(
          color: color,
          fontSize: 14,
          fontWeight: FontWeight.w700,
        ),
      ),
    );
  }
}
