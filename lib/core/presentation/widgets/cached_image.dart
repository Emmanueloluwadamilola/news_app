import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:news_app/core/presentation/res/drawables.dart';
import 'package:news_app/core/presentation/theme/color.dart';
import 'package:news_app/core/presentation/widgets/custom_image.dart';

class CachedImage extends StatelessWidget {
  const CachedImage({super.key, required this.imageUrl});
  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      fit: BoxFit.fill,
      fadeOutDuration: const Duration(milliseconds: 50),
      fadeInDuration: const Duration(milliseconds: 50),
      imageUrl: imageUrl,
      placeholder: (context, url) => const PlaceholderImage(),
      errorWidget: (context, url, error) => const PlaceholderImage(),
    );
  }
}

class PlaceholderImage extends StatelessWidget {
  const PlaceholderImage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: whiteColor,
      ),
      child: const Center(
        child: CustomImage(
          asset: imgAppLogo,
          height: 70,
          width: 70,
        ),
      ),
    );
  }
}
