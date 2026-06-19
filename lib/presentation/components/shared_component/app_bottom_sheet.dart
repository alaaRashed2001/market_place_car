import 'package:flutter/material.dart';

class AppBottomSheet {
  AppBottomSheet._();

  static Future<T?> show<T>({
    required BuildContext context,
    required WidgetBuilder builder,
    bool isDismissible = true,
    bool enableDrag = true,
    bool isScrollControlled = true,
  }) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return showModalBottomSheet<T>(
      context: context,
      isDismissible: isDismissible,
      enableDrag: enableDrag,
      isScrollControlled: isScrollControlled,
      backgroundColor: Colors.transparent,
      builder: (context) {
        final bottomInset = MediaQuery.of(context).viewInsets.bottom;

        return Padding(
          padding: EdgeInsets.only(bottom: bottomInset),
          child: Container(
            decoration: BoxDecoration(
              color: isDark ? const Color(0xFF121214) : Colors.white,
              borderRadius: const BorderRadius.vertical(
                top: Radius.circular(24),
              ),
            ),
            child: SafeArea(top: false, child: builder(context)),
          ),
        );
      },
    );
  }

  static Future<T?> showScrollable<T>({
    required BuildContext context,
    required Widget Function(BuildContext, ScrollController) scrollableBuilder,
    bool isDismissible = true,
    bool enableDrag = true,
    double initialChildSize = 0.65,
    double minChildSize = 0.3,
    double maxChildSize = 0.85,
  }) {
    return show<T>(
      context: context,
      isDismissible: isDismissible,
      enableDrag: enableDrag,
      isScrollControlled: true,
      builder: (context) {
        return DraggableScrollableSheet(
          initialChildSize: initialChildSize,
          minChildSize: minChildSize,
          maxChildSize: maxChildSize,
          expand: false,
          snap: true,
          builder: (context, scrollController) {
            return scrollableBuilder(context, scrollController);
          },
        );
      },
    );
  }
}
