import 'package:flutter/material.dart';

abstract final class AppShadows {
  static const card = [
    BoxShadow(color: Color(0x140F363B), blurRadius: 16, offset: Offset(0, 8)),
  ];

  static const soft = [
    BoxShadow(color: Color(0xFFECF6F8), blurRadius: 8, offset: Offset(0, 4)),
  ];
}
