import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:logger/logger.dart';
import 'package:news_app/core/config/config.dart';
import 'package:news_app/core/presentation/theme/color.dart';
import 'package:news_app/core/presentation/utils/navigation_mixin.dart';
import 'package:news_app/core/presentation/widgets/app_logo.dart';
import 'package:news_app/features/auth/presentation/screens/sign_in.dart';

import 'package:news_app/features/home/presentation/screen/index_screen.dart';
import 'package:news_app/features/auth/presentation/screens/language_screen.dart';
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
        //  Logger().i('>>>>>>>>>>>>>>>. $event');
        if (FirebaseAuth.instance.currentUser == null) {
          Logger().i('>>>>>>>>>>>>>>>. $event');
          if (event == 0) {
            context.pushNamedReplacement(OnboardingScreen.id);
          } else if (event == -1) {
            context.pushNamedReplacement(LanguageScreen.id);
          } else if (event == 1) {
            // context.pushNamedReplacement(OnboardingScreen.id);
            context.pushNamedReplacement(SignInScreen.id);
          }
        } else {
          user = FirebaseAuth.instance.currentUser;
          if (event == -1) {
            context.pushNamedReplacement(LanguageScreen.id);
          } else {
            context.pushNamedReplacement(IndexScreen.id);
          }
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
                const AppLogo(),
                const Gap(5),
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
