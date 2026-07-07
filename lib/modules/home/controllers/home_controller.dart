import 'package:get/get.dart';

import '../../../data/models/home_dashboard_model.dart';
import '../../../data/repositories/home_repository.dart';

/// يدير حالة هذه الشاشة وينفذ أوامرها بعيدا عن كود الواجهة.
class HomeController extends GetxController {
  HomeController({HomeRepository? repository})
      : _repository = repository ?? HomeRepository();

  final HomeRepository _repository;

  final isLoading = true.obs;
  final Rxn<HomeDashboardModel> dashboard = Rxn<HomeDashboardModel>();

  /// يعمل عند إنشاء الـ controller ويبدأ تحميل البيانات أو تهيئة الحالة.
  @override
  void onInit() {
    super.onInit();
    loadDashboard();
  }

  /// يجلب البيانات المطلوبة ويحدث الحالة المرتبطة بها.
  Future<void> loadDashboard() async {
    isLoading.value = true;
    try {
      dashboard.value = await _repository.getDashboard();
    } finally {
      isLoading.value = false;
    }
  }
}
