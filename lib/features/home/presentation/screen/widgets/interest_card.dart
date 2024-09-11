import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:news_app/core/presentation/theme/color.dart';
import 'package:news_app/core/presentation/widgets/clickable.dart';
import 'package:news_app/core/presentation/widgets/custom_image.dart';
import 'package:news_app/features/home/presentation/manager/home_provider.dart';
import 'package:provider/provider.dart';

class InterestCard extends StatefulWidget {
  const InterestCard(
      {super.key,
      required this.index,
      required this.imagename,
      required this.cardName});
  final int index;
  final String imagename;
  final String cardName;

  @override
  State<InterestCard> createState() => _InterestCardState();
}

class _InterestCardState extends State<InterestCard> {
  bool isCardSelected = false;
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Consumer<HomeProvider>(
      builder: (_, provider, __) {
        //final state = provider.state;
        return Clickable(
          onPressed: () {
            setState(() {
              isCardSelected = !isCardSelected;
            });

            isCardSelected
                ? provider.addInterest(widget.index)
                : provider.removeInterest(widget.index);
          },
          child: Container(
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
                  child: CustomImage(asset: widget.imagename),
                ),
                const Gap(15),
                Text(
                  widget.cardName,
                  style: theme.textTheme.labelLarge!.copyWith(
                    fontSize: 16,
                    color: isCardSelected ? Colors.white : darkText,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
