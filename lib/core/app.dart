
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:news_app/core/presentation/manager/theme_provider.dart';
import 'package:news_app/core/presentation/theme/app_theme.dart';
import 'package:news_app/core/presentation/utils/custom_state.dart';
import 'package:news_app/features/auth/presentation/screens/sign_up.dart';
import 'package:news_app/features/onboarding/presentation/onboarding_screen.dart';
import 'package:news_app/features/onboarding/presentation/splash_screen.dart';
import 'package:provider/provider.dart';

class App extends StatelessWidget with AppTheme {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => ThemeProvider(),
      child: Consumer<ThemeProvider>(
        builder: (_, provider, __) {
          SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
              statusBarColor: Colors.transparent,
              statusBarIconBrightness:
                  provider.isDark ? Brightness.light : Brightness.dark));
          return AnnotatedRegion<SystemUiOverlayStyle>(
            value: provider.isDark
                ? SystemUiOverlayStyle.light
                : SystemUiOverlayStyle.dark,
            child: MaterialApp(
              debugShowCheckedModeBanner: false,
              title: 'Paragraf',
              theme: provider.theme,
              darkTheme: provider.darkThemeData,
              navigatorKey: navigator,
              navigatorObservers: [routeObserver],
              initialRoute: SplashScreen.id,
              routes: {
                SplashScreen.id: (context) => const SplashScreen(),
                 OnboardingScreen.id: (context) => const OnboardingScreen(),
                 SignUpScreen.id: (context) => const SignUpScreen(),
                // LoginScreen.id: (context) => const LoginScreen(),
                // HomeScreen.id: (context) => const HomeScreen(),
                // DashboardScreen.id: (context) => const DashboardScreen(),
                // ForgotPasswordScreen.id: (context) =>
                //     const ForgotPasswordScreen(),
                // ResetPasswordScreen.id: (context) =>
                //     const ResetPasswordScreen(),
                // VerifyEmailScreen.id: (context) => const VerifyEmailScreen(),
                // ShopScreen.id: (context) => const ShopScreen(),
                // NewInstallationScreen.id: (context) =>
                //     const NewInstallationScreen(),
              },
            ),
          );
        },
      ),
    );
  }
}
