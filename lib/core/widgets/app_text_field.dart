import 'package:flutter/material.dart';

import '../theme/app_colors.dart';
import '../theme/app_radius.dart';
import '../theme/app_text_styles.dart';
import 'app_svg_icon.dart';

class AppTextField extends StatefulWidget {
  const AppTextField({
    required this.controller,
    required this.hintText,
    required this.iconAsset,
    super.key,
    this.obscureText = false,
    this.suffix,
    this.height = 51,
    this.radius = AppRadius.md,
    this.borderColor,
    this.focusedBorderColor = const Color(0xFF42AEB7),
    this.fillColor = AppColors.surface,
    this.focusedFillColor = const Color(0xFFEFFBFC),
    this.hintFontSize = 14,
    this.iconColor = AppColors.primary,
    this.focusedIconColor = const Color(0xFF42AEB7),
  });

  final TextEditingController controller;
  final String hintText;
  final String iconAsset;
  final bool obscureText;
  final Widget? suffix;
  final double height;
  final double radius;
  final Color? borderColor;
  final Color focusedBorderColor;
  final Color fillColor;
  final Color focusedFillColor;
  final double hintFontSize;
  final Color iconColor;
  final Color focusedIconColor;

  @override
  State<AppTextField> createState() => _AppTextFieldState();
}

class _AppTextFieldState extends State<AppTextField> {
  final FocusNode _focusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _focusNode.addListener(_handleFocusChange);
  }

  void _handleFocusChange() {
    if (mounted) {
      setState(() {});
    }
  }

  @override
  void dispose() {
    _focusNode.removeListener(_handleFocusChange);
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isFocused = _focusNode.hasFocus;
    final effectiveBorderColor = isFocused
        ? widget.focusedBorderColor
        : widget.borderColor ?? const Color(0xFFECEEEF);
    final effectiveIconColor =
        isFocused ? widget.focusedIconColor : widget.iconColor;

    return Directionality(
      textDirection: TextDirection.rtl,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 180),
        curve: Curves.easeOut,
        height: widget.height,
        padding: const EdgeInsets.symmetric(horizontal: 24),
        decoration: BoxDecoration(
          color: isFocused ? widget.focusedFillColor : widget.fillColor,
          borderRadius: BorderRadius.circular(widget.radius),
          border: Border.all(color: effectiveBorderColor),
          boxShadow: isFocused
              ? const [
                  BoxShadow(
                    color: Color(0x1A42AEB7),
                    blurRadius: 14,
                    offset: Offset(0, 4),
                  ),
                ]
              : null,
        ),
        child: Row(
          children: [
            AppSvgIcon(
              widget.iconAsset,
              color: effectiveIconColor,
              size: widget.hintFontSize + 8,
            ),
            const SizedBox(width: 12),
            Expanded(
              child: TextField(
                focusNode: _focusNode,
                controller: widget.controller,
                obscureText: widget.obscureText,
                textAlign: TextAlign.right,
                textDirection: TextDirection.rtl,
                style: AppTextStyles.body.copyWith(
                  color: AppColors.textPrimary,
                  fontSize: widget.hintFontSize,
                  fontWeight: FontWeight.w400,
                ),
                decoration: InputDecoration.collapsed(
                  hintText: widget.hintText,
                  hintStyle: AppTextStyles.body.copyWith(
                    color: AppColors.textHint,
                    fontSize: widget.hintFontSize,
                    fontWeight: FontWeight.w300,
                  ),
                ),
              ),
            ),
            if (widget.suffix != null) ...[
              const SizedBox(width: 12),
              widget.suffix!,
            ],
          ],
        ),
      ),
    );
  }
}
