import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:news_app/core/presentation/res/drawables.dart';
import 'package:news_app/core/presentation/utils/navigation_mixin.dart';
import 'package:news_app/core/presentation/widgets/app_tool_bar.dart';
import 'package:news_app/core/presentation/widgets/dialog_box.dart';
import 'package:news_app/features/auth/presentation/screens/sign_in.dart';
import 'package:news_app/features/auth/presentation/screens/language_screen.dart';
import 'package:news_app/features/home/domain/util/util.dart';
import 'package:news_app/features/profile/presentation/screens/change_password.dart';
import 'package:news_app/features/profile/presentation/screens/edit_profile.dart';
import 'package:news_app/features/profile/presentation/screens/widgets/settings_card.dart';

class SettingsScreen extends StatelessWidget {
  static const id = 'settings';
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      backgroundColor: const Color(0xFFFDFDFD),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(
            top: 10,
            left: 16,
            right: 16,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AppToolBar(
                title: 'Settings',
                isPrefix: true,
              ),
              const Gap(15),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Gap(10),
                      Text(
                        'General',
                        style: theme.textTheme.titleLarge!.copyWith(
                          fontSize: 18,
                        ),
                      ),
                      const Gap(10),
                      SettingsCard(
                        onTap: () {
                          context.pushNamed(EditProfileScreen.id);
                        },
                        title: 'Edit Profile',
                        isSvgIcon: true,
                        svgIcon: icProfile,
                      ),
                      SettingsCard(
                        onTap: () {
                          context.pushNamed(ChangePasswordScreen.id);
                        },
                        title: 'Change Password',
                        iconData: Icons.lock,
                      ),
                      SettingsCard(
                        onTap: () {},
                        title: 'Notificaation',
                        isSvgIcon: true,
                        svgIcon: icNotification,
                      ),
                      SettingsCard(
                        onTap: () {},
                        title: 'Security',
                        iconData: Icons.privacy_tip_outlined,
                      ),
                      SettingsCard(
                        onTap: () {
                          context.pushNamed(
                            LanguageScreen.id,
                          );
                        },
                        title: 'Language',
                        iconData: Icons.language_outlined,
                      ),
                      const Gap(20),
                      Text(
                        'Preferences',
                        style: theme.textTheme.titleLarge!.copyWith(
                          fontSize: 18,
                        ),
                      ),
                      const Gap(10),
                      SettingsCard(
                        onTap: () {},
                        title: 'Legal and Policies',
                        iconData: Icons.shield_outlined,
                      ),
                      SettingsCard(
                        onTap: () {},
                        title: 'Help and Support',
                        iconData: Icons.live_help_outlined,
                      ),
                      SettingsCard(
                        onTap: () async {
                          showDialog(
                              context: context,
                              builder: (context) {
                                return DeleteDialog(
                                  delete: () async {
                                    await FirebaseAuth.instance.signOut().then(
                                      (value) {
                                        // ignore: use_build_context_synchronously
                                        initials = '';

                                        context
                                            .pushNamedAndClear(SignInScreen.id);
                                      },
                                    );
                                  },
                                  title: 'Are you sure you want to log out?',
                                  actionText: 'Proceed',
                                );
                              });
                        },
                        title: 'Logout',
                        iconData: Icons.logout_outlined,
                        isLogOut: true,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
