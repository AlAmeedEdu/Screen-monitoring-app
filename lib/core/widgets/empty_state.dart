import 'package:flutter/material.dart';

/// يمثل EmptyState كجزء من بنية المشروع ويجمع المسؤولية الخاصة به في مكان واحد.
class EmptyState extends StatelessWidget {
  const EmptyState({super.key});

  @override
  Widget build(BuildContext context) {
    return const SizedBox.shrink(); // empty_state skeleton widget.
  }
}
