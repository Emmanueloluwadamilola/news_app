import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:news_app/core/presentation/res/drawables.dart';
import 'package:news_app/core/presentation/theme/color.dart';
import 'package:news_app/core/presentation/utils/navigation_mixin.dart';
import 'package:news_app/core/presentation/widgets/clickable.dart';
import 'package:news_app/core/presentation/widgets/custom_button.dart';
import 'package:news_app/core/presentation/widgets/input_field.dart';
import 'package:news_app/core/presentation/widgets/transparent_button.dart';
import 'package:news_app/features/auth/presentation/screens/sign_in.dart';

class SignUpScreen extends StatefulWidget {
  static const id = 'sign-up';
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final usernameController = TextEditingController();
  final mailController = TextEditingController();
  final usernameFocus = FocusNode();
  final mailFocus = FocusNode();
  final passwordController = TextEditingController();
  final passwordFocus = FocusNode();
  bool isPasswordFocused = false;
  bool isPasswordControllerEmpty = true;
  bool isUsernameFocused = false;
  bool isMailFocused = false;
  bool isUsernameControllerEmpty = true;
  bool isMailControllerEmpty = true;

  @override
  void initState() {
    usernameController.addListener(() {
      setState(() {
        isUsernameControllerEmpty = usernameController.text.isEmpty;
      });
    });

    mailController.addListener(() {
      setState(() {
        isMailControllerEmpty = mailController.text.isEmpty;
      });
    });

    usernameFocus.addListener(() {
      setState(() {
        isUsernameFocused = usernameFocus.hasFocus;
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
                      controller: usernameController,
                      icon: Icons.person_outlined,
                      isFocused: isUsernameFocused,
                      focusNode: usernameFocus,
                      isControllerEmpty: isUsernameControllerEmpty,
                    ),
                    const Gap(30),
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
                    const Gap(30),
                    CustomButton(
                      onTap: () {},
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
