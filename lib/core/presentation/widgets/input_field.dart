import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:news_app/core/presentation/theme/color.dart';

class InputField extends StatefulWidget {
  const InputField(
      {super.key, required this.inputFieldLabel, required this.hint});
  final String inputFieldLabel;
  final String hint;

  @override
  State<InputField> createState() => _InputFieldState();
}

class _InputFieldState extends State<InputField> {
  bool isFocused = false;
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.inputFieldLabel,
          style: theme.textTheme.titleLarge!.copyWith(fontSize: 16),
        ),
        const Gap(8),
        Container(
          padding: EdgeInsets.symmetric(
            vertical: 5,
            horizontal: 5,
          ),
          decoration: BoxDecoration(
            color: const Color(0xFFFBFBFD),
            borderRadius: BorderRadius.circular(22),
            border: Border.all(color: lowEmphasis),
          ),
          child: TextField(
            decoration: InputDecoration(
              border: InputBorder.none,
              hintText: widget.hint,
            ),
          ),
        ),
      ],
    );
  }
}
