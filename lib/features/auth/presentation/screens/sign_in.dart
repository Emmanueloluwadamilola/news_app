import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:news_app/core/di/core_module_container.dart';
import 'package:news_app/core/domain/util/util.dart';
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
  AuthenticationProvider? _provider;
  final _pref = getIt.getAsync<SharedPreferences>();
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      _provider?.listen((event) async {
        if (event == 1) {
          _pref.then((value) {
            if (value.getBool(interestKey) == null) {
              context.pushNamed(InterestScreen.id);
              // return;
            } else {
              context.pushNamed(IndexScreen.id);
            }
          });
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
            // state.isLoading
            //     ? Column(
            //         mainAxisAlignment: MainAxisAlignment.center,
            //         crossAxisAlignment: CrossAxisAlignment.center,
            //         children: [
            //           Gap(MediaQuery.of(context).size.height * 0.40),
            //           Center(
            //             child: CustomLoader.loadingDialog(context),
            //           ),
            //         ],
            //       )
            //     :
            const Gap(10),
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
                      onChange: (value) {
                        setState(() {
                          state.email = value;
                        });
                      },
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
                      onChange: (value) {
                        setState(() {
                          state.password = value;
                        });
                      },
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
                        provider.signIn().then((value) {
                        state.isLoading ? customLoader.showLoader() : null;
                        });
                      },
                      title: 'Login',
                      isDisabled: state.email == '' || state.password == '',
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
          ];
        });
  }
}
