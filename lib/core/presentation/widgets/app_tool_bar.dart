import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:news_app/core/presentation/widgets/pop_widget.dart';

// ignore: must_be_immutable
class AppToolBar extends StatelessWidget {
  AppToolBar({
    super.key,
    required this.title,
    this.isPrefix = false,
    this.isSuffix = false,
    this.suffixIcon,
    this.suffixOnTap,
  });
  final String title;
  final bool isPrefix;
  final bool isSuffix;
  VoidCallback? suffixOnTap;
  Widget? suffixIcon;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        isPrefix ? const PopWidget() : const Gap(0),
        Center(
          child: Text(
            title,
            style: theme.textTheme.titleLarge!.copyWith(fontSize: 16),
          ),
        ),
        isSuffix
            ? suffixIcon!
            : Container(
                height: 32,
                width: 32,
                decoration: BoxDecoration(
                  color: theme.scaffoldBackgroundColor,
                ),
              ),
      ],
    );
  }
}
