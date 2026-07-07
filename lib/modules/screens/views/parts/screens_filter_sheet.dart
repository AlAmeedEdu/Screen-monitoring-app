part of '../screens_view.dart';

/// يمثل جزءا داخليا صغيرا من الواجهة لفصل التفاصيل عن الملف الرئيسي.
class _ScreensFilterSheet extends StatefulWidget {
  const _ScreensFilterSheet();

  @override
  State<_ScreensFilterSheet> createState() => _ScreensFilterSheetState();
}

/// يمثل جزءا داخليا صغيرا من الواجهة لفصل التفاصيل عن الملف الرئيسي.
class _ScreensFilterSheetState extends State<_ScreensFilterSheet> {
  final schoolController = TextEditingController();
  final classController = TextEditingController();
  final fromDateController = TextEditingController();
  final toDateController = TextEditingController();
  var selectedStatus = 'الكل';

  @override
  void dispose() {
    schoolController.dispose();
    classController.dispose();
    fromDateController.dispose();
    toDateController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.fromLTRB(
          13,
          8,
          13,
          MediaQuery.of(context).padding.bottom + 30,
        ),
        decoration: BoxDecoration(
          color: context.colors.surface,
          borderRadius: const BorderRadius.vertical(top: Radius.circular(28)),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              height: 4,
              width: 48,
              decoration: BoxDecoration(
                color: const Color(0xFF42AEB7),
                borderRadius: BorderRadius.circular(AppRadius.pill),
              ),
            ),
            const SizedBox(height: 7),
            Directionality(
              textDirection: TextDirection.ltr,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'فلترة الشاشات',
                    style: AppTextStyles.subtitle.copyWith(
                      color: context.colors.primaryText,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                  const SizedBox(width: 8),
                  AppSvgIcon(
                    AppAssets.monitorIcon,
                    color: context.colors.icon,
                    size: 18,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 3),
            Text(
              'قم بفلترة الشاشات',
              style: AppTextStyles.tiny.copyWith(
                color: context.colors.secondaryText.withValues(alpha: .55),
              ),
            ),
            const SizedBox(height: 14),
            Row(
              children: [
                Expanded(
                  child: _FilterStatusChip(
                    label: 'in active',
                    selected: selectedStatus == 'in active',
                    onTap: () => setState(() => selectedStatus = 'in active'),
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: _FilterStatusChip(
                    label: 'disable',
                    selected: selectedStatus == 'disable',
                    onTap: () => setState(() => selectedStatus = 'disable'),
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: _FilterStatusChip(
                    label: 'Active',
                    selected: selectedStatus == 'Active',
                    onTap: () => setState(() => selectedStatus = 'Active'),
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: _FilterStatusChip(
                    label: 'الكل',
                    selected: selectedStatus == 'الكل',
                    onTap: () => setState(() => selectedStatus = 'الكل'),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 9),
            _FilterField(controller: schoolController, hint: 'المدرسة'),
            const SizedBox(height: 9),
            _FilterField(controller: classController, hint: 'الصف'),
            const SizedBox(height: 9),
            _FilterField(controller: fromDateController, hint: 'من تاريخ'),
            const SizedBox(height: 9),
            _FilterField(controller: toDateController, hint: 'الى تاريخ'),
            const SizedBox(height: 24),
            SizedBox(
              width: double.infinity,
              height: 51,
              child: Material(
                color: context.colors.accent,
                borderRadius: BorderRadius.circular(12),
                child: InkWell(
                  onTap: () => Navigator.of(context).pop(),
                  borderRadius: BorderRadius.circular(12),
                  child: Center(
                    child: Text(
                      'تطبيق الفلتر',
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
    );
  }
}

/// يمثل جزءا داخليا صغيرا من الواجهة لفصل التفاصيل عن الملف الرئيسي.
class _FilterStatusChip extends StatelessWidget {
  const _FilterStatusChip({
    required this.label,
    required this.selected,
    required this.onTap,
  });

  final String label;
  final bool selected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final color = selected ? const Color(0xFF42AEB7) : const Color(0xFF87CED4);

    return Material(
      color: Colors.transparent,
      borderRadius: BorderRadius.circular(12),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(12),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 160),
          height: 58,
          decoration: BoxDecoration(
            color: context.colors.surfaceSoft,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(
              color: selected ? const Color(0xFF42AEB7) : Colors.transparent,
              width: 1.2,
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AppSvgIcon(AppAssets.sidebarIcon, color: color, size: 14),
              const SizedBox(height: 5),
              Text(
                label,
                textAlign: TextAlign.center,
                style: AppTextStyles.tiny.copyWith(
                  color: color,
                  fontSize: 9,
                  fontWeight: selected ? FontWeight.w600 : FontWeight.w400,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

/// يعرض حقل إدخال موحد الشكل ويستقبل النص من المستخدم.
class _FilterField extends StatelessWidget {
  const _FilterField({required this.controller, required this.hint});

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
