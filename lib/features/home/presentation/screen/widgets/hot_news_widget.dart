
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:news_app/core/presentation/widgets/cached_image.dart';

class HotNewsWidget extends StatelessWidget {
  const HotNewsWidget(
      {super.key,
      required this.title,
      required this.author,
      required this.imageUrl,
      required this.timeAgo,
      required this.content});
  final String title;
  final String? author;
  final String? imageUrl;
  final String? timeAgo;
  final String content;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.only(right: 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Hero(
            tag: imageUrl!,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: Container(
                height: 200,
                width: double.infinity,
                //  258,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(
                    16,
                  ),
                ),
                child: 
                     CachedImage(imageUrl: imageUrl!)
                    // : const CustomImage(
                    //     asset: imgNews,
                    //     fit: BoxFit.fill,
                    //     width: double.infinity,
                    //   ),
              ),
            ),
          ),
          const Gap(10),
          SizedBox(
            width: double.infinity,
            child: Text(
              title,
              maxLines: 2,
              overflow: TextOverflow.visible,
              softWrap: true,
              style: theme.textTheme.titleLarge!.copyWith(
                fontSize: 18,
              ),
            ),
          ),
          const Gap(8),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(
                child: Text(
                  author == 'null' ? 'Author' : author!,
                  maxLines: 1,
                  style: theme.textTheme.labelMedium!.copyWith(
                    fontSize: 14,
                  ),
                ),
              ),
              // const Spacer(),
              // const Icon(
              //   Icons.schedule_outlined,
              //   color: lowEmphasis,
              //   size: 16,
              // ),
              Text(
                timeAgo ?? '',
                textAlign: TextAlign.end,
                style: theme.textTheme.labelMedium!.copyWith(
                  fontSize: 12,
                ),
              ),
              // const Gap(15),
              // const Icon(
              //   Icons.comment,
              //   color: lowEmphasis,
              //   size: 16,
              // ),
              // Text(
              //   '50',
              //   style: theme.textTheme.labelMedium!.copyWith(
              //     fontSize: 12,
              //   ),
              // ),
            ],
          ),
        ],
      ),
    );
  }
}
