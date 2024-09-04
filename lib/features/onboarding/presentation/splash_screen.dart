import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:news_app/core/presentation/theme/color.dart';
import 'package:news_app/core/presentation/utils/navigation_mixin.dart';
import 'package:news_app/features/onboarding/manager/splash_provider.dart';
import 'package:news_app/features/onboarding/presentation/onboarding_screen.dart';
import 'package:provider/provider.dart';

class SplashScreen extends StatefulWidget {
  static const id = 'splash';
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  SplashProvider? _provider;

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _provider?.listen((event) {
        if (event == 0) {
          context.pushNamed(OnboardingScreen.id);
        } else if (event == 1) {
          context.pushNamed(OnboardingScreen.id);
        }
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return ChangeNotifierProvider(
      create: (_) => SplashProvider(),
      child: Consumer<SplashProvider>(
        builder: (__, provider, _) {
          _provider ??= provider;
          return Scaffold(
            body: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(
                  child: Text(
                    'Paragraf',
                    style: theme.textTheme.titleLarge!.copyWith(fontSize: 40),
                  ),
                ),
                //const Gap(5),
                Text(
                  'News right in your pocket',
                  style: theme.textTheme.bodyMedium!.copyWith(
                    color: greyText,
                    fontSize: 15,
                  ),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
