part of '../screens_view.dart';

/// يمثل جزءا داخليا صغيرا من الواجهة لفصل التفاصيل عن الملف الرئيسي.
class _AddMonitorSheet extends StatefulWidget {
  const _AddMonitorSheet();

  @override
  State<_AddMonitorSheet> createState() => _AddMonitorSheetState();
}

/// يمثل جزءا داخليا صغيرا من الواجهة لفصل التفاصيل عن الملف الرئيسي.
class _AddMonitorSheetState extends State<_AddMonitorSheet> {
  final nameController = TextEditingController();
  final schoolController = TextEditingController();
  final ipController = TextEditingController();
  final macController = TextEditingController();

  @override
  void dispose() {
    nameController.dispose();
    schoolController.dispose();
    ipController.dispose();
    macController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final bottomPadding = MediaQuery.of(context).padding.bottom;
    final keyboardInset = MediaQuery.of(context).viewInsets.bottom;

    return Directionality(
      textDirection: TextDirection.rtl,
      child: AnimatedPadding(
        duration: const Duration(milliseconds: 220),
        curve: Curves.easeOut,
        padding: EdgeInsets.only(bottom: keyboardInset),
        child: Container(
          width: double.infinity,
          padding: EdgeInsets.fromLTRB(13, 8, 13, bottomPadding + 14),
          decoration: BoxDecoration(
            color: context.colors.surface,
            borderRadius: const BorderRadius.vertical(top: Radius.circular(28)),
          ),
          child: SingleChildScrollView(
            keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const _SheetHandle(width: 48),
                const SizedBox(height: 14),
                const _SheetTitle(
                  title: 'إضافة شاشة جديدة',
                  subtitle: 'قم بتسجيل معلومات الشاشة الجديدة',
                  icon: AppAssets.monitorIcon,
                ),
                const SizedBox(height: 16),
                _AddMonitorField(
                  controller: nameController,
                  hint: 'أسم الشاشة',
                ),
                const SizedBox(height: 10),
                _AddMonitorField(
                  controller: schoolController,
                  hint: 'المدرسة',
                ),
                const SizedBox(height: 10),
                _AddMonitorField(
                  controller: ipController,
                  hint: 'IP Address',
                ),
                const SizedBox(height: 10),
                _AddMonitorField(
                  controller: macController,
                  hint: 'Mac Address',
                ),
                const SizedBox(height: 18),
                SizedBox(
                  width: double.infinity,
                  height: 54,
                  child: Material(
                    color: context.colors.accent,
                    borderRadius: BorderRadius.circular(12),
                    child: InkWell(
                      onTap: () => Navigator.of(context).pop(),
                      borderRadius: BorderRadius.circular(12),
                      child: Center(
                        child: Text(
                          'إضافة الشاشة',
                          style: AppTextStyles.subtitle.copyWith(
                            color: AppColors.surface,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

/// يعرض حقل إدخال موحد الشكل ويستقبل النص من المستخدم.
class _AddMonitorField extends StatelessWidget {
  const _AddMonitorField({
    required this.controller,
    required this.hint,
  });

  final TextEditingController controller;
  final String hint;

  @override
  Widget build(BuildContext context) {
    return AppTextField(
      controller: controller,
      hintText: hint,
      iconAsset: AppAssets.userIcon,
      height: 51,
      radius: 12,
      borderColor: Colors.transparent,
      fillColor: context.colors.surfaceSoft,
      focusedFillColor: context.colors.accentSoft,
      iconColor: context.colors.hintText,
      focusedIconColor: context.colors.accent,
      hintFontSize: 14,
    );
  }
}

/// يمثل جزءا داخليا صغيرا من الواجهة لفصل التفاصيل عن الملف الرئيسي.
class _SheetHandle extends StatelessWidget {
  const _SheetHandle({this.width = 52});

  final double width;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 4,
      width: width,
      decoration: BoxDecoration(
        color: context.colors.accent,
        borderRadius: BorderRadius.circular(AppRadius.pill),
      ),
    );
  }
}

/// يمثل جزءا داخليا صغيرا من الواجهة لفصل التفاصيل عن الملف الرئيسي.
class _SheetTitle extends StatelessWidget {
  const _SheetTitle({
    required this.title,
    required this.icon,
    this.subtitle,
  });

  final String title;
  final String? subtitle;
  final String icon;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Directionality(
          textDirection: TextDirection.ltr,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                title,
                style: AppTextStyles.subtitle.copyWith(
                  color: context.colors.primaryText,
                  fontWeight: FontWeight.w800,
                ),
              ),
              const SizedBox(width: 8),
              AppSvgIcon(icon, color: context.colors.icon, size: 20),
            ],
          ),
        ),
        if (subtitle != null) ...[
          const SizedBox(height: 5),
          Text(
            subtitle!,
            textAlign: TextAlign.center,
            style: AppTextStyles.tiny.copyWith(
              color: context.colors.secondaryText,
            ),
          ),
        ],
      ],
    );
  }
}
