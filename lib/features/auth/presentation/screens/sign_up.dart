import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:news_app/core/presentation/res/drawables.dart';
import 'package:news_app/core/presentation/theme/color.dart';
import 'package:news_app/core/presentation/utils/navigation_mixin.dart';
import 'package:news_app/core/presentation/widgets/clickable.dart';
import 'package:news_app/core/presentation/widgets/custom_button.dart';
import 'package:news_app/core/presentation/widgets/custom_loading_widget.dart';
import 'package:news_app/core/presentation/widgets/input_field.dart';
import 'package:news_app/core/presentation/widgets/provider_widget.dart';
import 'package:news_app/core/presentation/widgets/transparent_button.dart';
import 'package:news_app/features/auth/presentation/manager/auth_provider.dart';
import 'package:news_app/features/auth/presentation/screens/otp_screen.dart';
import 'package:news_app/features/auth/presentation/screens/sign_in.dart';

class SignUpScreen extends StatefulWidget {
  static const id = 'sign-up';
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  AuthenticationProvider? _provider;
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      _provider?.listen((event) {
        if (event == 1) {
          context.pushNamed(OtpScreen.id);
        }
      });
    });
    super.initState();
  }

  @override
  void dispose() {
    _provider?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ProviderWidget(
        provider: AuthenticationProvider(),
        children: (provider, theme) {
          _provider ??= provider;
          final state = provider.state;
          final customLoader = LoadingOverlay.of(context);
          return [
            const Gap(10),
            Text(
              'Create Account',
              style: theme.textTheme.titleLarge!.copyWith(fontSize: 24),
            ),
            const Gap(8),
            Text(
              'You can start by creating an account',
              style: theme.textTheme.labelMedium!.copyWith(fontSize: 16),
            ),
            const Gap(40),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    InputField(
                      inputFieldLabel: 'Name',
                      hint: 'Enter your name',
                      icon: Icons.person_outlined,
                      onChange: (value) {
                        setState(() {
                          state.name = value;
                        });
                      },
                    ),
                    const Gap(30),
                    InputField(
                      inputFieldLabel: 'Email',
                      hint: 'Enter username',
                      icon: Icons.mail_outline,
                      keyboardType: TextInputType.emailAddress,
                      onChange: (value) {
                        setState(() {
                          state.email = value;
                        });
                      },
                    ),
                    const Gap(30),
                    InputField(
                      inputFieldLabel: 'Password',
                      hint: '*********',
                      icon: Icons.lock_outline,
                      isPassword: true,
                      onChange: (value) {
                        setState(() {
                          state.password = value;
                        });
                      },
                    ),
                    const Gap(30),
                    CustomButton(
                      onTap: () {
                        provider.signUp().then((value) {
                          customLoader.showLoader();
                        });
                      },
                      title: 'Create Account',
                      isDisabled: state.name == '' ||
                          state.email == '' ||
                          state.password == '',
                    ),
                    const Gap(20),
                    Clickable(
                      onPressed: () {
                        context.pushNamedReplacement(SignInScreen.id);
                      },
                      child: Text(
                        'Already have an account?',
                        style: theme.textTheme.titleMedium!.copyWith(
                          color: lowEmphasis,
                        ),
                      ),
                    ),
                    const Gap(30),
                    TransparentButton(
                      buttonTitle: 'Sign Up with Google',
                      onTap: () {},
                      iconImage: icGoogle,
                    ),
                    const Gap(20),
                    TransparentButton(
                      buttonTitle: 'Sign Up with Facebook',
                      onTap: () {},
                      iconImage: icFacebook,
                      vertPadding: 8,
                      iconHeight: 40,
                    ),
                    const Gap(30),
                  ],
                ),
              ),
            )
          ];
        });
  }
}
