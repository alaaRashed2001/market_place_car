import 'package:flutter/material.dart';

extension ShadowExtensions on BuildContext {
  BoxShadow get appShadow => BoxShadow(
    color: const Color(0xffE8E8F7).withOpacity(.3),
    offset: const Offset(0, 3),
    blurRadius: 14,
  );
  List<BoxShadow> elevation([double opacity = .07]) => [
    BoxShadow(
      color: const Color(0xffEFA5AB).withOpacity(opacity),
      offset: const Offset(0, -3),
      blurRadius: 16,
    ),
  ];
  
}