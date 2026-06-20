import 'package:flutter/material.dart';
import 'package:market_place_car/core/extension/app_sizes.dart';
import 'package:market_place_car/core/extension/text_style_extension.dart';
import 'package:market_place_car/presentation/helper/app_asset_helper.dart';

class SpecItem extends StatelessWidget {
  const SpecItem({super.key, required this.icon, required this.label});

  final String icon;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          AppAssetHelper.svgImage(
            icon,
            width: context.width(18),
            height: context.height(18),
          ),

          Flexible(
            child: Text(
              label,
              overflow: TextOverflow.ellipsis,
              style: context.bodyRegular14?.copyWith(color: Color(0xFF999999)),
            ).padStart(4),
          ),
        ],
      ),
    );
  }
}
