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
