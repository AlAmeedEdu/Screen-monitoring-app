part of '../screens_view.dart';

/// يمثل جزءا داخليا صغيرا من الواجهة لفصل التفاصيل عن الملف الرئيسي.
class _ScreensHero extends StatelessWidget {
  const _ScreensHero();

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      height: 386,
      child: Stack(
        children: [
          Positioned.fill(bottom: 186, child: _ScreensHeader()),
          Positioned(
            top: 117,
            left: 16,
            right: 16,
            child: _MonitorSummaryPanel(),
          ),
          Positioned(
            top: 304,
            left: 16,
            right: 16,
            child: _MonitorsSearchBar(),
          ),
        ],
      ),
    );
  }
}

/// يبني ترويسة هذا القسم ويجمع عناصرها البصرية في مكان واحد.
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
                    icon: Icons.add_circle_outline_rounded,
                    onTap: () => _showAddMonitorSheet(context),
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
                    AppSvgIcon(AppAssets.monitorIcon,
                        color: context.colors.primaryText, size: 22),
                    const SizedBox(width: 7),
                    Text(
                      'شاشات المدرسة',
                      textAlign: TextAlign.right,
                      textDirection: TextDirection.rtl,
                      style: AppTextStyles.title.copyWith(
                        color: context.colors.primaryText,
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
                  style: AppTextStyles.tiny.copyWith(
                    color: context.colors.secondaryText,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

/// يعرض عنصر تفاعل صغير موحد الشكل داخل الواجهة.
class _HeaderIconButton extends StatelessWidget {
  const _HeaderIconButton({required this.onTap, this.asset, this.icon})
      : assert(asset != null || icon != null);

  final String? asset;
  final IconData? icon;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: context.colors.surface,
      borderRadius: BorderRadius.circular(14),
      elevation: 1,
      shadowColor: context.isAppDarkMode
          ? Colors.black.withValues(alpha: .36)
          : Colors.black12,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(14),
        child: SizedBox(
          height: 44,
          width: 44,
          child: Center(
            child: asset == null
                ? Icon(icon, color: context.colors.accent, size: 23)
                : AppSvgIcon(
                    asset!,
                    color: context.colors.accent,
                    size: 20,
                  ),
          ),
        ),
      ),
    );
  }
}

/// يمثل جزءا داخليا صغيرا من الواجهة لفصل التفاصيل عن الملف الرئيسي.
class _MonitorsSearchBar extends StatelessWidget {
  const _MonitorsSearchBar();

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<ScreensController>();

    return AppSearchField(
      hintText: 'بحث عن اسم شاشة , ip,mac address...',
      onChanged: controller.setQuery,
    );
  }
}

/// يفتح نافذة أو sheet لعرض إجراء مرتبط بالشاشة الحالية.
void showScreensSearchSheet(BuildContext context) {
  final controller = Get.find<ScreensController>();
  showModalBottomSheet<void>(
    context: context,
    backgroundColor: context.colors.surface,
    shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(28))),
    builder: (context) => Padding(
      padding: EdgeInsets.fromLTRB(
          16, 22, 16, MediaQuery.of(context).viewInsets.bottom + 22),
      child: AppSearchField(
          hintText: 'بحث عن شاشة أو مدرسة', onChanged: controller.setQuery),
    ),
  );
}

/// يفتح نافذة أو sheet لعرض إجراء مرتبط بالشاشة الحالية.
void _showFilterSheet(BuildContext context) {
  showModalBottomSheet<void>(
    context: context,
    isScrollControlled: true,
    backgroundColor: Colors.transparent,
    barrierColor: Colors.black.withValues(alpha: .58),
    builder: (context) => const _ScreensFilterSheet(),
  );
}

/// يفتح نافذة أو sheet لعرض إجراء مرتبط بالشاشة الحالية.
void _showAddMonitorSheet(BuildContext context) {
  showModalBottomSheet<void>(
    context: context,
    isScrollControlled: true,
    backgroundColor: Colors.transparent,
    barrierColor: Colors.black.withValues(alpha: .58),
    builder: (context) => const _AddMonitorSheet(),
  );
}
