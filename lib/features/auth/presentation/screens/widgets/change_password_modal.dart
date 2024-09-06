import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:news_app/core/presentation/utils/navigation_mixin.dart';
import 'package:news_app/core/presentation/widgets/custom_button.dart';
import 'package:news_app/core/presentation/widgets/input_field.dart';
import 'package:news_app/core/presentation/widgets/modal_center_drag.dart';

class ChangePasswordModal extends StatelessWidget {
  const ChangePasswordModal({super.key});

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
              'Change Password',
              style: theme.textTheme.titleLarge!.copyWith(
                fontSize: 20,
              ),
            ),
            const Gap(8),
            Text(
              'Enter your new password',
              style: theme.textTheme.labelMedium!.copyWith(fontSize: 16),
            ),
            const Gap(25),
            InputField(
              inputFieldLabel: 'Password',
              hint: '*********',
              icon: Icons.lock_outline,
              onChange: (value) {},
              isPassword: true,
            ),
            const Gap(20),
            InputField(
              inputFieldLabel: 'Confirm Password',
              hint: '*********',
              icon: Icons.lock_outline,
              onChange: (value) {},
              isPassword: true,
            ),
            const Gap(20),
            CustomButton(
              onTap: () {
                context.pop();
              },
              title: 'Change Password',
            ),
            const Gap(25),
          ],
        ),
      ),
    );
  }
}
