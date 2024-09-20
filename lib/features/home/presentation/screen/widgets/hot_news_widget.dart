import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:news_app/core/presentation/res/drawables.dart';
import 'package:news_app/core/presentation/theme/color.dart';
import 'package:news_app/core/presentation/widgets/custom_image.dart';
import 'package:news_app/core/presentation/widgets/svg_image.dart';

class HotNewsWidget extends StatelessWidget {
  const HotNewsWidget({
    super.key,
    required this.title,
    required this.author,
    required this.imageUrl,
    required this.timeAgo,
  });
  final String title;
  final String author;
  final String? imageUrl;
  final String? timeAgo;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.only(right: 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(16),
            child: Container(
              height: 200,
              width: double.infinity,
              //  258,
              decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.circular(
                  16,
                ),
              ),
              child: imageUrl != null
                  ? Image.network(
                      imageUrl!,
                      fit: BoxFit.fill,
                    )
                  : const CustomImage(
                      asset: imgNews,
                      fit: BoxFit.fill,
                      width: double.infinity,
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
            children: [
              CircleAvatar(
                radius: 16,
                backgroundColor: Colors.grey[100],
                child: const SvgImage(
                  asset: icProfile,
                  color: blueColor,
                  height: 18,
                ),
              ),
              const Gap(5),
              Text(
                author,
                style: theme.textTheme.labelMedium!.copyWith(
                  fontSize: 14,
                ),
              ),
              const Spacer(),
              // const Icon(
              //   Icons.schedule_outlined,
              //   color: lowEmphasis,
              //   size: 16,
              // ),
              Text(
                timeAgo ?? '',
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
