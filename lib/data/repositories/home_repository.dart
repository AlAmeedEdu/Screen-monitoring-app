import '../models/home_dashboard_model.dart';
import '../providers/home_provider.dart';

/// ينسق طلبات البيانات بين الـ controller ومصدر البيانات المناسب.
class HomeRepository {
  HomeRepository({HomeProvider? provider})
      : _provider = provider ?? HomeProvider();

  final HomeProvider _provider;

  /// يجلب البيانات المطلوبة ويحدث الحالة المرتبطة بها.
  Future<HomeDashboardModel> getDashboard() {
    return _provider.getDashboard();
  }
}
