import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:news_app/core/config/config.dart';
import 'package:news_app/core/presentation/theme/color.dart';

class ProfileImage extends StatelessWidget {
  const ProfileImage({
    super.key,
    required this.initials,
    this.width = 130,
    this.height = 130,
    this.fontSize = 40,
  });
  final String initials;
  final double width;
  final double height;
  final double fontSize;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      height: height,
      width: width,
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
        color: blueColor,
      ),
      child: user!.photoURL == null
          ? Center(
              child: Text(
                initials,
                style: theme.textTheme.titleLarge!.copyWith(
                  fontSize: fontSize,
                  color: whiteColor,
                ),
              ),
            )
          : ClipRRect(
              borderRadius: BorderRadius.circular(100),
              child: CachedNetworkImage(
                fit: BoxFit.cover,
                imageUrl: user!.photoURL!,
                errorWidget: (context, url, error) => Center(
                  child: Text(
                    initials,
                    style: theme.textTheme.titleLarge!.copyWith(
                      fontSize: fontSize,
                      color: whiteColor,
                    ),
                  ),
                ),
                placeholder: (context, url) => Center(
                  child: Text(
                    initials,
                    style: theme.textTheme.titleLarge!.copyWith(
                      fontSize: fontSize,
                      color: whiteColor,
                    ),
                  ),
                ),
              ),
            ),
    );
  }
}
