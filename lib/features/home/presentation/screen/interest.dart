import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:news_app/core/presentation/utils/navigation_mixin.dart';
import 'package:news_app/core/presentation/widgets/custom_button.dart';
import 'package:news_app/features/home/presentation/manager/home_provider.dart';
import 'package:news_app/features/home/presentation/screen/index_screen.dart';
import 'package:news_app/features/home/presentation/screen/widgets/interest_card.dart';
import 'package:provider/provider.dart';

class InterestScreen extends StatefulWidget {
  static const id = 'interest';
  const InterestScreen({super.key});

  @override
  State<InterestScreen> createState() => _InterestScreenState();
}

class _InterestScreenState extends State<InterestScreen> {
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
              const Gap(30),
              Expanded(
                child: SingleChildScrollView(
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
                      child: InterestCard(
                        index: index,
                        imagename: image,
                        cardName: interestName,
                      ),
                    );
                  })),
                ),
              ),
              const Gap(30),
              CustomButton(
                isDisabled: state.selectedInterest.isEmpty,
                onTap: () async {
                  await provider.setInterest();
                  context.pushNamed(IndexScreen.id);
                },
                title: 'Proceed',
              ),
            ],
          ),
        ),
      );
    });
  }
}
