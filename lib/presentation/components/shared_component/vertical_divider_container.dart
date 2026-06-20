import 'package:flutter/material.dart';

class VerticalDividerContainer extends StatelessWidget {
  const VerticalDividerContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 1,
      height: 20,
      margin: const EdgeInsets.symmetric(horizontal: 2),
      color: const Color(0xFFE5E5E5),
    );
  }
}
