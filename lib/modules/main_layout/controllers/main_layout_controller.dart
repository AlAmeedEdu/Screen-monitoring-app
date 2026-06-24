import 'package:get/get.dart';

class MainLayoutController extends GetxController {
  final selectedIndex = 3.obs;

  void changeTab(int index) {
    selectedIndex.value = index;
  }
}
