import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:news_app/core/presentation/theme/color.dart';

class NewsCardWidget extends StatelessWidget {
  const NewsCardWidget({
    this.isExplore = false,
    super.key,
  });
  final bool isExplore;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      padding: const EdgeInsets.symmetric(
        vertical: 15,
        horizontal: 12,
      ),
      height: 180,
      width: isExplore ? 300 : MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: blueColor,
      ),
      child: Row(
        children: [
          Flexible(
            child: Column(
              children: [
                const Spacer(),
                Text(
                  'While the defeat marked a disappointing start to Barcelona’s UCL campaign, Pedri remained optimistic about their prospects',
                  maxLines: 2,
                  textAlign: TextAlign.justify,
                  overflow: TextOverflow.ellipsis,
                  softWrap: true,
                  style: theme.textTheme.titleLarge!
                      .copyWith(fontSize: 18, color: whiteColor),
                ),
                const Gap(10),
                Row(
                  children: [
                    Text(
                      'Barry Alley',
                      style: theme.textTheme.labelMedium!
                          .copyWith(fontSize: 14, color: whiteColor),
                    ),
                    const Gap(10),
                    Text(
                      '5hr ago',
                      style: theme.textTheme.labelMedium!
                          .copyWith(fontSize: 12, color: whiteColor),
                    ),
                  ],
                ),
              ],
            ),
          ),
          const Gap(10),
          // Container(
          //   height: 120,
          //   width: 120,
          //   decoration: BoxDecoration(
          //       borderRadius: BorderRadius.circular(12), color: blueColor),
          // )
        ],
      ),
    );
  }
}
