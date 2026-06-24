import 'dart:ui';

import 'package:flutter/material.dart';

class BlurredHeaderImage extends StatelessWidget {
  const BlurredHeaderImage({
    required this.asset,
    required this.borderRadius,
    super.key,
    this.alignment = Alignment.center,
    this.blur = 3,
    this.overlayOpacity = .24,
  });

  final String asset;
  final BorderRadius borderRadius;
  final Alignment alignment;
  final double blur;
  final double overlayOpacity;

  @override
  Widget build(BuildContext context) {
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
          ColoredBox(color: Colors.white.withValues(alpha: overlayOpacity)),
        ],
      ),
    );
  }
}
