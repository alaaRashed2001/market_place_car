import 'package:flutter/material.dart';

class PageIndicator extends StatelessWidget {
  final int currentPage;
  final int itemCount;
  final double selectedWidth;
  final double dotSize;
  final Duration duration;

  const PageIndicator({
    super.key,
    required this.currentPage,
    required this.itemCount,
    this.selectedWidth = 35,
    this.dotSize = 9,
    this.duration = const Duration(milliseconds: 300),
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(itemCount, (index) {
        final isSelected = currentPage == index;

        return AnimatedContainer(
          duration: duration,
          width: isSelected ? selectedWidth : dotSize,
          height: dotSize,
          margin: const EdgeInsets.symmetric(horizontal: 2),
          decoration: BoxDecoration(
            color: isSelected
                ? Theme.of(context).colorScheme.primary
                : Theme.of(context).colorScheme.surfaceContainerHighest,
            borderRadius: BorderRadius.circular(23.11),
          ),
        );
      }),
    );
  }
}