import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:news_app/core/presentation/theme/color.dart';
import 'package:news_app/core/presentation/widgets/clickable.dart';

class InputField extends StatefulWidget {
  const InputField({
    super.key,
    required this.inputFieldLabel,
    required this.hint,
    required this.controller,
    this.isPassword = false,
    required this.isFocused,
    required this.icon,
    required this.focusNode,
    required this.isControllerEmpty,
    this.keyboardType = TextInputType.name,
  });
  final String inputFieldLabel;
  final String hint;
  final TextEditingController controller;
  final bool isPassword;
  final IconData icon;
  final bool isFocused;
  final FocusNode focusNode;
  final bool isControllerEmpty;
  final TextInputType keyboardType;

  @override
  State<InputField> createState() => _InputFieldState();
}

class _InputFieldState extends State<InputField> {
  bool isPasswordVissible = false;
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
          padding: const EdgeInsets.only(
            top: 4,
            bottom: 4,
          ),
          decoration: BoxDecoration(
            color: const Color(0xFFFBFBFD),
            borderRadius: BorderRadius.circular(22),
            border: Border.all(
                color: widget.isFocused ? blueColor : Colors.transparent),
          ),
          child: TextField(
            controller: widget.controller,
            focusNode: widget.focusNode,
            keyboardType: widget.keyboardType,
            textInputAction: TextInputAction.done,
            obscureText: widget.isPassword && !isPasswordVissible,
            style: theme.textTheme.titleMedium!.copyWith(
              color: darkText,
              fontSize: 16,
            ),
            onTap: () {},
            decoration: InputDecoration(
                contentPadding: EdgeInsets.only(
                  top: 12,
                ),
                border: InputBorder.none,
                suffixIcon: widget.isPassword
                    ? Clickable(
                        onPressed: () {
                          setState(() {
                            isPasswordVissible = !isPasswordVissible;
                          });
                        },
                        child: Icon(
                          isPasswordVissible
                              ? Icons.visibility_outlined
                              : Icons.visibility_off_outlined,
                          color: widget.isControllerEmpty
                              ? lowEmphasis
                              : blueColor,
                        ),
                      )
                    : null,
                prefixIcon: Icon(
                  widget.icon,
                  color: widget.isControllerEmpty ? lowEmphasis : blueColor,
                ),
                hintText: widget.hint,
                hintStyle: TextStyle(
                  color: lowEmphasis,
                  fontFamily: 'regular',
                )),
          ),
        ),
      ],
    );
  }
}
