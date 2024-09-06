import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gap/gap.dart';
import 'package:news_app/core/presentation/theme/color.dart';
import 'package:news_app/core/presentation/widgets/app_tool_bar.dart';
import 'package:news_app/core/presentation/widgets/custom_button.dart';
import 'package:news_app/core/presentation/widgets/circular_icon.dart';
import 'package:news_app/features/auth/presentation/screens/widgets/successful_modal.dart';
import 'package:otp_text_field/otp_field.dart';
import 'package:otp_text_field/otp_field_style.dart';
import 'package:otp_text_field/style.dart';

class OtpScreen extends StatefulWidget {
  static const id = 'otp';
  const OtpScreen({super.key});

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  final otpFieldController = OtpFieldController();
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
        child: Column(
          children: [
            const Gap(10),
            AppToolBar(
              title: 'Verification',
              isPrefix: true,
            ),
            const Gap(20),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Gap(
                      MediaQuery.of(context).size.height * 0.08,
                    ),
                    const CircularIconWidget(
                      icon: Icons.mail_lock_rounded,
                      mainColor: blueColor,
                      shadowColor: Color(
                        0XFFE0E2F7,
                      ),
                    ),
                    const Gap(40),
                    Text(
                      'Verification Code',
                      style: theme.textTheme.titleLarge!.copyWith(fontSize: 24),
                    ),
                    const Gap(8),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 5,
                      ),
                      child: Text(
                        'OTP Verification code has been sent to mymail@gmail.com',
                        textAlign: TextAlign.center,
                        style: theme.textTheme.labelMedium!.copyWith(
                          fontSize: 16,
                        ),
                      ),
                    ),
                    const Gap(20),
                    Container(
                      height: 56,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 50, vertical: 5),
                      decoration: BoxDecoration(
                          color: theme.scaffoldBackgroundColor,
                          borderRadius: BorderRadius.circular(6)),
                      child: Center(
                        child: OTPTextField(
                          controller: otpFieldController,
                          length: 4,
                          width: MediaQuery.of(context).size.width,
                          textFieldAlignment: MainAxisAlignment.spaceAround,
                          fieldWidth: 40,
                          fieldStyle: FieldStyle.box,
                          outlineBorderRadius: 8,
                          onChanged: (value) {},
                          onCompleted: (value) {},
                          hint: '',
                          hintStyle: const TextStyle(
                            color: Color(0xFFB4B5B8),
                          ),
                          otpFieldStyle: OtpFieldStyle(
                            borderColor: const Color(0XFFE4E7ED),
                            enabledBorderColor: const Color(0XFFE4E7ED),
                            errorBorderColor: theme.colorScheme.error,
                            backgroundColor: theme.scaffoldBackgroundColor,
                            focusBorderColor: blueColor,
                          ),
                          keyboardType: TextInputType.number,
                          style: theme.textTheme.titleLarge!.copyWith(
                            color: darkText,
                            fontSize: 18,
                          ),
                          inputFormatter: [
                            FilteringTextInputFormatter.digitsOnly,
                            LengthLimitingTextInputFormatter(1)
                          ],
                        ),
                      ),
                    ),
                    const Gap(30),
                    CustomButton(
                      onTap: () {
                        showModalBottomSheet(
                            context: context,
                            builder: (context) {
                              return const SuccessfulModal();
                            });
                      },
                      title: 'Submit',
                    ),
                    const Gap(15),
                    RichText(
                      text: TextSpan(
                          text: "Didn't receive the code? ",
                          style: theme.textTheme.titleMedium!
                              .copyWith(color: lowEmphasis),
                          children: [
                            TextSpan(
                              text: ' Resend',
                              style: theme.textTheme.titleMedium!
                                  .copyWith(color: blueColor),
                            ),
                          ]),
                    ),
                    const Gap(20),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
