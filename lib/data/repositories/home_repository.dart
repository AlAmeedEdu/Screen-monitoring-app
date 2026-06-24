import '../models/home_dashboard_model.dart';
import '../providers/home_provider.dart';

class HomeRepository {
  HomeRepository({HomeProvider? provider})
      : _provider = provider ?? HomeProvider();

  final HomeProvider _provider;

  Future<HomeDashboardModel> getDashboard() {
    return _provider.getDashboard();
  }
}
