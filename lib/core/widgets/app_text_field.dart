import 'package:flutter/material.dart';

import '../theme/app_palette.dart';
import '../theme/app_radius.dart';
import '../theme/app_text_styles.dart';
import 'app_svg_icon.dart';

/// يعرض حقل إدخال موحد الشكل ويستقبل النص من المستخدم.
class AppTextField extends StatefulWidget {
  const AppTextField({
    required this.controller,
    required this.hintText,
    required this.iconAsset,
    super.key,
    this.obscureText = false,
    this.suffix,
    this.suffixBuilder,
    this.leadingIcon,
    this.height = 51,
    this.radius = AppRadius.md,
    this.borderColor,
    this.focusedBorderColor,
    this.fillColor,
    this.focusedFillColor,
    this.hintFontSize = 14,
    this.horizontalPadding = 20,
    this.iconColor,
    this.focusedIconColor,
  });

  final TextEditingController controller;
  final String hintText;
  final String iconAsset;
  final bool obscureText;
  final Widget? suffix;
  final Widget Function(bool isFocused)? suffixBuilder;
  final Widget? leadingIcon;
  final double height;
  final double radius;
  final Color? borderColor;
  final Color? focusedBorderColor;
  final Color? fillColor;
  final Color? focusedFillColor;
  final double hintFontSize;
  final double horizontalPadding;
  final Color? iconColor;
  final Color? focusedIconColor;

  @override
  State<AppTextField> createState() => _AppTextFieldState();
}

/// يجمع قيما أو عناصر عامة تستخدم في أكثر من مكان داخل التطبيق.
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
    final colors = context.colors;
    final effectiveBorderColor = isFocused
        ? widget.focusedBorderColor ?? colors.accent
        : widget.borderColor ?? colors.border;
    final effectiveIconColor = isFocused
        ? widget.focusedIconColor ?? colors.accent
        : widget.iconColor ?? colors.icon;
    final effectiveFillColor = isFocused
        ? widget.focusedFillColor ?? colors.accentSoft
        : widget.fillColor ?? colors.surface;

    return Directionality(
      textDirection: TextDirection.rtl,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 180),
        curve: Curves.easeOut,
        height: widget.height,
        padding: EdgeInsets.symmetric(horizontal: widget.horizontalPadding),
        decoration: BoxDecoration(
          color: effectiveFillColor,
          borderRadius: BorderRadius.circular(widget.radius),
          border: Border.all(color: effectiveBorderColor),
          boxShadow: isFocused
              ? [
                  BoxShadow(
                    color: context.isAppDarkMode
                        ? Colors.black.withValues(alpha: .28)
                        : const Color(0x1A42AEB7),
                    blurRadius: context.isAppDarkMode ? 18 : 14,
                    offset: const Offset(0, 4),
                  ),
                ]
              : null,
        ),
        child: Row(
          children: [
            widget.leadingIcon ??
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
                  color: colors.primaryText,
                  fontSize: widget.hintFontSize,
                  fontWeight: FontWeight.w400,
                ),
                decoration: InputDecoration.collapsed(
                  hintText: widget.hintText,
                  hintStyle: AppTextStyles.body.copyWith(
                    color: colors.hintText,
                    fontSize: widget.hintFontSize,
                    fontWeight: FontWeight.w300,
                  ),
                ),
              ),
            ),
            if (widget.suffixBuilder != null || widget.suffix != null) ...[
              const SizedBox(width: 12),
              widget.suffixBuilder?.call(isFocused) ?? widget.suffix!,
            ],
          ],
        ),
      ),
    );
  }
}
