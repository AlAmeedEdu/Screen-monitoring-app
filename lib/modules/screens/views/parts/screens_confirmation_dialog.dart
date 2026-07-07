part of '../screens_view.dart';

/// يفتح نافذة أو sheet لعرض إجراء مرتبط بالشاشة الحالية.
void _showDeleteConfirmation(BuildContext context) {
  _showScreenConfirmationDialog(
    context,
    icon: AppAssets.trashIcon,
    iconColor: const Color(0xFFEF4444),
    iconBackground: const Color(0xFFEF4444),
    title: 'هل أنت متأكد من حذف الشاشة ؟',
    message:
        'بعد الضغط على “حذف” سيقوم النظام بحذف الشاشة ولايمكن التراجع بعد هذا الإجراء',
    confirmText: 'حذف',
    confirmColor: const Color(0xFFEF4444),
    cancelColor: const Color(0xFFFEE2E2),
    cancelTextColor: const Color(0xFFEF4444),
  );
}

/// يفتح نافذة أو sheet لعرض إجراء مرتبط بالشاشة الحالية.
void _showShutdownConfirmation(BuildContext context) {
  _showScreenConfirmationDialog(
    context,
    icon: AppAssets.powerIcon,
    iconColor: Colors.white,
    iconBackground: context.colors.accent,
    title: 'هل أنت متأكد من اطفاء الشاشة ؟',
    confirmText: 'أطفاء',
    confirmColor: context.colors.accent,
    cancelColor: context.colors.accentSoft,
    cancelTextColor: context.colors.accent,
  );
}

/// يفتح نافذة أو sheet لعرض إجراء مرتبط بالشاشة الحالية.
void _showScreenConfirmationDialog(
  BuildContext context, {
  required String icon,
  required Color iconColor,
  required Color iconBackground,
  required String title,
  String? message,
  required String confirmText,
  required Color confirmColor,
  required Color cancelColor,
  required Color cancelTextColor,
}) {
  final controller = Get.find<ScreensController>();

  showDialog<void>(
    context: context,
    barrierColor: Colors.black.withValues(alpha: .60),
    builder: (dialogContext) {
      return Directionality(
        textDirection: TextDirection.rtl,
        child: Dialog(
          insetPadding: const EdgeInsets.symmetric(horizontal: 20),
          backgroundColor: Colors.transparent,
          child: Container(
            width: 324,
            padding: const EdgeInsets.fromLTRB(20, 20, 20, 22),
            decoration: BoxDecoration(
              color: context.colors.surface,
              borderRadius: BorderRadius.circular(52),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withValues(alpha: .12),
                  blurRadius: 18,
                  offset: const Offset(0, 8),
                ),
              ],
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(
                  height: 102,
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      const _DialogDot(top: 10, left: 38, size: 10),
                      const _DialogDot(top: 8, right: 43, size: 5),
                      const _DialogDot(bottom: 22, left: 32, size: 5),
                      const _DialogDot(bottom: 34, right: 30, size: 7),
                      Container(
                        height: 64,
                        width: 64,
                        decoration: BoxDecoration(
                          color: iconBackground,
                          shape: BoxShape.circle,
                        ),
                        child: Center(
                          child: AppSvgIcon(icon, color: iconColor, size: 36),
                        ),
                      ),
                    ],
                  ),
                ),
                Text(
                  title,
                  textAlign: TextAlign.center,
                  style: AppTextStyles.subtitle.copyWith(
                    color: context.colors.primaryText,
                    fontSize: 19,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                if (message != null) ...[
                  const SizedBox(height: 12),
                  Text(
                    message,
                    textAlign: TextAlign.center,
                    style: AppTextStyles.caption.copyWith(
                      color: const Color(0xFFEF4444),
                      height: 1.65,
                    ),
                  ),
                ],
                const SizedBox(height: 20),
                _DialogButton(
                  text: confirmText,
                  color: confirmColor,
                  textColor: Colors.white,
                  onTap: () {
                    controller.clearSelection();
                    Navigator.of(dialogContext).pop();
                  },
                ),
                const SizedBox(height: 16),
                _DialogButton(
                  text: 'الغاء',
                  color: cancelColor,
                  textColor: cancelTextColor,
                  onTap: () => Navigator.of(dialogContext).pop(),
                ),
              ],
            ),
          ),
        ),
      );
    },
  );
}

/// يمثل جزءا داخليا صغيرا من الواجهة لفصل التفاصيل عن الملف الرئيسي.
class _DialogDot extends StatelessWidget {
  const _DialogDot({
    this.top,
    this.left,
    this.right,
    this.bottom,
    required this.size,
  });

  final double? top;
  final double? left;
  final double? right;
  final double? bottom;
  final double size;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: top,
      left: left,
      right: right,
      bottom: bottom,
      child: Container(
        height: size,
        width: size,
        decoration: BoxDecoration(
          color: context.colors.accent.withValues(alpha: .18),
          shape: BoxShape.circle,
        ),
      ),
    );
  }
}

/// يعرض عنصر تفاعل صغير موحد الشكل داخل الواجهة.
class _DialogButton extends StatelessWidget {
  const _DialogButton({
    required this.text,
    required this.color,
    required this.textColor,
    required this.onTap,
  });

  final String text;
  final Color color;
  final Color textColor;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: color,
      borderRadius: BorderRadius.circular(AppRadius.pill),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(AppRadius.pill),
        child: SizedBox(
          height: 58,
          width: 270,
          child: Center(
            child: Text(
              text,
              style: AppTextStyles.subtitle.copyWith(
                color: textColor,
                fontSize: 20,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
