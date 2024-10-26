import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:news_app/core/presentation/theme/color.dart';
import 'package:news_app/core/presentation/utils/navigation_mixin.dart';
import 'package:news_app/core/presentation/widgets/clickable.dart';
import 'package:news_app/core/presentation/widgets/custom_button.dart';
import 'package:news_app/core/presentation/widgets/provider_widget.dart';
import 'package:news_app/features/auth/presentation/manager/auth_provider.dart';
import 'package:news_app/features/home/presentation/screen/index_screen.dart';

class LanguageScreen extends StatefulWidget {
  static const id = 'language';
  const LanguageScreen({super.key});

  @override
  State<LanguageScreen> createState() => _LanguageScreenState();
}

class _LanguageScreenState extends State<LanguageScreen> {
  int? selectedIndex;
  @override
  Widget build(BuildContext context) {
    return ProviderWidget(
        provider: AuthenticationProvider(),
        children: (provider, theme) {
          final state = provider.state;
          return [
            const Gap(30),
            Text(
              "Select Language",
              style: theme.textTheme.titleLarge!.copyWith(fontSize: 24),
            ),
            const Gap(8),
            Text(
              'News will be displayed in the langauge you choose',
              style: theme.textTheme.labelMedium!.copyWith(fontSize: 16),
            ),
            const Gap(30),
            Column(
              children: List.generate(state.language.length, (index) {
                final language = state.language[index];
                final languageCode = state.languageCode[index];
                return Padding(
                  padding: const EdgeInsets.only(bottom: 30),
                  child: Clickable(
                    onPressed: () {
                      provider.setLanaguage(languageCode);
                      setState(() {
                        selectedIndex = index;
                      });
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          language,
                          style: theme.textTheme.titleMedium!
                              .copyWith(fontSize: 18),
                        ),
                        if (index == selectedIndex) ...[
                          const Icon(
                            Icons.check,
                            color: blueColor,
                          ),
                        ]
                      ],
                    ),
                  ),
                );
              }),
            ),
            const Gap(40),
            CustomButton(
              isDisabled: state.selectedLanaguage.isEmpty,
              onTap: () {
                context.pushNamedAndClear(IndexScreen.id);
              },
              title: 'Proceed',
            ),
          ];
        });
  }
}
