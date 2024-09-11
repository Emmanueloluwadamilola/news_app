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
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.only(right: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(16),
            child: Container(
              height: 180,
              width: 258,
              decoration: BoxDecoration(
                // color: Colors.blue,
                borderRadius: BorderRadius.circular(
                  16,
                ),
              ),
              child: Stack(
                children: [
                  CustomImage(
                    asset: imgNews,
                    fit: BoxFit.fill,
                  ),
                  Positioned(
                    right: 20,
                    child: IconButton(
                        onPressed: () {},
                        icon: Icon(
                          CupertinoIcons.heart,
                          color: whiteColor,
                        )),
                  ),
                ],
              ),
            ),
          ),
          const Gap(10),
          SizedBox(
            width: 270,
            child: Text(
              'Hot News surfaceCreated 1 #8 io.flutter.embedding.android',
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
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
                'Alley',
                style: theme.textTheme.labelMedium!.copyWith(
                  fontSize: 14,
                ),
              ),
              const Gap(95),
              const Icon(
                Icons.schedule_outlined,
                color: lowEmphasis,
                size: 16,
              ),
              Text(
                '5hr ago',
                style: theme.textTheme.labelMedium!.copyWith(
                  fontSize: 12,
                ),
              ),
              const Gap(15),
              const Icon(
                Icons.comment,
                color: lowEmphasis,
                size: 16,
              ),
              Text(
                '50',
                style: theme.textTheme.labelMedium!.copyWith(
                  fontSize: 12,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
