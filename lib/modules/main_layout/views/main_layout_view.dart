import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/theme/app_colors.dart';
import '../../classes/views/classes_view.dart';
import '../../home/views/home_view.dart';
import '../../profile/views/profile_view.dart';
import '../../screens/views/screens_view.dart';
import '../controllers/main_layout_controller.dart';
import '../widgets/main_bottom_nav.dart';

class MainLayoutView extends GetView<MainLayoutController> {
  const MainLayoutView({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        backgroundColor: AppColors.background,
        body: Stack(
          children: [
            Positioned.fill(
              child: IndexedStack(
                index: controller.selectedIndex.value,
                children: const [
                  ProfileView(),
                  ClassesView(),
                  ScreensView(),
                  HomeView(),
                ],
              ),
            ),
            Positioned(
              left: 0,
              right: 0,
              bottom: 12,
              child: MainBottomNav(
                currentIndex: controller.selectedIndex.value,
                onTap: controller.changeTab,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
