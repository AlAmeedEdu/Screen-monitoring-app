part of '../profile_view.dart';

/// يعرض بطاقة واجهة قابلة لإعادة الاستخدام داخل هذه الميزة.
class _ProfileCard extends StatelessWidget {
  const _ProfileCard({required this.onLogout});

  final VoidCallback onLogout;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.fromLTRB(12, 18, 12, 16),
      decoration: BoxDecoration(
        color: context.colors.surface,
        borderRadius: BorderRadius.circular(32),
      ),
      child: Column(
        children: [
          const _ProfileIdentity(),
          const SizedBox(height: 14),
          _SettingsStack(onLogout: onLogout),
        ],
      ),
    );
  }
}

/// يمثل جزءا داخليا صغيرا من الواجهة لفصل التفاصيل عن الملف الرئيسي.
class _ProfileIdentity extends StatelessWidget {
  const _ProfileIdentity();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 174,
          width: 178,
          child: Stack(
            clipBehavior: Clip.none,
            alignment: Alignment.center,
            children: [
              const _ProfileDot(top: 0, left: 42, size: 17),
              const _ProfileDot(top: 8, right: 36, size: 4),
              const _ProfileDot(top: 52, left: 14, size: 2.5),
              const _ProfileDot(top: 50, right: 20, size: 14),
              const _ProfileDot(bottom: 54, left: 20, size: 8),
              const _ProfileDot(bottom: 36, right: 34, size: 4),
              const _ProfileDot(bottom: 26, left: 58, size: 5),
              const _ProfileDot(bottom: 26, right: 50, size: 3),
              Container(
                height: 116,
                width: 116,
                padding: const EdgeInsets.all(3),
                decoration: const BoxDecoration(
                  color: Color(0xFF42AEB7),
                  shape: BoxShape.circle,
                ),
                child: ClipOval(
                  child: Image.asset(AppAssets.avatar, fit: BoxFit.cover),
                ),
              ),
              Positioned(
                right: 39,
                bottom: 44,
                child: Container(
                  height: 27,
                  width: 27,
                  decoration: BoxDecoration(
                    color: context.colors.surfaceSoft,
                    shape: BoxShape.circle,
                    border: Border.all(color: const Color(0xFF71BDC8)),
                    boxShadow: AppShadows.cardFor(context),
                  ),
                  child: const Icon(
                    Icons.edit_rounded,
                    color: Color(0xFF42AEB7),
                    size: 16,
                  ),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 4),
        Text(
          'محمد عبد الحسين',
          textAlign: TextAlign.center,
          style: AppTextStyles.subtitle.copyWith(
            color: context.colors.primaryText,
            fontSize: 20,
            fontWeight: FontWeight.w800,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          'منسق تقني',
          textAlign: TextAlign.center,
          style: AppTextStyles.caption.copyWith(
            color: context.colors.secondaryText,
            fontWeight: FontWeight.w300,
          ),
        ),
      ],
    );
  }
}
