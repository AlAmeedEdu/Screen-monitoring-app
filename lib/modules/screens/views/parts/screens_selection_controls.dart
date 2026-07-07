part of '../screens_view.dart';

/// يمثل جزءا داخليا صغيرا من الواجهة لفصل التفاصيل عن الملف الرئيسي.
class _SelectionControls extends StatelessWidget {
  const _SelectionControls({required this.controller});

  final ScreensController controller;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: Directionality(
        textDirection: TextDirection.ltr,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            _SelectionChip(
              label: 'تحديد الكل',
              selected: controller.areAllFilteredScreensSelected,
              width: 98,
              onTap: controller.selectAllFilteredScreens,
            ),
          ],
        ),
      ),
    );
  }
}

/// يمثل جزءا داخليا صغيرا من الواجهة لفصل التفاصيل عن الملف الرئيسي.
class _SelectionChip extends StatelessWidget {
  const _SelectionChip({
    required this.label,
    required this.selected,
    required this.width,
    required this.onTap,
  });

  final String label;
  final bool selected;
  final double width;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final colors = context.colors;
    final accent = colors.accent;

    return Material(
      color: Colors.transparent,
      borderRadius: BorderRadius.circular(AppRadius.pill),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(AppRadius.pill),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 160),
          height: 38,
          width: width,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: selected ? accent : colors.accentSoft,
            borderRadius: BorderRadius.circular(AppRadius.pill),
            border: selected
                ? null
                : Border.all(color: const Color(0xFFD0E9ED), width: 1),
          ),
          child: Text(
            label,
            textAlign: TextAlign.center,
            style: AppTextStyles.caption.copyWith(
              color: selected ? Colors.white : const Color(0xFF71BDC8),
              fontSize: 14,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ),
    );
  }
}

/// يمثل جزءا داخليا صغيرا من الواجهة لفصل التفاصيل عن الملف الرئيسي.
class _SelectionActionBar extends StatelessWidget {
  const _SelectionActionBar({required this.onDelete, required this.onPower});

  final VoidCallback onDelete;
  final VoidCallback onPower;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 13, vertical: 12),
      decoration: BoxDecoration(
        color: context.colors.surface,
        borderRadius: BorderRadius.circular(24),
      ),
      child: Directionality(
        textDirection: TextDirection.ltr,
        child: Center(
          child: ScreenActionButtons(
            size: 55,
            spacing: 24,
            radius: 16,
            onDelete: onDelete,
            onPower: onPower,
          ),
        ),
      ),
    );
  }
}
