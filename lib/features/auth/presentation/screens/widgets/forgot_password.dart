import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:news_app/core/presentation/utils/navigation_mixin.dart';
import 'package:news_app/core/presentation/widgets/custom_button.dart';
import 'package:news_app/core/presentation/widgets/input_field.dart';
import 'package:news_app/core/presentation/widgets/modal_center_drag.dart';

class ForgotPasswordModal extends StatelessWidget {
  const ForgotPasswordModal({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.only(
          top: 10,
          left: 20,
          right: 20,
          bottom: MediaQuery.of(context).viewInsets.bottom,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const ModalCenterDrag(),
            const Gap(20),
            Text(
              'Forgot Password',
              style: theme.textTheme.titleLarge!.copyWith(
                fontSize: 20,
              ),
            ),
            const Gap(8),
            Text(
              'Please enter your email address',
              style: theme.textTheme.labelMedium!.copyWith(fontSize: 16),
            ),
            const Gap(25),
            InputField(
              inputFieldLabel: 'Email',
              keyboardType: TextInputType.emailAddress,
              hint: 'mymail@news.com',
              icon: Icons.mail_outline,
              onChange: (value) {},
            ),
            const Gap(20),
            CustomButton(
              onTap: () {
                context.pop();
              },
              title: 'Send Code',
            ),
            const Gap(25),
          ],
        ),
      ),
    );
  }
}
