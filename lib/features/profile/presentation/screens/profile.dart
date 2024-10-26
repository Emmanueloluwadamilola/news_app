import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:news_app/core/config/config.dart';
import 'package:news_app/core/presentation/res/drawables.dart';
import 'package:news_app/core/presentation/theme/color.dart';
import 'package:news_app/core/presentation/utils/navigation_mixin.dart';
import 'package:news_app/core/presentation/widgets/app_tool_bar.dart';
import 'package:news_app/core/presentation/widgets/clickable.dart';
import 'package:news_app/core/presentation/widgets/custom_image.dart';
import 'package:news_app/core/presentation/widgets/provider_widget.dart';
import 'package:news_app/core/presentation/widgets/svg_image.dart';
import 'package:news_app/features/favourite/domain/util/util.dart';
import 'package:news_app/features/home/domain/util/util.dart';
import 'package:news_app/features/profile/presentation/manager/profile_provider.dart';
import 'package:news_app/features/profile/presentation/screens/settings.dart';
import 'package:news_app/features/profile/presentation/screens/widgets/profile_image.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  // @override
  // void dispose() {
  //   _homeProvider?.dispose();
  //   super.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    return ProviderWidget(
        topSafeArea: false,
        vertPadding: 0,
        horizPadding: 0,
        provider: ProfileProvider(),
        children: (provider, theme) {
          return [
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.38,
              decoration: const BoxDecoration(),
              child: Stack(
                children: [
                  CustomImage(
                    asset: imgTexture,
                    width: double.infinity,
                    height: MediaQuery.of(context).size.height * 0.3,
                    fit: BoxFit.fitWidth,
                  ),
                  Positioned(
                    top: MediaQuery.of(context).size.height * 0.2,
                    left: MediaQuery.of(context).size.width * 0.35,
                    child: ProfileImage(
                      initials: initials,
                    ),
                  ),
                  // Positioned(
                  //     top: MediaQuery.of(context).size.height * 0.20,
                  //     left: 30,
                  //     right: 40,
                  //     child: ClipRRect(
                  //       borderRadius: BorderRadius.circular(100),
                  //       child: Container(
                  //         height: 140,
                  //         width: 140,
                  //         decoration: BoxDecoration(shape: BoxShape.circle),
                  //         child: ProfileImage(
                  //           initials: initials,
                  //         ),
                  //       ),
                  //     )

                  //     ),
                  Positioned(
                    top: 50,
                    right: 30,
                    left: 50,
                    child: AppToolBar(
                      title: 'Profile',
                      isSuffix: true,
                      suffixIcon: Clickable(
                        onPressed: () {
                          context.pushNamed(SettingsScreen.id);
                        },
                        child: const SvgImage(
                          asset: icSetting,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const Gap(20),
            Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    user!.displayName ?? 'user',
                    style: theme.textTheme.titleLarge!.copyWith(fontSize: 15),
                  ),
                  //const Gap(20),
                  Text(
                    user!.email ?? 'user',
                    style: theme.textTheme.labelMedium!.copyWith(fontSize: 13),
                  ),
                ],
              ),
            ),
            const Gap(20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  children: [
                    Text(
                      '$favouriteNewsLength',
                      style: theme.textTheme.titleLarge,
                    ),
                    Text(
                      'Saved posts',
                      style: theme.textTheme.labelMedium,
                    )
                  ],
                ),
                const Gap(20),
                Container(
                  padding: const EdgeInsets.symmetric(
                    vertical: 10,
                    horizontal: 20,
                  ),
                  decoration: BoxDecoration(
                    color: blueColor,
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Text(
                    'Online',
                    style:
                        theme.textTheme.bodyMedium!.copyWith(color: whiteColor),
                  ),
                )
              ],
            )
          ];
        });
  }
}
