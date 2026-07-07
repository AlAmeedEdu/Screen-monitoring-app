import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/constants/app_assets.dart';
import '../../../core/enums/screen_status.dart';
import '../../../core/theme/app_palette.dart';
import '../../../core/theme/app_shadows.dart';
import '../../../core/theme/app_text_styles.dart';
import '../../../core/widgets/app_svg_icon.dart';
import '../../../data/models/monitor_item_model.dart';
import '../controllers/screen_details_controller.dart';
import '../widgets/screen_action_buttons.dart';
import '../widgets/screen_status_badge.dart';

part 'parts/screen_details_header.dart';
part 'parts/screen_details_card.dart';

/// يبني شاشة ScreenDetailsView ويربطها بالـ controller أو البيانات الخاصة بها.
class ScreenDetailsView extends GetView<ScreenDetailsController> {
  const ScreenDetailsView({super.key});

  static final _fallbackScreen = MonitorItemModel(
    id: 'fallback-monitor',
    name: 'F-p-qmr-04',
    schoolName: 'أبتدائية القمر للبنين الثاني هـ',
    ipAddress: '10.15.33.60',
    macAddress: '00:02:75:ct:b6:b3',
    status: ScreenStatus.online,
    appStatus: 'Access',
    lastSeen: DateTime(2025, 11, 29, 9, 56),
  );

  @override
  Widget build(BuildContext context) {
    final screen = controller.screen ?? _fallbackScreen;
    final bottomPadding = MediaQuery.of(context).padding.bottom;
    final viewportHeight = MediaQuery.of(context).size.height;
    final minContentHeight = 850 + bottomPadding;
    final contentHeight =
        viewportHeight > minContentHeight ? viewportHeight : minContentHeight;

    return Scaffold(
      backgroundColor: context.colors.canvas,
      body: Directionality(
        textDirection: TextDirection.rtl,
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: SizedBox(
            height: contentHeight,
            child: Stack(
              children: [
                const _DetailsHeader(),
                const Positioned(
                  left: 20,
                  right: 12,
                  top: 306,
                  child: _DetailsActionsCard(),
                ),
                Positioned(
                  left: 22,
                  right: 12,
                  top: 416,
                  child: _DetailsCard(screen: screen),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
