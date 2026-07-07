part of '../screens_view.dart';

/// يمثل جزءا داخليا صغيرا من الواجهة لفصل التفاصيل عن الملف الرئيسي.
class _MonitorSummaryPanel extends StatelessWidget {
  const _MonitorSummaryPanel();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 168,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Container(
            height: 168,
            padding: const EdgeInsets.all(13),
            decoration: BoxDecoration(
              color: context.colors.surface,
              borderRadius: BorderRadius.circular(24),
            ),
            child: Column(
              children: [
                Row(
                  children: [
                    Expanded(
                      child: _ScreenStatTile(
                        title: 'أجمالي الشاشات النشطة',
                        value: '67 شاشة',
                        color: context.colors.surfaceSoft,
                        valueColor: const Color(0xFF39A8B3),
                      ),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: _ScreenStatTile(
                        title: 'أجمالي الشاشات المتوقفة',
                        value: '2 شاشة',
                        color: context.colors.dangerSoft,
                        valueColor: context.colors.danger,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 6),
                SizedBox(
                  width: double.infinity,
                  child: _ScreenStatTile(
                    title: 'أجمالي الشاشات المعطلة',
                    value: '4 شاشة',
                    color: context.isAppDarkMode
                        ? context.colors.surfaceSoft
                        : const Color(0xFFF6F6F6),
                    valueColor: context.isAppDarkMode
                        ? context.colors.secondaryText
                        : const Color(0xFF535758),
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

/// يمثل جزءا داخليا صغيرا من الواجهة لفصل التفاصيل عن الملف الرئيسي.
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

/// يمثل PanelAction كجزء من بنية المشروع ويجمع المسؤولية الخاصة به في مكان واحد.
class PanelAction extends StatelessWidget {
  const PanelAction(
      {required this.asset, required this.color, required this.bg, super.key});

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

/// يمثل جزءا داخليا صغيرا من الواجهة لفصل التفاصيل عن الملف الرئيسي.
class _EmptyScreens extends StatelessWidget {
  const _EmptyScreens();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 220,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: context.colors.surface,
        borderRadius: BorderRadius.circular(AppRadius.md),
      ),
      child: Text(
        'لا توجد شاشات مطابقة',
        textAlign: TextAlign.right,
        textDirection: TextDirection.rtl,
        style: AppTextStyles.body.copyWith(color: context.colors.secondaryText),
      ),
    );
  }
}
