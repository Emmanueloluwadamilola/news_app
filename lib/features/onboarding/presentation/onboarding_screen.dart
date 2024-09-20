import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:news_app/core/presentation/theme/color.dart';
import 'package:news_app/core/presentation/utils/navigation_mixin.dart';
import 'package:news_app/core/presentation/widgets/clickable.dart';
import 'package:news_app/core/presentation/widgets/custom_button.dart';
import 'package:news_app/core/presentation/widgets/custom_image.dart';
import 'package:news_app/features/auth/presentation/screens/sign_in.dart';
import 'package:news_app/features/auth/presentation/screens/sign_up.dart';
import 'package:news_app/features/onboarding/manager/onboarding_provider.dart';
import 'package:provider/provider.dart';
import 'package:gap/gap.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  static const String id = "onboarding-screen";

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _controller = PageController(initialPage: 0);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return ChangeNotifierProvider(
      create: (_) => OnboardingProvider(),
      child: Consumer<OnboardingProvider>(
        builder: (_, provider, __) {
          final title = provider.title[provider.page];
          final subtitle = provider.subTitle[provider.page];
          final loginText = provider.logn[provider.page];
          return Scaffold(
            backgroundColor: Colors.white,
            body: Stack(
              //crossAxisAlignment: CrossAxisAlignment.center,
              // mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  child: PageView.builder(
                    controller: _controller,
                    itemCount: provider.imgs.length,
                    onPageChanged: (value) {
                      provider.setPage(value);
                    },
                    itemBuilder: (context, index) {
                      return Stack(children: [
                        CustomImage(
                          height: double.infinity,
                          asset: provider.imgs[index],
                          fit: BoxFit.fitHeight,
                        ),
                        Container(
                          height: MediaQuery.of(context).size.height * 0.7,
                          decoration: const BoxDecoration(
                            gradient: LinearGradient(
                                colors: [Colors.transparent, Colors.white],
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter),
                          ),
                        ),
                      ]);
                    },
                  ),
                ),
                Positioned(
                  top: MediaQuery.of(context).size.height * 0.7,
                  child: Container(
                    height: MediaQuery.of(context).size.height * 0.3,
                    width: MediaQuery.of(context).size.width,
                    color: Colors.white,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Gap(MediaQuery.of(context).size.height * 0.55),
                      Text(
                        title,
                        textAlign: TextAlign.center,
                        style: theme.textTheme.titleLarge?.copyWith(
                          fontSize: 24,
                        ),
                      ),
                      const Gap(10),
                      Text(
                        subtitle,
                        textAlign: TextAlign.center,
                        style: theme.textTheme.titleSmall?.copyWith(
                          fontSize: 14,
                          color: greyText2,
                        ),
                      ),
                      const Gap(20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: List.generate(provider.imgs.length, (index) {
                          return Container(
                            margin: const EdgeInsets.only(right: 6),
                            height: index == provider.page ? 8 : 6,
                            width: index == provider.page ? 8 : 6,
                            decoration: BoxDecoration(
                              color: index == provider.page
                                  ? theme.colorScheme.primary
                                  : lowEmphasis,
                              borderRadius: BorderRadius.circular(150),
                            ),
                          );
                        }),
                      ),
                      const Gap(30),
                      CustomButton(
                        onTap: () {
                          if (provider.isEnd()) {
                            provider.setOnboarding();
                            context.pushNamedReplacement(SignUpScreen.id);
                          } else {
                            _controller.animateToPage(provider.page + 1,
                                duration: const Duration(milliseconds: 500),
                                curve: Curves.easeInExpo);
                          }
                        },
                        title: loginText,
                      ),
                      const Gap(20),
                      Clickable(
                        onPressed: () {
                          context.pushNamed(SignInScreen.id);
                        },
                        child: Text(
                          'Already have an account?',
                          style: theme.textTheme.bodyLarge!
                              .copyWith(color: blueColor),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
