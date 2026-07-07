/// يمثل شكل بيانات AttendanceSummaryModel التي تنتقل بين طبقة البيانات والواجهة.
class AttendanceSummaryModel {
  const AttendanceSummaryModel({
    required this.title,
    required this.value,
    required this.description,
    required this.asset,
    required this.isPositive,
  });

  final String title;
  final String value;
  final String description;
  final String asset;
  final bool isPositive;
}

/// يمثل شكل بيانات LatestTeacherLoginModel التي تنتقل بين طبقة البيانات والواجهة.
class LatestTeacherLoginModel {
  const LatestTeacherLoginModel({
    required this.teacherName,
    required this.className,
    required this.loginTime,
    required this.asset,
  });

  final String teacherName;
  final String className;
  final String loginTime;
  final String asset;
}

/// يمثل شكل بيانات HomeScreenStatModel التي تنتقل بين طبقة البيانات والواجهة.
class HomeScreenStatModel {
  const HomeScreenStatModel({
    required this.title,
    required this.value,
    required this.asset,
  });

  final String title;
  final String value;
  final String asset;
}

/// يمثل شكل بيانات HomeDashboardModel التي تنتقل بين طبقة البيانات والواجهة.
class HomeDashboardModel {
  const HomeDashboardModel({
    required this.userName,
    required this.subtitle,
    required this.activePercent,
    required this.attendanceSummaries,
    required this.latestLogins,
    required this.screenStats,
  });

  final String userName;
  final String subtitle;
  final int activePercent;
  final List<AttendanceSummaryModel> attendanceSummaries;
  final List<LatestTeacherLoginModel> latestLogins;
  final List<HomeScreenStatModel> screenStats;
}
