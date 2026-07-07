part of '../screen_details_view.dart';

/// يبني ترويسة هذا القسم ويجمع عناصرها البصرية في مكان واحد.
class _DetailsHeader extends StatelessWidget {
  const _DetailsHeader();

  @override
  Widget build(BuildContext context) {
    final imageOverlay = context.isAppDarkMode
        ? const Color(0xFF061113).withValues(alpha: .44)
        : Colors.white.withValues(alpha: .18);

    return SizedBox(
      height: 358,
      child: Stack(
        children: [
          Positioned.fill(
            child: ClipRRect(
              borderRadius: const BorderRadius.vertical(
                bottom: Radius.circular(32),
              ),
              child: Image.asset(
                AppAssets.monitorsHeader,
                fit: BoxFit.cover,
                color: imageOverlay,
                colorBlendMode: context.isAppDarkMode
                    ? BlendMode.multiply
                    : BlendMode.screen,
              ),
            ),
          ),
          Positioned(
            top: MediaQuery.of(context).padding.top + 38,
            right: 30,
            child: Directionality(
              textDirection: TextDirection.ltr,
              child: Row(
                children: [
                  Text(
                    'تفاصيل الشاشة',
                    style: AppTextStyles.title.copyWith(
                      color: context.colors.primaryText,
                      fontSize: 25,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                  const SizedBox(width: 12),
                  _BackButton(onTap: () => Get.back()),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

/// يعرض عنصر تفاعل صغير موحد الشكل داخل الواجهة.
class _BackButton extends StatelessWidget {
  const _BackButton({required this.onTap});

  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: context.colors.surface,
      borderRadius: BorderRadius.circular(16),
      elevation: 1,
      shadowColor: context.colors.accentSoft,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(16),
        child: SizedBox(
          height: 50,
          width: 50,
          child: Center(
            child: AppSvgIcon(
              AppAssets.altArrowRightIcon,
              color: context.colors.accent,
              size: 24,
            ),
          ),
        ),
      ),
    );
  }
}
