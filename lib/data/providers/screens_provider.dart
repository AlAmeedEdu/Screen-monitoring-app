import '../../core/enums/screen_status.dart';
import '../models/monitor_item_model.dart';

class ScreensProvider {
  Future<List<MonitorItemModel>> getScreens() async {
    await Future<void>.delayed(const Duration(milliseconds: 250));

    return [
      MonitorItemModel(
        id: '1',
        name: 'F-p-qmr-04',
        schoolName: 'أبتدائية القمر للبنين الثاني هـ',
        ipAddress: '10.15.33.60',
        macAddress: '00:02:75:ct:b6:af',
        status: ScreenStatus.online,
        appStatus: 'success',
        lastSeen: DateTime(2025, 11, 29, 9, 56),
      ),
      MonitorItemModel(
        id: '2',
        name: 'F-p-qmr-08',
        schoolName: 'أبتدائية القمر للبنين الثاني هـ',
        ipAddress: '10.15.33.64',
        macAddress: '00:02:75:ct:b6:b3',
        status: ScreenStatus.online,
        appStatus: 'success',
        lastSeen: DateTime(2025, 11, 29, 9, 48),
      ),
      MonitorItemModel(
        id: '3',
        name: 'F-p-qmr-11',
        schoolName: 'أبتدائية القمر للبنين الثاني هـ',
        ipAddress: '10.15.33.71',
        macAddress: '00:02:75:ct:b6:c1',
        status: ScreenStatus.maintenance,
        appStatus: 'warning',
        lastSeen: DateTime(2025, 11, 29, 8, 30),
      ),
    ];
  }
}
