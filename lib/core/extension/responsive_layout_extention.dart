import 'package:flutter/material.dart';

extension ResponsiveLayoutExtention on BuildContext {
  double get width => MediaQuery.sizeOf(this).width;
  double get height => MediaQuery.sizeOf(this).height;

  double wp(double percentage) => width * (percentage / 100);
  double hp(double percentage) => height * (percentage / 100);

  // S get loc => S.of(this);
}

class VerticalSpaceWidget extends StatelessWidget {
  const VerticalSpaceWidget(this.percentage, {super.key});
  final double percentage;
  @override
  Widget build(BuildContext context) {
    return SizedBox(height: context.hp(percentage));
  }
}

class HorizontalSpaceWidget extends StatelessWidget {
  const HorizontalSpaceWidget(this.percentage, {super.key});
  final double percentage;
  @override
  Widget build(BuildContext context) {
    return SizedBox(width: context.wp(percentage));
  }
}
