import 'package:flutter/material.dart';
import 'package:market_place_car/core/constants/app_images.dart';
import 'package:market_place_car/core/extension/app_box_shadow.dart';
import 'package:market_place_car/core/extension/app_sizes.dart';
import 'package:market_place_car/core/extension/text_style_extension.dart';
import 'package:market_place_car/presentation/components/home_components/spec_item.dart';
import 'package:market_place_car/presentation/components/shared_component/page_indicator.dart';
import 'package:market_place_car/presentation/components/shared_component/vertical_divider_container.dart';
import 'package:market_place_car/presentation/helper/app_asset_helper.dart';

class CarListing {
  const CarListing({
    required this.imageUrl,
    required this.brand,
    required this.price,
    required this.transmission,
    required this.seats,
    required this.fuelType,
  });

  final String imageUrl;
  final String brand;
  final String price;
  final String transmission;
  final int seats;
  final String fuelType;
}

class CarSwiperCard extends StatefulWidget {
  const CarSwiperCard({super.key, required this.listings});

  final List<CarListing> listings;

  @override
  State<CarSwiperCard> createState() => _CarSwiperCardState();
}

class _CarSwiperCardState extends State<CarSwiperCard> {
  final PageController _controller = PageController();
  int _activePage = 0;

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: context.fromLTRB(left: 20, top: 20, right: 20, bottom: 20),
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        borderRadius: context.circularRadius(8),
        boxShadow: [context.appShadow],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SizedBox(
            height: context.height(150),
            child: PageView.builder(
              controller: _controller,
              itemCount: widget.listings.length,
              onPageChanged: (index) => setState(() => _activePage = index),
              itemBuilder: (context, index) {
                final listing = widget.listings[index];
                return AppAssetHelper.cachedImage(listing.imageUrl);
              },
            ),
          ),
          context.addVerticalSpace(16),
          HeaderRow(listing: widget.listings[_activePage]),
          context.addVerticalSpace(8),
          CarSpecsRow(listing: widget.listings[_activePage]),

          PageIndicator(
            currentPage: _activePage,
            itemCount: widget.listings.length,
          ).padTop(24),
        ],
      ),
    );
  }
}

class HeaderRow extends StatelessWidget {
  const HeaderRow({super.key, required this.listing});

  final CarListing listing;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Flexible(
          child: Text(
            listing.brand,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: context.titleBold18,
          ),
        ),
        RichText(
          text: TextSpan(
            children: [
              TextSpan(text: "${listing.price}/", style: context.bodyBold14),
              TextSpan(text: 'AED', style: context.bodyRegular14),
            ],
          ),
        ).padStart(8),
      ],
    );
  }
}

class CarSpecsRow extends StatelessWidget {
  const CarSpecsRow({super.key, required this.listing});

  final CarListing listing;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SpecItem(icon: AppImages.transmission, label: listing.transmission),
        const VerticalDividerContainer(),
        SpecItem(icon: AppImages.seats, label: '${listing.seats} seats'),
        const VerticalDividerContainer(),
        SpecItem(icon: AppImages.fuelType, label: listing.fuelType),
      ],
    );
  }
}
