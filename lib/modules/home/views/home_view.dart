import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/constants/app_assets.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_radius.dart';
import '../../../core/theme/app_shadows.dart';
import '../../../core/theme/app_text_styles.dart';
import '../../../core/widgets/app_search_field.dart';
import '../../../core/widgets/app_svg_icon.dart';
import '../controllers/home_controller.dart';
import '../widgets/absent_teacher_card.dart';
import '../widgets/attendance_summary_card.dart';
import '../widgets/home_header_card.dart';
import '../widgets/latest_teacher_login_card.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: Directionality(
        textDirection: TextDirection.rtl,
        child: Obx(() {
          final dashboard = controller.dashboard.value;
          if (controller.isLoading.value || dashboard == null) {
            return const Center(child: CircularProgressIndicator());
          }
          final recentLogins =
              dashboard.latestLogins.take(3).toList(growable: false);

          return Column(
            children: [
              _HomeHero(
                userName: dashboard.userName,
                subtitle: dashboard.subtitle,
              ),
              Expanded(
                child: ListView(
                  padding: const EdgeInsets.only(top: 9, bottom: 116),
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: _SectionCard(
                        title: 'نسبة نشاط اليوم',
                        height: 117,
                        child: Row(
                          children: [
                            Expanded(
                                child: AttendanceSummaryCard(
                                    summary: dashboard.attendanceSummaries[0])),
                            const SizedBox(width: 8),
                            Expanded(
                                child: AttendanceSummaryCard(
                                    summary: dashboard.attendanceSummaries[1])),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 8),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: _SectionCard(
                        title: 'آخر تسجيلات حضور الاساتذة',
                        height: 227,
                        child: Column(
                          children: [
                            for (var index = 0;
                                index < recentLogins.length;
                                index++) ...[
                              if (index > 0) const SizedBox(height: 8),
                              LatestTeacherLoginCard(
                                  login: recentLogins[index]),
                            ],
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 8),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: _SectionCard(
                        title: 'الاساتذة الغير الحضور',
                        height: 227,
                        child: Column(
                          children: [
                            AbsentTeacherCard(
                                login: dashboard.latestLogins.first),
                            const SizedBox(height: 8),
                            AbsentTeacherCard(login: dashboard.latestLogins[1]),
                          ],
                        ),
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

class _SectionCard extends StatelessWidget {
  const _SectionCard(
      {required this.title, required this.height, required this.child});

  final String title;
  final double height;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      padding: const EdgeInsets.fromLTRB(10, 8, 10, 8),
      decoration: BoxDecoration(
          color: AppColors.surface,
          borderRadius: BorderRadius.circular(AppRadius.lg),
          boxShadow: AppShadows.soft),
      child: Column(
        children: [
          Row(
            textDirection: TextDirection.rtl,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                height: 30,
                width: 30,
                decoration: BoxDecoration(
                    color: AppColors.secondary50,
                    borderRadius: BorderRadius.circular(AppRadius.sm)),
                child: const Center(
                    child: AppSvgIcon(AppAssets.buildingsIcon,
                        color: Color(0xFF42AEB7), size: 16)),
              ),
              const SizedBox(width: 8),
              Text(title,
                  textAlign: TextAlign.right,
                  textDirection: TextDirection.rtl,
                  style: AppTextStyles.subtitle.copyWith(
                      color: AppColors.textPrimary,
                      fontWeight: FontWeight.w500)),
            ],
          ),
          const SizedBox(height: 4),
          Expanded(child: child),
        ],
      ),
    );
  }
}

class _HomeHero extends StatelessWidget {
  const _HomeHero({required this.userName, required this.subtitle});

  final String userName;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 163,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Positioned.fill(
            bottom: 20,
            child: HomeHeaderCard(userName: userName, subtitle: subtitle),
          ),
          const Positioned(
            top: 112,
            left: 16,
            right: 16,
            child: AppSearchField(hintText: 'بحث عن اسم استاذ , صف'),
          ),
        ],
      ),
    );
  }
}
