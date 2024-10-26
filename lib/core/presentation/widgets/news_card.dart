import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:news_app/core/presentation/theme/color.dart';
import 'package:news_app/core/presentation/widgets/cached_image.dart';

class NewsCardWidget extends StatelessWidget {
  const NewsCardWidget({
    this.isExplore = false,
    super.key,
    required this.imageUrl,
    required this.author,
    required this.title,
    required this.time,
  });
  final bool isExplore;
  final String imageUrl;
  final String author;
  final String title;
  final String time;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return SizedBox(
      height: 140,
      child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: Container(
            height: 100,
            width: 120,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              color: whiteColor,
            ),
            child: CachedImage(imageUrl: imageUrl)
          ),
        ),
        const Gap(10),
        Flexible(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                title,
                maxLines: 5,
                textAlign: TextAlign.justify,
                overflow: TextOverflow.ellipsis,
                softWrap: true,
                style: theme.textTheme.titleLarge!
                    .copyWith(fontSize: 18, color: darkText),
              ),
              const Gap(10),
            ],
          ),
        ),
      ]),
    );
  }
}
