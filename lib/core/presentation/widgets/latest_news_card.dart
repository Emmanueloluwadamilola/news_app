import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:news_app/core/presentation/theme/color.dart';

class LatestNewsCard extends StatelessWidget {
  const LatestNewsCard({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Column(
      children: [
        Container(
          height: 120,
          width: double.infinity,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12), color: blueColor),
        ),
        const Gap(10),
        Text(
          'This is hot new frm the stables of arise tv',
          style: theme.textTheme.titleLarge!.copyWith(
            fontSize: 18,
          ),
        )
      ],
    );
  }
}
