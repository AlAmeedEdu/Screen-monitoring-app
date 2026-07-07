part of '../profile_view.dart';

/// يمثل جزءا داخليا صغيرا من الواجهة لفصل التفاصيل عن الملف الرئيسي.
class _SettingsStack extends StatelessWidget {
  const _SettingsStack({required this.onLogout});

  final VoidCallback onLogout;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _SettingsCard(
          children: [
            const _ToggleSettingRow(
              title: 'الاشعارات',
              icon: AppAssets.bellIcon,
            ),
            const _DividerLine(),
            Obx(() {
              final theme = Get.find<ThemeController>();

              return _ToggleSettingRow(
                title: 'المظهر الداكن',
                icon: AppAssets.tuningIcon,
                value: theme.isDarkMode.value,
                onChanged: theme.setDarkMode,
              );
            }),
          ],
        ),
        const SizedBox(height: 10),
        const _SettingsCard(
          children: [
            _MenuSettingRow(title: 'الاعدادات', icon: AppAssets.tuningIcon),
            _DividerLine(),
            _MenuSettingRow(title: 'الدعم الفني', icon: AppAssets.usersIcon),
            _DividerLine(),
            _MenuSettingRow(title: 'الاسئلة الشائعة', icon: AppAssets.penIcon),
          ],
        ),
        const SizedBox(height: 10),
        _LogoutButton(onTap: onLogout),
      ],
    );
  }
}

/// يمثل جزءا داخليا صغيرا من الواجهة لفصل التفاصيل عن الملف الرئيسي.
class _ProfileDot extends StatelessWidget {
  const _ProfileDot({
    this.top,
    this.left,
    this.right,
    this.bottom,
    required this.size,
  });

  final double? top;
  final double? left;
  final double? right;
  final double? bottom;
  final double size;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: top,
      left: left,
      right: right,
      bottom: bottom,
      child: Container(
        height: size,
        width: size,
        decoration: const BoxDecoration(
          color: Color(0x9942AEB7),
          shape: BoxShape.circle,
        ),
      ),
    );
  }
}

/// يعرض بطاقة واجهة قابلة لإعادة الاستخدام داخل هذه الميزة.
class _SettingsCard extends StatelessWidget {
  const _SettingsCard({required this.children});

  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: context.colors.surface,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: context.colors.accent.withValues(alpha: .25)),
      ),
      child: Column(children: children),
    );
  }
}

/// يمثل جزءا داخليا صغيرا من الواجهة لفصل التفاصيل عن الملف الرئيسي.
class _ToggleSettingRow extends StatefulWidget {
  const _ToggleSettingRow({
    required this.title,
    required this.icon,
    this.value,
    this.onChanged,
  });

  final String title;
  final String icon;
  final bool? value;
  final ValueChanged<bool>? onChanged;

  @override
  State<_ToggleSettingRow> createState() => _ToggleSettingRowState();
}

/// يمثل جزءا داخليا صغيرا من الواجهة لفصل التفاصيل عن الملف الرئيسي.
class _ToggleSettingRowState extends State<_ToggleSettingRow> {
  bool value = true;

  @override
  Widget build(BuildContext context) {
    final effectiveValue = widget.value ?? value;

    return _SettingRowShell(
      title: widget.title,
      icon: widget.icon,
      leading: _ProfileSwitch(
        value: effectiveValue,
        onChanged: (next) {
          if (widget.onChanged != null) {
            widget.onChanged!(next);
          } else {
            setState(() => value = next);
          }
        },
      ),
    );
  }
}

/// يمثل جزءا داخليا صغيرا من الواجهة لفصل التفاصيل عن الملف الرئيسي.
class _MenuSettingRow extends StatelessWidget {
  const _MenuSettingRow({required this.title, required this.icon});

  final String title;
  final String icon;

  @override
  Widget build(BuildContext context) {
    return _SettingRowShell(title: title, icon: icon);
  }
}

/// يمثل جزءا داخليا صغيرا من الواجهة لفصل التفاصيل عن الملف الرئيسي.
class _SettingRowShell extends StatelessWidget {
  const _SettingRowShell({
    required this.title,
    required this.icon,
    this.leading,
  });

  final String title;
  final String icon;
  final Widget? leading;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 46,
      child: Directionality(
        textDirection: TextDirection.ltr,
        child: Row(
          children: [
            leading ?? const SizedBox(width: 62),
            const Spacer(),
            Directionality(
              textDirection: TextDirection.rtl,
              child: Text(
                title,
                textAlign: TextAlign.right,
                style: AppTextStyles.caption.copyWith(
                  color: context.colors.primaryText,
                  fontSize: 13,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            const SizedBox(width: 8),
            Container(
              height: 40,
              width: 40,
              decoration: BoxDecoration(
                color: context.colors.accentSoft,
                borderRadius: BorderRadius.circular(16),
              ),
              child: Center(
                child: AppSvgIcon(
                  icon,
                  color: context.colors.accent,
                  size: 20,
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
class _ProfileSwitch extends StatelessWidget {
  const _ProfileSwitch({required this.value, required this.onChanged});

  final bool value;
  final ValueChanged<bool> onChanged;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onChanged(!value),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 180),
        height: 32,
        width: 52,
        padding: const EdgeInsets.all(4),
        decoration: BoxDecoration(
          color: value ? context.colors.accent : const Color(0xFFEAF1F2),
          borderRadius: BorderRadius.circular(AppRadius.pill),
        ),
        child: AnimatedAlign(
          duration: const Duration(milliseconds: 180),
          curve: Curves.easeOut,
          alignment: value ? Alignment.centerRight : Alignment.centerLeft,
          child: Container(
            height: 24,
            width: 24,
            decoration: BoxDecoration(
              color: context.colors.surface,
              shape: BoxShape.circle,
            ),
          ),
        ),
      ),
    );
  }
}

/// يمثل جزءا داخليا صغيرا من الواجهة لفصل التفاصيل عن الملف الرئيسي.
class _DividerLine extends StatelessWidget {
  const _DividerLine();

  @override
  Widget build(BuildContext context) {
    return Divider(height: 1, color: context.colors.border);
  }
}

/// يعرض عنصر تفاعل صغير موحد الشكل داخل الواجهة.
class _LogoutButton extends StatelessWidget {
  const _LogoutButton({required this.onTap});

  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: const Color(0xFFF63E43),
      borderRadius: BorderRadius.circular(16),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(16),
        child: SizedBox(
          height: 58,
          width: double.infinity,
          child: Center(
            child: Text(
              'تسجيل خروج',
              style: AppTextStyles.subtitle.copyWith(
                color: AppColors.surface,
                fontSize: 16,
                fontWeight: FontWeight.w800,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
