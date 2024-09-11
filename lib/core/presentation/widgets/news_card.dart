
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:news_app/core/presentation/theme/color.dart';

class NewsCardWidget extends StatelessWidget {
  const NewsCardWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      padding: const EdgeInsets.symmetric(
        vertical: 15,
        horizontal: 12,
      ),
      height: 160,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: const Color.fromARGB(
          255,
          242,
          242,
          247,
        ),
      ),
      child: Row(
        children: [
          Flexible(
            child: Column(
              children: [
                Text(
                  'Hot News surfaceCreated 1 #8 io.flutter.embedding.android',
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                  softWrap: true,
                  style: theme.textTheme.titleLarge!.copyWith(
                    fontSize: 18,
                  ),
                ),
                const Spacer(),
                Row(
                  children: [
                    Text(
                      'Barry Alley',
                      style: theme.textTheme.labelMedium!.copyWith(
                        fontSize: 14,
                      ),
                    ),
                    const Gap(10),
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
                    const Gap(10),
                    Text(
                      '5hr ago',
                      style: theme.textTheme.labelMedium!.copyWith(
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          const Gap(10),
          Container(
            height: 120,
            width: 120,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12), color: blueColor),
          )
        ],
      ),
    );
  }
}
