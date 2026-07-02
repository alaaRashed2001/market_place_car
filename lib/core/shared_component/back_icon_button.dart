import 'package:flutter/material.dart';
import 'package:market_place_car/core/constants/app_images.dart';
import 'package:market_place_car/core/extension/app_sizes.dart';
import 'package:market_place_car/presentation/helper/app_asset_helper.dart';

class BackIconButton extends StatelessWidget {
  const BackIconButton({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.pop(context),
      child: Container(
        width: 40,
        height: 40,
        padding: context.spaceSymmetric(horizontal: 16.18, vertical: 13),
        margin: context.spaceSymmetric(horizontal: 20, vertical: 16),
        decoration: BoxDecoration(
          color: Color(0xFFFFFFFF),

          borderRadius: context.circularRadius(8),
        ),
        child: AppAssetHelper.svgImage(AppImages.backIcon),
      ),
    );
  }
}
