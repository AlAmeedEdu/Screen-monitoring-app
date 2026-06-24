import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../app/app_routes.dart';
import '../../../core/constants/app_assets.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_radius.dart';
import '../../../core/theme/app_shadows.dart';
import '../../../core/theme/app_text_styles.dart';
import '../../../core/widgets/app_svg_icon.dart';
import '../controllers/profile_controller.dart';

class ProfileView extends GetView<ProfileController> {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: Directionality(
        textDirection: TextDirection.rtl,
        child: ListView(
          padding: const EdgeInsets.fromLTRB(14, 58, 14, 124),
          children: [
            const _ProfileAvatar(),
            const SizedBox(height: 18),
            _SettingsPanel(onLogout: () => Get.offAllNamed(AppRoutes.login)),
          ],
        ),
      ),
    );
  }
}

class _ProfileAvatar extends StatelessWidget {
  const _ProfileAvatar();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 230,
      child: Center(
        child: Stack(
          clipBehavior: Clip.none,
          alignment: Alignment.center,
          children: [
            const _ProfileDot(top: 0, left: 8, size: 19),
            const _ProfileDot(top: 25, right: -50, size: 16),
            const _ProfileDot(top: 82, left: -52, size: 3),
            const _ProfileDot(bottom: 54, right: -24, size: 6),
            const _ProfileDot(bottom: 35, left: -38, size: 11),
            const _ProfileDot(bottom: 0, right: 22, size: 5),
            Container(
              height: 142,
              width: 142,
              padding: const EdgeInsets.all(4),
              decoration: const BoxDecoration(
                color: Color(0xFF42AEB7),
                shape: BoxShape.circle,
              ),
              child: ClipOval(
                child: Image.asset(AppAssets.avatar, fit: BoxFit.cover),
              ),
            ),
            Positioned(
              right: -8,
              bottom: 46,
              child: Container(
                height: 52,
                width: 52,
                decoration: const BoxDecoration(
                  color: AppColors.surface,
                  shape: BoxShape.circle,
                  boxShadow: AppShadows.card,
                ),
                child: const Icon(
                  Icons.edit_rounded,
                  color: Color(0xFF42AEB7),
                  size: 24,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

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
          color: Color(0x8842AEB7),
          shape: BoxShape.circle,
        ),
      ),
    );
  }
}

class _SettingsPanel extends StatelessWidget {
  const _SettingsPanel({required this.onLogout});

  final VoidCallback onLogout;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(30),
        boxShadow: AppShadows.soft,
      ),
      child: Column(
        children: [
          const _SettingsCard(
            children: [
              _ToggleSettingRow(title: 'الاشعارات', icon: AppAssets.bellIcon),
              _DividerLine(),
              _ToggleSettingRow(
                title: 'المظهر الداكن',
                icon: AppAssets.tuningIcon,
              ),
            ],
          ),
          const SizedBox(height: 14),
          const _SettingsCard(
            children: [
              _MenuSettingRow(title: 'الاعدادات', icon: AppAssets.tuningIcon),
              _DividerLine(),
              _MenuSettingRow(title: 'الدعم الفني', icon: AppAssets.usersIcon),
              _DividerLine(),
              _MenuSettingRow(
                title: 'الاسئلة الشائعة',
                icon: AppAssets.penIcon,
              ),
            ],
          ),
          const SizedBox(height: 12),
          _LogoutButton(onTap: onLogout),
        ],
      ),
    );
  }
}

class _SettingsCard extends StatelessWidget {
  const _SettingsCard({required this.children});

  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(22),
        border: Border.all(color: const Color(0xFFDDEEEF)),
      ),
      child: Column(children: children),
    );
  }
}

class _ToggleSettingRow extends StatefulWidget {
  const _ToggleSettingRow({required this.title, required this.icon});

  final String title;
  final String icon;

  @override
  State<_ToggleSettingRow> createState() => _ToggleSettingRowState();
}

class _ToggleSettingRowState extends State<_ToggleSettingRow> {
  bool value = true;

  @override
  Widget build(BuildContext context) {
    return _SettingRowShell(
      title: widget.title,
      icon: widget.icon,
      leading: _ProfileSwitch(
        value: value,
        onChanged: (next) => setState(() => value = next),
      ),
    );
  }
}

class _MenuSettingRow extends StatelessWidget {
  const _MenuSettingRow({required this.title, required this.icon});

  final String title;
  final String icon;

  @override
  Widget build(BuildContext context) {
    return _SettingRowShell(title: title, icon: icon);
  }
}

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
      height: 55,
      child: Directionality(
        textDirection: TextDirection.ltr,
        child: Row(
          children: [
            leading ?? const SizedBox(width: 80),
            const Spacer(),
            Directionality(
              textDirection: TextDirection.rtl,
              child: Text(
                title,
                textAlign: TextAlign.right,
                style: AppTextStyles.caption.copyWith(
                  color: AppColors.textPrimary,
                  fontSize: 13,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            const SizedBox(width: 10),
            Container(
              height: 39,
              width: 39,
              decoration: BoxDecoration(
                color: AppColors.secondary50,
                borderRadius: BorderRadius.circular(AppRadius.pill),
              ),
              child: Center(
                child: AppSvgIcon(
                  icon,
                  color: const Color(0xFF42AEB7),
                  size: 18,
                ),
              ),
            ),
            const SizedBox(width: 8),
          ],
        ),
      ),
    );
  }
}

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
        height: 28,
        width: 52,
        margin: const EdgeInsetsDirectional.only(start: 8),
        padding: const EdgeInsets.all(3),
        decoration: BoxDecoration(
          color: value ? const Color(0xFF42AEB7) : const Color(0xFFEAF1F2),
          borderRadius: BorderRadius.circular(AppRadius.pill),
        ),
        child: AnimatedAlign(
          duration: const Duration(milliseconds: 180),
          curve: Curves.easeOut,
          alignment: value ? Alignment.centerRight : Alignment.centerLeft,
          child: Container(
            height: 22,
            width: 22,
            decoration: const BoxDecoration(
              color: AppColors.surface,
              shape: BoxShape.circle,
            ),
          ),
        ),
      ),
    );
  }
}

class _DividerLine extends StatelessWidget {
  const _DividerLine();

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 26),
      child: Divider(height: 1, color: AppColors.border),
    );
  }
}

class _LogoutButton extends StatelessWidget {
  const _LogoutButton({required this.onTap});

  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Material(
        color: const Color(0xFFF63E43),
        borderRadius: BorderRadius.circular(14),
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(14),
          child: SizedBox(
            height: 50,
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
      ),
    );
  }
}
