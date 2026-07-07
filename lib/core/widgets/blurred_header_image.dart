import 'dart:ui';

import 'package:flutter/material.dart';

import '../theme/app_palette.dart';

/// يمثل BlurredHeaderImage كجزء من بنية المشروع ويجمع المسؤولية الخاصة به في مكان واحد.
class BlurredHeaderImage extends StatelessWidget {
  const BlurredHeaderImage({
    required this.asset,
    required this.borderRadius,
    super.key,
    this.alignment = Alignment.center,
    this.blur = 3,
    this.overlayOpacity = .24,
    this.darkOverlayOpacity = .58,
  });

  final String asset;
  final BorderRadius borderRadius;
  final Alignment alignment;
  final double blur;
  final double overlayOpacity;
  final double darkOverlayOpacity;

  @override
  Widget build(BuildContext context) {
    final overlayColor = context.isAppDarkMode
        ? const Color(0xFF061113).withValues(alpha: darkOverlayOpacity)
        : Colors.white.withValues(alpha: overlayOpacity);

    return ClipRRect(
      borderRadius: borderRadius,
      child: Stack(
        fit: StackFit.expand,
        children: [
          ImageFiltered(
            imageFilter: ImageFilter.blur(sigmaX: blur, sigmaY: blur),
            child: Transform.scale(
              scale: 1.04,
              child:
                  Image.asset(asset, fit: BoxFit.cover, alignment: alignment),
            ),
          ),
          ColoredBox(color: overlayColor),
        ],
      ),
    );
  }
}
