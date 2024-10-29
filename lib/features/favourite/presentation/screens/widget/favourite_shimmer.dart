import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:gap/gap.dart';

class FavouriteNewsShimmer extends StatelessWidget {
  const FavouriteNewsShimmer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.only(bottom: 15),
      child: Column(
        children: [
          Container(
            height: 200,
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: theme.colorScheme.tertiary.withOpacity(0.5),
            ),
          ),
          const Gap(10),
          Container(
            height: 20,
            width: double.infinity,
            decoration: BoxDecoration(
              color: theme.colorScheme.tertiary.withOpacity(0.5),
              borderRadius: BorderRadius.circular(8),
            ),
          ),
          const Gap(10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                height: 20,
                width: 150,
                decoration: BoxDecoration(
                  color: theme.colorScheme.tertiary.withOpacity(0.5),
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              Container(
                height: 20,
                width: 150,
                decoration: BoxDecoration(
                  color: theme.colorScheme.tertiary.withOpacity(0.5),
                  borderRadius: BorderRadius.circular(8),
                ),
              )
            ],
          ),
        ],
      )
          .animate(onPlay: (controller) => controller.repeat(reverse: true))
          .shimmer(delay: 400.ms, duration: 1800.ms, color: Colors.white),
    );
  }
}
