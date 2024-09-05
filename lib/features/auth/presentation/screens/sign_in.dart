import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:news_app/core/presentation/theme/color.dart';
import 'package:news_app/core/presentation/utils/navigation_mixin.dart';
import 'package:news_app/core/presentation/widgets/clickable.dart';
import 'package:news_app/core/presentation/widgets/custom_button.dart';
import 'package:news_app/core/presentation/widgets/input_field.dart';
import 'package:news_app/features/auth/presentation/screens/sign_up.dart';

class SignInScreen extends StatefulWidget {
  static const id = 'sign-in';
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final mailController = TextEditingController();
  final mailFocus = FocusNode();
  final passwordController = TextEditingController();
  final passwordFocus = FocusNode();
  bool isPasswordFocused = false;
  bool isPasswordControllerEmpty = true;
  bool isMailFocused = false;
  bool isMailControllerEmpty = true;

  @override
  void initState() {
    mailController.addListener(() {
      setState(() {
        isMailControllerEmpty = mailController.text.isEmpty;
      });
    });

    mailFocus.addListener(() {
      setState(() {
        isMailFocused = mailFocus.hasFocus;
      });
    });
    passwordFocus.addListener(() {
      setState(() {
        isPasswordFocused = passwordFocus.hasFocus;
      });
    });
    passwordController.addListener(() {
      setState(() {
        isPasswordControllerEmpty = passwordController.text.isEmpty;
      });
    });
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
              'Login Account',
              style: theme.textTheme.titleLarge!.copyWith(fontSize: 24),
            ),
            const Gap(8),
            Text(
              'Please login with registered account',
              style: theme.textTheme.labelMedium!.copyWith(fontSize: 16),
            ),
            const Gap(40),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    InputField(
                      inputFieldLabel: 'Email',
                      hint: 'Enter username',
                      controller: mailController,
                      icon: Icons.mail_outline,
                      focusNode: mailFocus,
                      isFocused: isMailFocused,
                      isControllerEmpty: isMailControllerEmpty,
                      keyboardType: TextInputType.emailAddress,
                    ),
                    const Gap(30),
                    InputField(
                      inputFieldLabel: 'Password',
                      hint: '*********',
                      controller: passwordController,
                      icon: Icons.lock_outline,
                      focusNode: passwordFocus,
                      isFocused: isPasswordFocused,
                      isControllerEmpty: isPasswordControllerEmpty,
                      isPassword: true,
                    ),
                    const Gap(15),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Clickable(
                          onPressed: () {},
                          child: Text(
                            'Forgot password?',
                            style: theme.textTheme.bodyLarge!
                                .copyWith(color: blueColor),
                          ),
                        ),
                      ],
                    ),
                    const Gap(30),
                    CustomButton(
                      onTap: () {},
                      title: 'Login',
                    ),
                    const Gap(20),
                    Clickable(
                      onPressed: () {
                        context.pushNamedReplacement(SignUpScreen.id);
                      },
                      child: Text(
                        "Don't have an account?",
                        style: theme.textTheme.titleMedium!.copyWith(
                          color: lowEmphasis,
                        ),
                      ),
                    ),
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
