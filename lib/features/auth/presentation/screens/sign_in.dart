import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:news_app/core/di/core_module_container.dart';
import 'package:news_app/core/domain/util/util.dart';
import 'package:news_app/core/presentation/res/drawables.dart';
import 'package:news_app/core/presentation/theme/color.dart';
import 'package:news_app/core/presentation/utils/navigation_mixin.dart';
import 'package:news_app/core/presentation/widgets/clickable.dart';
import 'package:news_app/core/presentation/widgets/custom_button.dart';
import 'package:news_app/core/presentation/widgets/input_field.dart';
import 'package:news_app/core/presentation/widgets/transparent_button.dart';
import 'package:news_app/features/auth/presentation/screens/sign_up.dart';
import 'package:news_app/features/auth/presentation/screens/widgets/forgot_password.dart';
import 'package:news_app/features/home/presentation/screen/index_screen.dart';
import 'package:news_app/features/home/presentation/screen/interest.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SignInScreen extends StatefulWidget {
  static const id = 'sign-in';
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final _pref = getIt.getAsync<SharedPreferences>();
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
                      onChange: (value) {},
                      inputFieldLabel: 'Email',
                      hint: 'Enter username',
                      icon: Icons.mail_outline,
                      keyboardType: TextInputType.emailAddress,
                    ),
                    const Gap(30),
                    InputField(
                      inputFieldLabel: 'Password',
                      hint: '*********',
                      icon: Icons.lock_outline,
                      isPassword: true,
                      onChange: (value) {},
                    ),
                    const Gap(15),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Clickable(
                          onPressed: () {
                            showModalBottomSheet(
                                context: context,
                                isScrollControlled: true,
                                isDismissible: false,
                                builder: (context) {
                                  // return const ChangePasswordModal();
                                  return const ForgotPasswordModal();
                                });
                          },
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
                      onTap: () {
                        _pref.then((value) {
                          if (value.getBool(interestKey) == null) {
                            context.pushNamed(InterestScreen.id);
                            // return;
                          } else {
                            context.pushNamed(IndexScreen.id);
                          }
                        });
                      },
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
                    const Gap(30),
                    TransparentButton(
                      buttonTitle: 'Sign In with Google',
                      onTap: () {},
                      iconImage: icGoogle,
                    ),
                    const Gap(20),
                    TransparentButton(
                      buttonTitle: 'Sign In with Facebook',
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
