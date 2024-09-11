import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:news_app/core/presentation/theme/color.dart';
import 'package:news_app/core/presentation/widgets/clickable.dart';
import 'package:news_app/core/presentation/widgets/svg_image.dart';

class TransparentButton extends StatelessWidget {
  const TransparentButton(
      {required this.buttonTitle,
      this.horizPadding = 0,
      this.vertPadding = 10,
      this.fontSize = 16,
      this.titleColor = darkText,
      required this.onTap,
       this.iconImage,
      this.iconHeight,
      this.isIcon = true,
      super.key});
  final double vertPadding;
  final double horizPadding;
  final String buttonTitle;
  final double fontSize;
  final Color titleColor;
  final VoidCallback onTap;
  final String? iconImage;
  final double? iconHeight;
  final bool isIcon;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Clickable(
      onPressed: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(
            vertical: vertPadding, horizontal: horizPadding),
        decoration: BoxDecoration(
          color: theme.scaffoldBackgroundColor,
          borderRadius: BorderRadius.circular(40),
          border: Border.all(
            color: lowEmphasis,
          ),
        ),
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
            isIcon ?  SvgImage(
                asset: iconImage!,
                height: iconHeight,
              ): const Gap(0),
              const Gap(8),
              Text(
                buttonTitle,
                style: theme.textTheme.titleMedium!.copyWith(
                  fontSize: fontSize,
                  color: titleColor,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
