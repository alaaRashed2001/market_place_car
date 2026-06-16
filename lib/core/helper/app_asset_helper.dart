import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:market_place_car/presentation/widgets/shared_component/loading.dart';
mixin AppAssetHelper {
  static Widget cachedImage(
    String? image, {
    double? width = double.infinity,
    double? height,
    Color? color,
    Widget? errorBuilder,
  }) {
    String image_ = image ?? '';
    return CachedNetworkImage(
      imageUrl: image_,
      width: width,
      fit: BoxFit.cover,
      height: height,
      color: color,
      placeholder: (context, url) => Loading(),
      errorWidget: (context, url, error) => const Icon(Icons.error),
    );
  }
}
