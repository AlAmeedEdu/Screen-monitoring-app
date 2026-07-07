import 'package:get/get.dart';

import '../../../data/models/monitor_item_model.dart';
import '../../../data/repositories/screens_repository.dart';

/// يدير حالة هذه الشاشة وينفذ أوامرها بعيدا عن كود الواجهة.
class ScreensController extends GetxController {
  ScreensController({ScreensRepository? repository})
      : _repository = repository ?? ScreensRepository();

  final ScreensRepository _repository;

  final isLoading = true.obs;
  final query = ''.obs;
  final screens = <MonitorItemModel>[].obs;
  final customSelectionMode = false.obs;
  final selectedScreenIds = <String>{}.obs;

  /// يرجع نسخة مفلترة من البيانات حسب شروط البحث أو الاختيار الحالية.
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

  /// يوضح هل توجد حالة أو بيانات مفعلة حاليا لاستخدامها في عرض الواجهة.
  bool get hasSelectedScreens => selectedScreenIds.isNotEmpty;

  /// يتحقق هل كل العناصر الظاهرة حاليا داخلة ضمن حالة التحديد.
  bool get areAllFilteredScreensSelected {
    final visibleScreens = filteredScreens;
    return visibleScreens.isNotEmpty &&
        visibleScreens.every((screen) => selectedScreenIds.contains(screen.id));
  }

  bool isScreenSelected(MonitorItemModel screen) {
    return selectedScreenIds.contains(screen.id);
  }

  /// يعمل عند إنشاء الـ controller ويبدأ تحميل البيانات أو تهيئة الحالة.
  @override
  void onInit() {
    super.onInit();
    loadScreens();
  }

  /// يجلب البيانات المطلوبة ويحدث الحالة المرتبطة بها.
  Future<void> loadScreens() async {
    isLoading.value = true;
    try {
      screens.assignAll(await _repository.getScreens());
    } finally {
      isLoading.value = false;
    }
  }

  /// يغير قيمة في الحالة حتى تتحدث الواجهة المرتبطة بها.
  void setQuery(String value) {
    query.value = value;
  }

  /// يعكس حالة اختيار أو إعداد داخل الشاشة.
  void toggleCustomSelectionMode() {
    customSelectionMode.value = !customSelectionMode.value;
    if (!customSelectionMode.value) {
      selectedScreenIds.clear();
    }
  }

  /// يعكس حالة اختيار أو إعداد داخل الشاشة.
  void toggleScreenSelection(MonitorItemModel screen) {
    if (selectedScreenIds.contains(screen.id)) {
      selectedScreenIds.remove(screen.id);
    } else {
      selectedScreenIds.add(screen.id);
    }
    customSelectionMode.value = selectedScreenIds.isNotEmpty;
  }

  void enterSelectionMode(MonitorItemModel screen) {
    customSelectionMode.value = true;
    selectedScreenIds.add(screen.id);
  }

  void selectAllFilteredScreens() {
    customSelectionMode.value = true;
    selectedScreenIds
      ..clear()
      ..addAll(filteredScreens.map((screen) => screen.id));
  }

  /// يمسح الحالة المؤقتة ويعيد الجزء المرتبط بها للوضع الافتراضي.
  void clearSelection() {
    selectedScreenIds.clear();
    customSelectionMode.value = false;
  }
}
