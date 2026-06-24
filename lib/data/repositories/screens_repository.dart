import '../models/monitor_item_model.dart';
import '../providers/screens_provider.dart';

class ScreensRepository {
  ScreensRepository({ScreensProvider? provider})
      : _provider = provider ?? ScreensProvider();

  final ScreensProvider _provider;

  Future<List<MonitorItemModel>> getScreens() {
    return _provider.getScreens();
  }
}
