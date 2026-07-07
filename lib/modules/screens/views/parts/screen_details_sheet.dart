part of '../screens_view.dart';

/// يفتح نافذة أو sheet لعرض إجراء مرتبط بالشاشة الحالية.
void _showScreenDetailsSheet(BuildContext context, MonitorItemModel screen) {
  showModalBottomSheet<void>(
    context: context,
    isScrollControlled: true,
    backgroundColor: Colors.transparent,
    barrierColor: Colors.black.withValues(alpha: .58),
    builder: (sheetContext) => _ScreenDetailsSheet(screen: screen),
  );
}

/// يمثل جزءا داخليا صغيرا من الواجهة لفصل التفاصيل عن الملف الرئيسي.
class _ScreenDetailsSheet extends StatelessWidget {
  const _ScreenDetailsSheet({required this.screen});

  final MonitorItemModel screen;

  @override
  Widget build(BuildContext context) {
    final bottomPadding = MediaQuery.of(context).padding.bottom;

    return Directionality(
      textDirection: TextDirection.rtl,
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.fromLTRB(13, 8, 13, bottomPadding + 18),
        decoration: BoxDecoration(
          color: context.colors.surface,
          borderRadius: const BorderRadius.vertical(top: Radius.circular(28)),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const _SheetHandle(width: 48),
            const SizedBox(height: 14),
            const _SheetTitle(
              title: 'تفاصيل الشاشة',
              icon: AppAssets.monitorIcon,
            ),
            const SizedBox(height: 12),
            Divider(height: 1, color: context.colors.border),
            _SheetInfoCard(screen: screen),
            Divider(height: 1, color: context.colors.border),
            const SizedBox(height: 10),
            _SheetActionsRow(
              onDelete: () {
                Navigator.of(context).pop();
                _showDeleteConfirmation(context);
              },
              onPower: () {
                Navigator.of(context).pop();
                _showShutdownConfirmation(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}

/// يمثل جزءا داخليا صغيرا من الواجهة لفصل التفاصيل عن الملف الرئيسي.
class _SheetActionsRow extends StatelessWidget {
  const _SheetActionsRow({required this.onDelete, required this.onPower});

  final VoidCallback onDelete;
  final VoidCallback onPower;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Directionality(
          textDirection: TextDirection.ltr,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                'إجراءات الشاشة',
                style: AppTextStyles.caption.copyWith(
                  color: context.colors.primaryText,
                  fontSize: 15,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(width: 7),
              AppSvgIcon(
                AppAssets.widgetIcon,
                color: context.colors.icon,
                size: 17,
              ),
            ],
          ),
        ),
        const SizedBox(height: 14),
        Directionality(
          textDirection: TextDirection.ltr,
          child: Center(
            child: ScreenActionButtons(
              size: 40,
              spacing: 28,
              radius: 13,
              onDelete: onDelete,
              onPower: onPower,
            ),
          ),
        ),
      ],
    );
  }
}

/// يعرض بطاقة واجهة قابلة لإعادة الاستخدام داخل هذه الميزة.
class _SheetInfoCard extends StatelessWidget {
  const _SheetInfoCard({required this.screen});

  final MonitorItemModel screen;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _SheetScreenNameRow(screen: screen),
        _SheetDivider(),
        _SheetInfoRow(
          title: 'المدرسة',
          value: screen.schoolName,
          icon: AppAssets.buildingsIcon,
        ),
        _SheetDivider(),
        _SheetInfoRow(
          title: 'IP Address',
          value: screen.ipAddress,
          icon: AppAssets.translationIcon,
          valueDirection: TextDirection.ltr,
        ),
        _SheetDivider(),
        _SheetInfoRow(
          title: 'Mac Address',
          value: screen.macAddress,
          icon: AppAssets.outlineSidebarIcon,
          valueDirection: TextDirection.ltr,
        ),
        _SheetDivider(),
        _SheetInfoRow(
          title: 'App Status',
          value: screen.appStatus,
          icon: AppAssets.magicStickIcon,
          valueDirection: TextDirection.ltr,
        ),
      ],
    );
  }
}

/// يمثل جزءا داخليا صغيرا من الواجهة لفصل التفاصيل عن الملف الرئيسي.
class _SheetScreenNameRow extends StatelessWidget {
  const _SheetScreenNameRow({required this.screen});

  final MonitorItemModel screen;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 68,
      child: Row(
        textDirection: TextDirection.rtl,
        children: [
          const _SheetIconBox(asset: AppAssets.tabletIcon),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'أسم الشاشة',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.right,
                  style: AppTextStyles.tiny.copyWith(
                    color: context.colors.secondaryText,
                    fontSize: 12,
                  ),
                ),
                const SizedBox(height: 5),
                Directionality(
                  textDirection: TextDirection.ltr,
                  child: Text(
                    screen.name,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.right,
                    style: AppTextStyles.caption.copyWith(
                      color: context.colors.accent,
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                      height: 1,
                    ),
                  ),
                ),
              ],
            ),
          ),
          const Spacer(),
          ScreenStatusBadge(status: screen.status),
        ],
      ),
    );
  }
}

/// يمثل جزءا داخليا صغيرا من الواجهة لفصل التفاصيل عن الملف الرئيسي.
class _SheetInfoRow extends StatelessWidget {
  const _SheetInfoRow({
    required this.title,
    required this.value,
    required this.icon,
    this.valueDirection = TextDirection.rtl,
  });

  final String title;
  final String value;
  final String icon;
  final TextDirection valueDirection;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 68,
      child: Row(
        textDirection: TextDirection.rtl,
        children: [
          _SheetIconBox(asset: icon),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.right,
                  style: AppTextStyles.tiny.copyWith(
                    color: context.colors.secondaryText,
                    fontSize: 13,
                  ),
                ),
                const SizedBox(height: 6),
                Directionality(
                  textDirection: valueDirection,
                  child: Text(
                    value,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.right,
                    style: AppTextStyles.caption.copyWith(
                      color: context.colors.primaryText,
                      fontSize: 17,
                      fontWeight: FontWeight.w600,
                      height: 1,
                    ),
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
class _SheetIconBox extends StatelessWidget {
  const _SheetIconBox({required this.asset});

  final String asset;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 36,
      width: 36,
      decoration: BoxDecoration(
        color: context.colors.surfaceSoft,
        borderRadius: BorderRadius.circular(13),
      ),
      child: Center(
        child: AppSvgIcon(asset, color: context.colors.accent, size: 20),
      ),
    );
  }
}

/// يمثل جزءا داخليا صغيرا من الواجهة لفصل التفاصيل عن الملف الرئيسي.
class _SheetDivider extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Divider(height: 1, color: context.colors.border);
  }
}
