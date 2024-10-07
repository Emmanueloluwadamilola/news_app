import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:news_app/core/config/config.dart';
import 'package:news_app/core/presentation/res/drawables.dart';
import 'package:news_app/core/presentation/theme/color.dart';
import 'package:news_app/core/presentation/utils/navigation_mixin.dart';
import 'package:news_app/core/presentation/widgets/app_tool_bar.dart';
import 'package:news_app/core/presentation/widgets/clickable.dart';
import 'package:news_app/core/presentation/widgets/custom_button.dart';
import 'package:news_app/core/presentation/widgets/custom_image.dart';
import 'package:news_app/core/presentation/widgets/svg_image.dart';
import 'package:news_app/core/presentation/widgets/transparent_button.dart';
import 'package:news_app/features/profile/presentation/screens/settings.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      body: Column(
        children: [
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
                  top: MediaQuery.of(context).size.height * 0.23,
                  left: 30,
                  right: 40,
                  child: Container(
                    height: 100,
                    width: 100,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: blueColor,
                    ),
                    child: const Icon(
                      Icons.person_outline,
                      color: whiteColor,
                    ),
                  ),
                ),
                Positioned(
                  top: 50,
                  right: 30,
                  left: 50,
                  child: AppToolBar(
                    title: 'Profile',
                    isSuffix: true,
                    suffixIcon: Clickable(
                      onPressed: (){
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
          Text(
            user!.displayName ??'user',
            style: theme.textTheme.titleLarge!.copyWith(fontSize: 15),
          ),
          const Gap(20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TransparentButton(
                horizPadding: 20,
                buttonTitle: 'Edit Profile',
                onTap: () {},
                isIcon: false,
              ),
              const Gap(20),
              CustomButton(
                fontSize: 16,
                horizPadding: 24,
                vertPadding: 12,
                onTap: () {},
                title: 'Statistics',
              ),
            ],
          ),
        ],
      ),
    );
  }
}
