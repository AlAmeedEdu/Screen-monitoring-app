import 'package:flutter/material.dart';

/// يعرض عنصر تفاعل صغير موحد الشكل داخل الواجهة.
class AppButton extends StatelessWidget {
  const AppButton({super.key});

  @override
  Widget build(BuildContext context) {
    return const SizedBox.shrink(); // app_button skeleton widget.
  }
}
