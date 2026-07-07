part of '../screen_details_view.dart';

/// يعرض بطاقة واجهة قابلة لإعادة الاستخدام داخل هذه الميزة.
class _DetailsCard extends StatelessWidget {
  const _DetailsCard({required this.screen});

  final MonitorItemModel screen;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 398,
      padding: const EdgeInsets.fromLTRB(12, 12, 12, 14),
      decoration: BoxDecoration(
        color: context.colors.surface,
        borderRadius: BorderRadius.circular(24),
        boxShadow: AppShadows.cardFor(context),
      ),
      child: Column(
        children: [
          _ScreenNameRow(screen: screen),
          _DetailsDivider(),
          _DetailsInfoRow(
            title: 'المدرسة',
            value: screen.schoolName,
            iconAsset: AppAssets.buildingsIcon,
          ),
          _DetailsDivider(),
          _DetailsInfoRow(
            title: 'IP Address',
            value: screen.ipAddress,
            iconAsset: AppAssets.translationIcon,
            valueDirection: TextDirection.ltr,
          ),
          _DetailsDivider(),
          _DetailsInfoRow(
            title: 'Mac Address',
            value: screen.macAddress,
            iconAsset: AppAssets.outlineSidebarIcon,
            valueDirection: TextDirection.ltr,
          ),
          _DetailsDivider(),
          _DetailsInfoRow(
            title: 'App Status',
            value: screen.appStatus,
            iconAsset: AppAssets.magicStickIcon,
            valueDirection: TextDirection.ltr,
          ),
        ],
      ),
    );
  }
}

/// يمثل جزءا داخليا صغيرا من الواجهة لفصل التفاصيل عن الملف الرئيسي.
class _ScreenNameRow extends StatelessWidget {
  const _ScreenNameRow({required this.screen});

  final MonitorItemModel screen;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 58,
      child: Directionality(
        textDirection: TextDirection.ltr,
        child: Row(
          children: [
            ScreenStatusBadge(status: screen.status),
            const Spacer(),
            _DetailsLabelValue(
              title: 'أسم الشاشة',
              value: screen.name,
              valueColor: context.colors.accent,
              width: 168,
              titleFontSize: 14,
              valueFontSize: 20,
              valueDirection: TextDirection.ltr,
            ),
            const SizedBox(width: 8),
            const _DetailsIcon(asset: AppAssets.tabletIcon, size: 22),
          ],
        ),
      ),
    );
  }
}

/// يمثل جزءا داخليا صغيرا من الواجهة لفصل التفاصيل عن الملف الرئيسي.
class _DetailsInfoRow extends StatelessWidget {
  const _DetailsInfoRow({
    required this.title,
    required this.value,
    required this.iconAsset,
    this.valueDirection = TextDirection.rtl,
  });

  final String title;
  final String value;
  final String iconAsset;
  final TextDirection valueDirection;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 58,
      child: Directionality(
        textDirection: TextDirection.ltr,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Expanded(
              child: _DetailsLabelValue(
                title: title,
                value: value,
                width: double.infinity,
                titleFontSize: 14,
                valueFontSize: 18,
                valueDirection: valueDirection,
              ),
            ),
            const SizedBox(width: 8),
            _DetailsIcon(asset: iconAsset, size: 22),
          ],
        ),
      ),
    );
  }
}

/// يمثل جزءا داخليا صغيرا من الواجهة لفصل التفاصيل عن الملف الرئيسي.
class _DetailsLabelValue extends StatelessWidget {
  const _DetailsLabelValue({
    required this.title,
    required this.value,
    required this.width,
    this.valueColor,
    this.titleFontSize = 16,
    this.valueFontSize = 20,
    this.valueDirection = TextDirection.rtl,
  });

  final String title;
  final String value;
  final double width;
  final Color? valueColor;
  final double titleFontSize;
  final double valueFontSize;
  final TextDirection valueDirection;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            title,
            textAlign: TextAlign.right,
            style: AppTextStyles.tiny.copyWith(
              color: context.colors.secondaryText,
              fontSize: titleFontSize,
              height: 1,
              fontWeight: FontWeight.w300,
            ),
          ),
          const SizedBox(height: 5),
          Directionality(
            textDirection: valueDirection,
            child: Text(
              value,
              textAlign: TextAlign.right,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: AppTextStyles.caption.copyWith(
                color: valueColor ?? context.colors.primaryText,
                fontSize: valueFontSize,
                height: 1.05,
                fontWeight:
                    valueColor == null ? FontWeight.w400 : FontWeight.w600,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

/// يعرض عنصر تفاعل صغير موحد الشكل داخل الواجهة.
class _DetailsIcon extends StatelessWidget {
  const _DetailsIcon({required this.asset, required this.size});

  final String asset;
  final double size;

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
        child: AppSvgIcon(asset, color: context.colors.accent, size: size),
      ),
    );
  }
}

/// يمثل جزءا داخليا صغيرا من الواجهة لفصل التفاصيل عن الملف الرئيسي.
class _DetailsDivider extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Divider(height: 1, color: context.colors.border),
    );
  }
}

/// يعرض بطاقة واجهة قابلة لإعادة الاستخدام داخل هذه الميزة.
class _DetailsActionsCard extends StatelessWidget {
  const _DetailsActionsCard();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      padding: const EdgeInsets.fromLTRB(13, 14, 13, 12),
      decoration: BoxDecoration(
        color: context.colors.surface,
        borderRadius: BorderRadius.circular(24),
        boxShadow: AppShadows.cardFor(context),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Directionality(
            textDirection: TextDirection.ltr,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  'أجراءات الشاشة',
                  style: AppTextStyles.caption.copyWith(
                    color: context.colors.primaryText,
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    height: 1,
                  ),
                ),
                const SizedBox(width: 6),
                AppSvgIcon(
                  AppAssets.widgetIcon,
                  color: context.colors.icon,
                  size: 16,
                ),
              ],
            ),
          ),
          const SizedBox(height: 7),
          const Directionality(
            textDirection: TextDirection.ltr,
            child: Center(
              child: ScreenActionButtons(size: 38, spacing: 28, radius: 13),
            ),
          ),
        ],
      ),
    );
  }
}
