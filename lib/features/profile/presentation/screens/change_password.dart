import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:news_app/core/presentation/widgets/app_tool_bar.dart';
import 'package:news_app/core/presentation/widgets/custom_button.dart';
import 'package:news_app/core/presentation/widgets/input_field.dart';

class ChangePasswordScreen extends StatelessWidget {
  static const id = 'change-password';
  const ChangePasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 10,
          horizontal: 20,
        ),
        child: Column(
          children: [
            AppToolBar(
              title: 'Change Password',
              isPrefix: true,
            ),
            const Gap(40),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    InputField(
                      onChange: (value) {},
                      inputFieldLabel: 'New Password',
                      hint: '********',
                      icon: Icons.lock,
                    ),
                    const Gap(20),
                    InputField(
                      onChange: (value) {},
                      inputFieldLabel: 'Confirm Password',
                      hint: '********',
                      icon: Icons.lock,
                    ),
                    const Gap(80),
                    CustomButton(
                      onTap: () {},
                      title: 'Change Password',
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      )),
    );
  }
}
