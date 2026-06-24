import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/constants/app_assets.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_radius.dart';
import '../../../core/theme/app_text_styles.dart';
import '../../../core/widgets/app_text_field.dart';
import '../../../core/widgets/app_svg_icon.dart';
import '../../../core/widgets/app_search_field.dart';
import '../../../core/widgets/blurred_header_image.dart';
import '../controllers/screens_controller.dart';
import '../widgets/screen_card.dart';

class ScreensView extends GetView<ScreensController> {
  const ScreensView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: Directionality(
        textDirection: TextDirection.rtl,
        child: Obx(() {
          return Column(
            children: [
              const _ScreensHero(),
              Expanded(
                child: ListView(
                  padding: const EdgeInsets.only(bottom: 120),
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(20, 18, 20, 0),
                      child: Column(
                        children: [
                          if (controller.isLoading.value)
                            const SizedBox(
                                height: 240,
                                child:
                                    Center(child: CircularProgressIndicator()))
                          else if (controller.filteredScreens.isEmpty)
                            const _EmptyScreens()
                          else
                            for (final screen
                                in controller.filteredScreens) ...[
                              ScreenCard(screen: screen),
                              const SizedBox(height: 16),
                            ],
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          );
        }),
      ),
    );
  }
}

class _ScreensHero extends StatelessWidget {
  const _ScreensHero();

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      height: 349,
      child: Stack(
        children: [
          Positioned.fill(bottom: 149, child: _ScreensHeader()),
          Positioned(
            top: 117,
            left: 16,
            right: 16,
            child: _MonitorSummaryPanel(),
          ),
        ],
      ),
    );
  }
}

class _ScreensHeader extends StatelessWidget {
  const _ScreensHeader();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: Stack(
        fit: StackFit.expand,
        children: [
          const BlurredHeaderImage(
            asset: AppAssets.monitorsHeader,
            alignment: Alignment(0, -0.16),
            borderRadius: BorderRadius.vertical(bottom: Radius.circular(34)),
          ),
          Positioned(
            left: 16,
            top: 55,
            child: Directionality(
              textDirection: TextDirection.ltr,
              child: Row(
                children: [
                  _HeaderIconButton(
                    asset: AppAssets.tuningIcon,
                    onTap: () => _showFilterSheet(context),
                  ),
                  const SizedBox(width: 12),
                  _HeaderIconButton(
                    asset: AppAssets.searchIcon,
                    onTap: () => _showSearch(context),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            right: 16,
            top: 55,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Row(
                  children: [
                    const AppSvgIcon(AppAssets.monitorIcon,
                        color: AppColors.primary, size: 22),
                    const SizedBox(width: 7),
                    Text(
                      'شاشات المدرسة',
                      textAlign: TextAlign.right,
                      textDirection: TextDirection.rtl,
                      style: AppTextStyles.title.copyWith(
                        color: Colors.black,
                        fontSize: 19,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 5),
                Text(
                  'أدارة ومتابعة جميع شاشات المدرسة',
                  textAlign: TextAlign.right,
                  textDirection: TextDirection.rtl,
                  style: AppTextStyles.tiny
                      .copyWith(color: const Color(0xFF596466)),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _HeaderIconButton extends StatelessWidget {
  const _HeaderIconButton({required this.asset, required this.onTap});

  final String asset;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: AppColors.surface,
      borderRadius: BorderRadius.circular(14),
      elevation: 1,
      shadowColor: Colors.black12,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(14),
        child: SizedBox(
          height: 44,
          width: 44,
          child: Center(
              child:
                  AppSvgIcon(asset, color: const Color(0xFF42AEB7), size: 20)),
        ),
      ),
    );
  }
}

void _showSearch(BuildContext context) {
  final controller = Get.find<ScreensController>();
  showModalBottomSheet<void>(
    context: context,
    backgroundColor: AppColors.surface,
    shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(28))),
    builder: (context) => Padding(
      padding: EdgeInsets.fromLTRB(
          16, 22, 16, MediaQuery.viewInsetsOf(context).bottom + 22),
      child: AppSearchField(
          hintText: 'بحث عن شاشة أو مدرسة', onChanged: controller.setQuery),
    ),
  );
}

void _showFilterSheet(BuildContext context) {
  showModalBottomSheet<void>(
    context: context,
    isScrollControlled: true,
    backgroundColor: Colors.transparent,
    barrierColor: Colors.black.withValues(alpha: .58),
    builder: (context) => const _ScreensFilterSheet(),
  );
}

class _ScreensFilterSheet extends StatefulWidget {
  const _ScreensFilterSheet();

  @override
  State<_ScreensFilterSheet> createState() => _ScreensFilterSheetState();
}

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
          MediaQuery.paddingOf(context).bottom + 30,
        ),
        decoration: const BoxDecoration(
          color: AppColors.surface,
          borderRadius: BorderRadius.vertical(top: Radius.circular(28)),
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
                      color: AppColors.textPrimary,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                  const SizedBox(width: 8),
                  const AppSvgIcon(
                    AppAssets.monitorIcon,
                    color: AppColors.primary,
                    size: 18,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 3),
            Text(
              'قم بفلترة الشاشات',
              style: AppTextStyles.tiny.copyWith(
                color: AppColors.textSecondary.withValues(alpha: .55),
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
                color: const Color(0xFF42AEB7),
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
            color: AppColors.secondary50,
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
      fillColor: const Color(0xFFF5F8F8),
      focusedFillColor: const Color(0xFFEAF7F9),
      iconColor: const Color(0xFFD1DEE0),
      focusedIconColor: const Color(0xFF42AEB7),
      hintFontSize: 14,
    );
  }
}

class _MonitorSummaryPanel extends StatelessWidget {
  const _MonitorSummaryPanel();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 232,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Container(
            height: 231,
            padding: const EdgeInsets.all(14),
            decoration: BoxDecoration(
              color: AppColors.surface,
              borderRadius: BorderRadius.circular(30),
            ),
            child: const Column(
              children: [
                Row(
                  children: [
                    Expanded(
                      child: _ScreenStatTile(
                        title: 'أجمالي الشاشات النشطة',
                        value: '67 شاشة',
                        color: AppColors.secondary50,
                        valueColor: Color(0xFF39A8B3),
                      ),
                    ),
                    SizedBox(width: 10),
                    Expanded(
                      child: _ScreenStatTile(
                        title: 'أجمالي الشاشات المتوقفة',
                        value: '2 شاشة',
                        color: AppColors.dangerSoft,
                        valueColor: AppColors.danger,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 6),
                SizedBox(
                  width: double.infinity,
                  child: _ScreenStatTile(
                    title: 'أجمالي الشاشات المعطلة',
                    value: '4 شاشة',
                    color: Color(0xFFF6F6F6),
                    valueColor: Color(0xFF535758),
                  ),
                ),
              ],
            ),
          ),
          PositionedDirectional(
            start: 14,
            end: 14,
            bottom: 13,
            child: Container(
              height: 55,
              padding: const EdgeInsets.symmetric(horizontal: 20),
              decoration: BoxDecoration(
                color: Colors.transparent,
                borderRadius: BorderRadius.circular(22),
              ),
              child: const Directionality(
                textDirection: TextDirection.ltr,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    _PanelAction(
                        asset: AppAssets.trashIcon,
                        color: AppColors.danger,
                        bg: Color(0xFFFFF3F5)),
                    _PanelAction(
                        asset: AppAssets.powerIcon,
                        color: AppColors.danger,
                        bg: Color(0xFFFFF3F5)),
                    _PanelAction(
                        asset: AppAssets.penIcon,
                        color: Color(0xFFF2A400),
                        bg: Color(0xFFFFFBF4)),
                    _PanelAction(
                        asset: AppAssets.inboxIcon,
                        color: Color(0xFF2F75DF),
                        bg: Color(0xFFF4F9FF)),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _ScreenStatTile extends StatelessWidget {
  const _ScreenStatTile({
    required this.title,
    required this.value,
    required this.color,
    required this.valueColor,
  });

  final String title;
  final String value;
  final Color color;
  final Color valueColor;

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Container(
        height: 67,
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(18),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                AppSvgIcon(AppAssets.sidebarIcon,
                    size: 13, color: valueColor.withValues(alpha: .72)),
                const SizedBox(width: 4),
                Flexible(
                  child: Text(
                    title,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.right,
                    style: AppTextStyles.tiny
                        .copyWith(color: valueColor.withValues(alpha: .72)),
                  ),
                ),
              ],
            ),
            const Spacer(),
            Text(
              value,
              textAlign: TextAlign.right,
              style: AppTextStyles.title.copyWith(
                  color: valueColor, fontSize: 28, fontWeight: FontWeight.w800),
            ),
          ],
        ),
      ),
    );
  }
}

class _PanelAction extends StatelessWidget {
  const _PanelAction(
      {required this.asset, required this.color, required this.bg});

  final String asset;
  final Color color;
  final Color bg;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: bg,
      borderRadius: BorderRadius.circular(14),
      child: InkWell(
        onTap: () => ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
              content: Text('تم تنفيذ الإجراء السريع'),
              duration: Duration(milliseconds: 900)),
        ),
        borderRadius: BorderRadius.circular(14),
        child: SizedBox(
          height: 55,
          width: 55,
          child: Center(child: AppSvgIcon(asset, color: color, size: 20)),
        ),
      ),
    );
  }
}

class _EmptyScreens extends StatelessWidget {
  const _EmptyScreens();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 220,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(AppRadius.md),
      ),
      child: Text(
        'لا توجد شاشات مطابقة',
        textAlign: TextAlign.right,
        textDirection: TextDirection.rtl,
        style: AppTextStyles.body.copyWith(color: AppColors.textSecondary),
      ),
    );
  }
}
