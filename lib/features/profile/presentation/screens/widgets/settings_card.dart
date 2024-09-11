import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:news_app/core/presentation/theme/color.dart';
import 'package:news_app/core/presentation/widgets/clickable.dart';
import 'package:news_app/core/presentation/widgets/svg_image.dart';

class SettingsCard extends StatelessWidget {
  const SettingsCard({
    this.isSvgIcon = false,
    this.svgIcon,
    this.iconData,
    required this.onTap,
    required this.title,
    this.isLogOut = false,
    super.key,
  });
  final bool isSvgIcon;
  final String? svgIcon;
  final IconData? iconData;
  final VoidCallback onTap;
  final String title;
  final bool isLogOut;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Clickable(
      onPressed: onTap,
      child: Padding(
        padding: const EdgeInsets.only(bottom: 15),
        child: Container(
          padding: const EdgeInsets.symmetric(
            vertical: 16,
            horizontal: 12,
          ),
          decoration: BoxDecoration(
            color: whiteColor,
            borderRadius: BorderRadius.circular(8),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.2),
                spreadRadius: 1.5,
                blurRadius: 1,
                offset: const Offset(0, 1), // changes position of shadow
              ),
            ],
          ),
          child: Row(
            children: [
              isSvgIcon
                  ? SvgImage(
                      asset: svgIcon!,
                      color: isLogOut ? Colors.red : darkText,
                    )
                  : Icon(
                      iconData!,
                      color: isLogOut ? Colors.red : darkText,
                    ),
              const Gap(25),
              Text(
                title,
                style: theme.textTheme.titleLarge!.copyWith(
                  fontSize: 16,
                  color: isLogOut ? Colors.red : darkText,
                ),
              ),
              const Spacer(),
              isLogOut
                  ? const Gap(0)
                  : const Icon(
                      Icons.arrow_forward_ios,
                      color: lowEmphasis,
                    ),
            ],
          ),
        ),
      ),
    );
  }
}
