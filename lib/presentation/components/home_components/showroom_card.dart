import 'package:flutter/material.dart';
import 'package:market_place_car/core/constants/app_images.dart';
import 'package:market_place_car/core/extension/app_sizes.dart';
import 'package:market_place_car/core/extension/text_style_extension.dart';
import 'package:market_place_car/core/global/theme/theme_data/app_theme.dart';
import 'package:market_place_car/presentation/helper/app_asset_helper.dart';

class Showroom {
  const Showroom({
    required this.imageUrl,
    required this.name,
    required this.rating,
  });

  final String imageUrl;
  final String name;
  final double rating;
}

class ShowroomCard extends StatelessWidget {
  const ShowroomCard({super.key, required this.showroom});

  final Showroom showroom;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: context.fromLTRB(left: 10, top: 8, right: 10, bottom: 4),
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        borderRadius: context.circularRadius(8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: context.circularRadius(4),
            child: AspectRatio(
              aspectRatio: 147 / 70,
              child: AppAssetHelper.cachedImage(showroom.imageUrl),
            ),
          ),
          context.addVerticalSpace(6),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Text(
                  showroom.name,
                  overflow: TextOverflow.ellipsis,
                  style: context.bodyRegular14,
                ).padEnd(8),
              ),
              AppAssetHelper.svgImage(AppImages.share,color: Theme.of(context).appColors.svgIconColor, width: 16, height: 16),
            ],
          ),
          context.addVerticalSpace(6),
          Container(
            padding: context.spaceSymmetric(vertical: 4, horizontal: 8),
            decoration: BoxDecoration(
              color: const Color(0xFFFCF4EA),
              borderRadius: context.circularRadius(8),
            ),
            child: Row(
              spacing: 4,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  showroom.rating.toString(),
                  style: context.bodyRegular14?.copyWith(fontSize: 8),
                ),

                const Icon(
                  Icons.star_rounded,
                  size: 14,
                  color: Color(0xFFE7A93C),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
