part of '../login_view.dart';

/// يمثل جزءا داخليا صغيرا من الواجهة لفصل التفاصيل عن الملف الرئيسي.
class _LoginWelcome extends StatelessWidget {
  const _LoginWelcome();

  @override
  Widget build(BuildContext context) {
    final widthScale = MediaQuery.of(context).size.width / 360;

    return Column(
      children: [
        SvgPicture.asset(
          AppAssets.figmaLoginLogo,
          width: 76 * widthScale,
          height: 61 * widthScale,
          fit: BoxFit.contain,
        ),
        const SizedBox(height: 8),
        Text(
          'مرحبا بك 🖐️',
          textAlign: TextAlign.center,
          style: AppTextStyles.title.copyWith(
            color: context.colors.primaryText,
            fontSize: 20,
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          'سجل دخول للوصول الى التطبيق',
          textAlign: TextAlign.center,
          style: AppTextStyles.subtitle.copyWith(
            color: context.colors.secondaryText,
            fontSize: 14,
            fontWeight: FontWeight.w300,
          ),
        ),
      ],
    );
  }
}

/// يعرض عنصر تفاعل صغير موحد الشكل داخل الواجهة.
class SlideLoginButton extends StatefulWidget {
  const SlideLoginButton({required this.onComplete, super.key});

  final VoidCallback onComplete;

  @override
  State<SlideLoginButton> createState() => _SlideLoginButtonState();
}

/// يمثل جزءا داخليا صغيرا من الواجهة لفصل التفاصيل عن الملف الرئيسي.
class _SlideLoginButtonState extends State<SlideLoginButton> {
  double _progress = 0;

  @override
  Widget build(BuildContext context) {
    const handleWidth = 48.0;
    const handleHeight = 42.0;
    const horizontalPadding = 16.0;
    const topPadding = 7.0;

    return SizedBox(
      height: 56,
      width: double.infinity,
      child: LayoutBuilder(
        builder: (context, constraints) {
          final travel =
              constraints.maxWidth - handleWidth - (horizontalPadding * 2);
          final left = horizontalPadding + (travel * (1 - _progress));
          final labelOpacity =
              (1.0 - (_progress * 1.8)).clamp(0.0, 1.0).toDouble();

          return GestureDetector(
            onHorizontalDragUpdate: (details) {
              setState(() {
                _progress =
                    (_progress - (details.delta.dx / travel)).clamp(0.0, 1.0);
              });
            },
            onHorizontalDragEnd: (_) {
              if (_progress > 0.82) {
                setState(() => _progress = 1);
                widget.onComplete();
                return;
              }
              setState(() => _progress = 0);
            },
            child: Container(
              decoration: BoxDecoration(
                color: const Color(0xFF42A7B5),
                borderRadius: BorderRadius.circular(16),
              ),
              child: Stack(
                alignment: Alignment.center,
                children: [
                  PositionedDirectional(
                    start: 18,
                    end: 74,
                    child: Opacity(
                      opacity: labelOpacity,
                      child: Text(
                        'أسحب لتسجيل الدخول',
                        textAlign: TextAlign.center,
                        style: AppTextStyles.caption.copyWith(
                          color: AppColors.surface,
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  ),
                  AnimatedPositioned(
                    duration: const Duration(milliseconds: 160),
                    curve: Curves.easeOut,
                    left: left,
                    top: topPadding,
                    child: Container(
                      height: handleHeight,
                      width: handleWidth,
                      decoration: BoxDecoration(
                        color: context.colors.surface,
                        borderRadius: BorderRadius.circular(16),
                        boxShadow: [
                          BoxShadow(
                            color: context.isAppDarkMode
                                ? Colors.black.withValues(alpha: .34)
                                : const Color(0xFFA1D3DA),
                            blurRadius: context.isAppDarkMode ? 14 : 8,
                            offset: const Offset(0, 4),
                          ),
                          BoxShadow(
                            color: context.isAppDarkMode
                                ? context.colors.accent.withValues(alpha: .16)
                                : const Color(0xDFFFFFFF),
                            blurRadius: 18,
                            spreadRadius: 1,
                          ),
                        ],
                      ),
                      child: const Center(
                        child: AppSvgIcon(
                          AppAssets.squareDoubleArrowLeftIcon,
                          color: Color(0xFF42A7B5),
                          size: 20,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
