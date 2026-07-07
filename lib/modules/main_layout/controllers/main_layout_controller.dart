import 'package:get/get.dart';

/// يدير حالة هذه الشاشة وينفذ أوامرها بعيدا عن كود الواجهة.
class MainLayoutController extends GetxController {
  final selectedIndex = 3.obs;

  /// يغير الحالة الحالية بناء على اختيار المستخدم.
  void changeTab(int index) {
    selectedIndex.value = index;
  }
}
