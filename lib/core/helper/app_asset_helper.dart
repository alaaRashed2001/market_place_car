import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:market_place_car/core/constants/app_images.dart';
import 'package:market_place_car/core/extension/opacity_of_color.dart';

mixin AppAssetHelper {
  static Widget svgImage(
    String? path_, {
    Color? color,
    double? width,
    double? height,
    BoxFit fit = BoxFit.contain,
    Widget? placeholderBuilder,
    bool network = false,
    double opacity = 1,
  }) {
    String path = path_ ?? '';
    if (path.isEmpty) return SizedBox(width: width, height: height);
    final ColorFilter? colorFilter = color?.toColorFilter();
    return Opacity(
      opacity: opacity,
      child: !network
          ? SvgPicture.asset(
              path,
              width: width,
              height: height,
              colorFilter: colorFilter,
              fit: fit,
              errorBuilder: (context, error, stackTrace) => errorImageBuilder,
            )
          : SvgPicture.network(
              path,
              width: width,
              height: height,
              colorFilter: colorFilter,
              fit: fit,
              errorBuilder: (context, error, stackTrace) => errorImageBuilder,
            ),
    );
  }

  static Widget cachedImage(
    String? image, {
    double? width = double.infinity,
    double? height,
    Color? color,
    Widget? errorBuilder,
  }) {
    String image_ = image ?? '';
    bool svg = image_.contains('.svg');

    return !svg
        ? CachedNetworkImage(
            imageUrl: image_,
            width: width,
            height: height,
            fit: BoxFit.cover,
            color: color,
            errorWidget: (c, url, error) => errorBuilder ?? errorImageBuilder,
          )
        : svgImage(
            image_,
            width: width,
            height: height,
            color: color,
            network: true,
            placeholderBuilder: errorBuilder,
          );
  }

  static Widget get errorImageBuilder {
    return Padding(padding: const EdgeInsets.all(6), child: appLogo());
  }

  static Widget appLogo({
    double? width,
    double? height,
    BoxFit fit = BoxFit.contain,
  }) {
    final String logo = AppImages.logo;

    if (logo.endsWith('.svg')) {
      return SvgPicture.asset(logo, width: width, height: height, fit: fit);
    }

    return Image.asset(logo, width: width, height: height, fit: fit);
  }
}
