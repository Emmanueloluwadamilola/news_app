import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:news_app/core/presentation/widgets/circular_icon.dart';
import 'package:news_app/core/presentation/widgets/modal_center_drag.dart';

class SuccessfulModal extends StatelessWidget {
  const SuccessfulModal({super.key});

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
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const ModalCenterDrag(),
            const Gap(80),
            const CircularIconWidget(
              shadowColor: Color(0XFFe6fbef),
              mainColor: Color(0XFF00d261),
              icon: Icons.check_circle_rounded,
            ),
            const Gap(40),
            Text(
              'Verification Successful',
              style: theme.textTheme.titleLarge!.copyWith(
                fontSize: 20,
              ),
            ),
            const Gap(8),
            Text(
              'Your account has been succesfully verified ',
              style: theme.textTheme.labelMedium!.copyWith(fontSize: 16),
            ),
            const Gap(50),
          ],
        ),
      ),
    );
  }
}
