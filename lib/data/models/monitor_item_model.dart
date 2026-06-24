import '../../core/enums/screen_status.dart';

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

  bool get isActive => status == ScreenStatus.online;
}
