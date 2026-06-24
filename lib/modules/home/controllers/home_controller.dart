import 'package:get/get.dart';

import '../../../data/models/home_dashboard_model.dart';
import '../../../data/repositories/home_repository.dart';

class HomeController extends GetxController {
  HomeController({HomeRepository? repository})
      : _repository = repository ?? HomeRepository();

  final HomeRepository _repository;

  final isLoading = true.obs;
  final Rxn<HomeDashboardModel> dashboard = Rxn<HomeDashboardModel>();

  @override
  void onInit() {
    super.onInit();
    loadDashboard();
  }

  Future<void> loadDashboard() async {
    isLoading.value = true;
    dashboard.value = await _repository.getDashboard();
    isLoading.value = false;
  }
}
