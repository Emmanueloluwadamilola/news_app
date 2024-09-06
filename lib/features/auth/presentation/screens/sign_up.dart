import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:news_app/core/presentation/res/drawables.dart';
import 'package:news_app/core/presentation/theme/color.dart';
import 'package:news_app/core/presentation/utils/navigation_mixin.dart';
import 'package:news_app/core/presentation/widgets/clickable.dart';
import 'package:news_app/core/presentation/widgets/custom_button.dart';
import 'package:news_app/core/presentation/widgets/input_field.dart';
import 'package:news_app/core/presentation/widgets/transparent_button.dart';
import 'package:news_app/features/auth/presentation/screens/otp_screen.dart';
import 'package:news_app/features/auth/presentation/screens/sign_in.dart';

class SignUpScreen extends StatefulWidget {
  static const id = 'sign-up';
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 20,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Gap(30),
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
                      inputFieldLabel: 'Username',
                      hint: 'Enter username',
                      icon: Icons.person_outlined,
                      onChange: (value) {},
                    ),
                    const Gap(30),
                    InputField(
                      inputFieldLabel: 'Email',
                      hint: 'Enter username',
                      icon: Icons.mail_outline,
                      keyboardType: TextInputType.emailAddress,
                      onChange: (value) {},
                    ),
                    const Gap(30),
                    InputField(
                      inputFieldLabel: 'Password',
                      hint: '*********',
                      icon: Icons.lock_outline,
                      isPassword: true,
                      onChange: (value) {},
                    ),
                    const Gap(30),
                    CustomButton(
                      onTap: () {
                        context.pushNamed(OtpScreen.id);
                      },
                      title: 'Create Account',
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
          ],
        ),
      ),
    );
  }
}
