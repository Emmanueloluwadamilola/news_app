import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:news_app/core/presentation/theme/color.dart';
import 'package:news_app/core/presentation/widgets/clickable.dart';
import 'package:news_app/core/presentation/widgets/input_field_state.dart';

class InputField extends TextFieldParent {
  const InputField({
    super.key,
    super.value,
    required super.onChange,
    required this.inputFieldLabel,
    required this.hint,
    super.isPassword,
    required this.icon,
    this.keyboardType = TextInputType.name,
    this.errorText,
  });
  final String inputFieldLabel;
  final String hint;
  final IconData icon;
  final TextInputType keyboardType;
  final String? errorText;

  @override
  TextFieldState<InputField> createState() => _InputFieldState();
}

class _InputFieldState extends TextFieldState<InputField> {
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
                color: focus.hasFocus ? blueColor : Colors.transparent),
          ),
          child: TextField(
            controller: controller,
            focusNode: focus,
            onTapOutside: (_) {
              focus.unfocus();
            },
            keyboardType: widget.keyboardType,
            textInputAction: TextInputAction.done,
            obscureText: widget.isPassword && !isPasswordVissible,
            style: theme.textTheme.titleMedium!.copyWith(
              color: darkText,
              fontSize: 16,
            ),
            onTap: () {},
            decoration: InputDecoration(
              contentPadding: const EdgeInsets.only(
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
                        color:
                            controller.text.isEmpty ? lowEmphasis : blueColor,
                      ),
                    )
                  : null,
              prefixIcon: Icon(
                widget.icon,
                color: controller.text.isEmpty ? lowEmphasis : blueColor,
              ),
              hintText: widget.hint,
              hintStyle: const TextStyle(
                color: lowEmphasis,
                fontFamily: 'regular',
              ),
            ),
          ),
        ),
      ],
    );
  }
}
