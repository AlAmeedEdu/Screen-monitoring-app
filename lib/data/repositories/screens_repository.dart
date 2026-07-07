import '../models/monitor_item_model.dart';
import '../providers/screens_provider.dart';

/// ينسق طلبات البيانات بين الـ controller ومصدر البيانات المناسب.
class ScreensRepository {
  ScreensRepository({ScreensProvider? provider})
      : _provider = provider ?? ScreensProvider();

  final ScreensProvider _provider;

  /// يجلب البيانات المطلوبة ويحدث الحالة المرتبطة بها.
  Future<List<MonitorItemModel>> getScreens() {
    return _provider.getScreens();
  }
}
