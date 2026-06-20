import 'package:flutter/material.dart';
import 'package:market_place_car/core/extension/app_box_shadow.dart';
import 'package:market_place_car/core/extension/app_sizes.dart';

class AppBottomSheet {
  AppBottomSheet._();
  static Future<T?> show<T>({
    required BuildContext context,

    required Widget Function(
      BuildContext context,
      ScrollController? scrollController,
    )
    builder,
    bool isDismissible = true,
    bool enableDrag = true,
    bool useSafeArea = true,
    bool showHandle = true,

    bool isScrollable = false,
    double initialChildSize = 0.5,
    double minChildSize = 0.25,
    double maxChildSize = 0.9,
  }) {
    return showModalBottomSheet<T>(
      context: context,
      isDismissible: isDismissible,
      enableDrag: enableDrag,
      isScrollControlled: true,
      showDragHandle: showHandle,

      builder: (outerContext) {
        final bottomInset = MediaQuery.of(outerContext).viewInsets.bottom;

        return Padding(
          padding: context.spaceBottom(bottomInset),
          child: Container(
            decoration: BoxDecoration(boxShadow: [context.appShadow]),
            child: SafeArea(
              top: false,
              bottom: useSafeArea,
              child: isScrollable
                  ? DraggableScrollableSheet(
                      initialChildSize: initialChildSize,
                      minChildSize: minChildSize,
                      maxChildSize: maxChildSize,
                      expand: false,
                      snap: true,
                      builder: (context, scrollController) {
                        return builder(context, scrollController);
                      },
                    )
                  : builder(context, null),
            ),
          ),
        );
      },
    );
  }
}
