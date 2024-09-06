import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:news_app/core/presentation/res/drawables.dart';
import 'package:news_app/core/presentation/widgets/clickable.dart';
import 'package:news_app/features/home/presentation/manager/home_provider.dart';
import 'package:news_app/features/home/presentation/screen/widgets/interest_card.dart';
import 'package:provider/provider.dart';

class InterestScreen extends StatefulWidget {
  static const id = 'interest';
  const InterestScreen({super.key});

  @override
  State<InterestScreen> createState() => _InterestScreenState();
}

class _InterestScreenState extends State<InterestScreen> {
  bool isCardSelected = false;
  int? selectedIndex;
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Consumer<HomeProvider>(builder: (_, provider, __) {
      final state = provider.state;
      return Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 20,
            horizontal: 20,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Gap(30),
              Text(
                "What's your interest?",
                style: theme.textTheme.titleLarge!.copyWith(fontSize: 24),
              ),
              const Gap(8),
              Text(
                'Pick topics to influence the stories you see',
                style: theme.textTheme.labelMedium!.copyWith(fontSize: 16),
              ),
              const Gap(20),
              Expanded(
                child: SingleChildScrollView(
                  //scrollDirection: Axis.horizontal,
                  child: Wrap(
                      children:
                          List.generate(state.interestImage.length, (index) {
                    final image = state.interestImage[index];
                    final interestName = state.interestName[index];
                    return Padding(
                      padding: const EdgeInsets.only(
                        right: 12,
                        bottom: 14,
                      ),
                      child: Clickable(
                        onPressed: () {
                          setState(() {
                            selectedIndex = index;
                          });
                        },
                        child: InterestCard(
                          isCardSelected: index == selectedIndex,
                          imagename: image,
                          cardName: interestName,
                        ),
                      ),
                    );
                  })),
                ),
              ),
            ],
          ),
        ),
      );
    });
  }
}
