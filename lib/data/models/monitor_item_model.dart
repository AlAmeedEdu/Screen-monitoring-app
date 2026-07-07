import '../../core/enums/screen_status.dart';

/// يمثل شكل بيانات MonitorItemModel التي تنتقل بين طبقة البيانات والواجهة.
class MonitorItemModel {
  const MonitorItemModel({
    required this.id,
    required this.name,
    required this.schoolName,
    required this.ipAddress,
    required this.macAddress,
    required this.status,
    required this.appStatus,
    required this.lastSeen,
  });

  final String id;
  final String name;
  final String schoolName;
  final String ipAddress;
  final String macAddress;
  final ScreenStatus status;
  final String appStatus;
  final DateTime lastSeen;

  /// يرجع حالة منطقية تستخدمها الواجهة لاختيار الشكل أو السلوك المناسب.
  bool get isActive => status == ScreenStatus.online;
}
