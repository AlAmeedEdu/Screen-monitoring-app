import '../../core/constants/app_assets.dart';
import '../models/home_dashboard_model.dart';

class HomeProvider {
  Future<HomeDashboardModel> getDashboard() async {
    await Future<void>.delayed(const Duration(milliseconds: 250));

    return const HomeDashboardModel(
      userName: 'محمد',
      subtitle: 'متابعة تسجيل حضور الاساتذه في الشاشات',
      activePercent: 91,
      attendanceSummaries: [
        AttendanceSummaryModel(
          title: 'أجمالي الحضور للأساتذه',
          value: '60',
          description: 'استاذ نشط حاليا',
          asset: AppAssets.teacherActive,
          isPositive: true,
        ),
        AttendanceSummaryModel(
          title: 'أجمالي عدم الحضور',
          value: '7',
          description: 'استاذ',
          asset: AppAssets.teacherActiveRed,
          isPositive: false,
        ),
      ],
      latestLogins: [
        LatestTeacherLoginModel(
          teacherName: 'رغد محمد حسين',
          className: 'الصف الثالث الابتدائي - د',
          loginTime: '09:27',
          asset: AppAssets.teacherActive,
        ),
        LatestTeacherLoginModel(
          teacherName: 'رغد محمد حسين',
          className: 'الصف الثالث الابتدائي - د',
          loginTime: '09:27',
          asset: AppAssets.teacherActive,
        ),
        LatestTeacherLoginModel(
          teacherName: 'رغد محمد حسين',
          className: 'الصف الثالث الابتدائي - د',
          loginTime: '09:27',
          asset: AppAssets.teacherActive,
        ),
      ],
      screenStats: [
        HomeScreenStatModel(
          title: 'أجمالي الشاشات النشطة',
          value: '67 شاشة',
          asset: AppAssets.allScreenActive,
        ),
        HomeScreenStatModel(
          title: 'أجمالي الشاشات المتوقفة',
          value: '2 شاشة',
          asset: AppAssets.allScreenInactive,
        ),
        HomeScreenStatModel(
          title: 'أجمالي الشاشات المعطلة',
          value: '4 شاشة',
          asset: AppAssets.allScreenDisabled,
        ),
      ],
    );
  }
}
