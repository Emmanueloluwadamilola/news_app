import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:news_app/core/presentation/theme/color.dart';
import 'package:news_app/core/presentation/widgets/app_tool_bar.dart';
import 'package:news_app/core/presentation/widgets/custom_button.dart';
import 'package:news_app/core/presentation/widgets/input_field.dart';

class EditProfileScreen extends StatelessWidget {
  static const id = 'edit-profile';
  const EditProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(
            vertical: 10,
            horizontal: 20,
          ),
          child: Column(
            children: [
              AppToolBar(
                title: 'Edit Profile',
                isPrefix: true,
              ),
              const Gap(20),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      const Gap(40),
                      Container(
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
                      const Gap(20),
                      InputField(
                        onChange: (value) {},
                        inputFieldLabel: 'Username',
                        hint: '',
                        icon: Icons.person_outline,
                      ),
                      const Gap(10),
                      InputField(
                        onChange: (value) {},
                        inputFieldLabel: 'Email',
                        hint: '',
                        icon: Icons.email_outlined,
                      ),
                      const Gap(60),
                      Align(
                        alignment: Alignment.bottomCenter,
                        child:
                            CustomButton(onTap: () {}, title: 'Save Cahnges'),
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
