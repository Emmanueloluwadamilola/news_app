import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:news_app/core/presentation/widgets/input_field.dart';
import 'package:news_app/core/presentation/widgets/modal_center_drag.dart';

class ForgotPasswordModal extends StatelessWidget {
  const ForgotPasswordModal({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.only(
          top: 10,
          left: 20,
          right: 20,
          bottom: 20,
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
           // InputField(inputFieldLabel: 'Email', hint: 'mymail@news.com', controller: controller, isFocused: isFocused, icon: Icons.mail_outline, focusNode: focusNode, isControllerEmpty: isControllerEmpty)
          ],
        ),
      ),
    );
  }
}
