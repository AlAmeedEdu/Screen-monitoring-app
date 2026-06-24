import 'package:get/get.dart';

import '../../../data/models/monitor_item_model.dart';
import '../../../data/repositories/screens_repository.dart';

class ScreensController extends GetxController {
  ScreensController({ScreensRepository? repository})
      : _repository = repository ?? ScreensRepository();

  final ScreensRepository _repository;

  final isLoading = true.obs;
  final query = ''.obs;
  final screens = <MonitorItemModel>[].obs;

  List<MonitorItemModel> get filteredScreens {
    final normalizedQuery = query.value.trim().toLowerCase();
    if (normalizedQuery.isEmpty) {
      return screens;
    }

    return screens.where((screen) {
      return screen.name.toLowerCase().contains(normalizedQuery) ||
          screen.schoolName.toLowerCase().contains(normalizedQuery) ||
          screen.ipAddress.contains(normalizedQuery);
    }).toList();
  }

  @override
  void onInit() {
    super.onInit();
    loadScreens();
  }

  Future<void> loadScreens() async {
    isLoading.value = true;
    screens.assignAll(await _repository.getScreens());
    isLoading.value = false;
  }

  void setQuery(String value) {
    query.value = value;
  }
}
