import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:news_app/core/presentation/theme/color.dart';
import 'package:news_app/core/presentation/widgets/custom_image.dart';

class InterestCard extends StatelessWidget {
  const InterestCard(
      {super.key,
      required this.isCardSelected,
      required this.imagename,
      required this.cardName});
  final bool isCardSelected;
  final String imagename;
  final String cardName;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      height: 130,
      width: 110,
      padding: const EdgeInsets.symmetric(
        vertical: 16,
        horizontal: 20,
      ),
      decoration: BoxDecoration(
        color: isCardSelected ? blueColor : const Color(0XFFf9f9f9),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(
              vertical: 5,
              horizontal: 5,
            ),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8),
            ),
            child: CustomImage(asset: imagename),
          ),
          const Gap(15),
          Text(
            cardName,
            style: theme.textTheme.labelLarge!.copyWith(
              fontSize: 16,
              color: isCardSelected ? Colors.white : darkText,
            ),
          ),
        ],
      ),
    );
  }
}
