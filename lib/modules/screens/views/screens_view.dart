import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/constants/app_assets.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_palette.dart';
import '../../../core/theme/app_radius.dart';
import '../../../core/theme/app_text_styles.dart';
import '../../../core/widgets/app_text_field.dart';
import '../../../core/widgets/app_svg_icon.dart';
import '../../../core/widgets/app_search_field.dart';
import '../../../core/widgets/blurred_header_image.dart';
import '../../../data/models/monitor_item_model.dart';
import '../controllers/screens_controller.dart';
import '../widgets/screen_action_buttons.dart';
import '../widgets/screen_card.dart';
import '../widgets/screen_status_badge.dart';

part 'parts/screens_header.dart';
part 'parts/add_monitor_sheet.dart';
part 'parts/screen_details_sheet.dart';
part 'parts/screens_filter_sheet.dart';
part 'parts/screens_selection_controls.dart';
part 'parts/screens_confirmation_dialog.dart';
part 'parts/screens_summary_panel.dart';

/// يبني شاشة ScreensView ويربطها بالـ controller أو البيانات الخاصة بها.
class ScreensView extends GetView<ScreensController> {
  const ScreensView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.colors.canvas,
      body: Directionality(
        textDirection: TextDirection.rtl,
        child: Obx(() {
          return Column(
            children: [
              const _ScreensHero(),
              Expanded(
                child: ListView(
                  padding: const EdgeInsets.only(bottom: 120),
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(16, 14, 16, 0),
                      child: Column(
                        children: [
                          if (controller.hasSelectedScreens) ...[
                            _SelectionActionBar(
                              onDelete: () => _showDeleteConfirmation(context),
                              onPower: () => _showShutdownConfirmation(context),
                            ),
                            const SizedBox(height: 20),
                            _SelectionControls(controller: controller),
                            const SizedBox(height: 16),
                          ],
                          if (controller.isLoading.value)
                            const SizedBox(
                                height: 240,
                                child:
                                    Center(child: CircularProgressIndicator()))
                          else if (controller.filteredScreens.isEmpty)
                            const _EmptyScreens()
                          else
                            for (final screen
                                in controller.filteredScreens) ...[
                              ScreenCard(
                                screen: screen,
                                selectionMode: controller.hasSelectedScreens,
                                isSelected: controller.isScreenSelected(screen),
                                onTap: () {
                                  if (controller.hasSelectedScreens) {
                                    controller.toggleScreenSelection(screen);
                                  } else {
                                    _showScreenDetailsSheet(context, screen);
                                  }
                                },
                                onLongPress: () =>
                                    controller.enterSelectionMode(screen),
                                onSelectionTap: () =>
                                    controller.toggleScreenSelection(screen),
                              ),
                              const SizedBox(height: 12),
                            ],
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          );
        }),
      ),
    );
  }
}
