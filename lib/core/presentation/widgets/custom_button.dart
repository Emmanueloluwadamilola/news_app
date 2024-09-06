import 'package:flutter/material.dart';
import 'package:news_app/core/presentation/theme/color.dart';
import 'package:news_app/core/presentation/widgets/clickable.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.onTap,
    required this.title,
    this.activeColor = blueColor,
    this.disabledColor = greyText,
    this.isDisabled = false,
    this.vertPadding = 16,
    this.horizPadding = 0,
    this.fontSize = 18,
    this.activeTextColor = Colors.white,
  });
  final VoidCallback onTap;
  final String title;
  final Color activeTextColor;
  final Color activeColor;
  final bool isDisabled;
  final Color disabledColor;
  final double vertPadding;
  final double horizPadding;
  final double fontSize;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Clickable(
      onPressed: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(
          vertical: vertPadding,
          horizontal: horizPadding,
        ),
        decoration: BoxDecoration(
          color: isDisabled ? disabledColor : activeColor,
          borderRadius: BorderRadius.circular(40),
        ),
        child: Center(
          child: Text(
            title,
            style: theme.textTheme.titleMedium!.copyWith(
              fontSize: fontSize,
              color: activeTextColor,
            ),
          ),
        ),
      ),
    );
  }
}
