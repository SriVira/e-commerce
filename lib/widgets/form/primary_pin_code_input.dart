import 'package:ecommerce/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:pinput/pinput.dart';

class PrimaryPinCodeInput extends StatelessWidget {
  const PrimaryPinCodeInput({super.key});

  @override
  Widget build(BuildContext context) {
    final defaultPinTheme = PinTheme(
      height: context.width() / 6,
      width: context.width() / 6,
      textStyle: const TextStyle(
        fontSize: 22,
        color: appWhiteColor,
      ),
      decoration: BoxDecoration(
        color: const Color.fromRGBO(222, 231, 240, .57),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.transparent),
      ),
    );
    return Pinput(
      onCompleted: (pin){},
      androidSmsAutofillMethod: AndroidSmsAutofillMethod.smsUserConsentApi,
      defaultPinTheme: defaultPinTheme,
      pinContentAlignment: Alignment.center,
      listenForMultipleSmsOnAndroid: true,
      animationDuration: const Duration(milliseconds: 300),
      closeKeyboardWhenCompleted: true,
      keyboardType: TextInputType.number,
      focusedPinTheme: defaultPinTheme.copyWith(
        height: context.width() / 6,
        width: context.width() / 6,
        decoration: defaultPinTheme.decoration!.copyWith(
          border: Border.all(color: appPrimaryColor),
        ),
      ),
      errorPinTheme: defaultPinTheme.copyWith(
        height: context.width() / 6,
        width: context.width() / 6,
        decoration: BoxDecoration(
          color: appDangerColor,
          borderRadius: BorderRadius.circular(8),
        ),
      ),
    );
  }
}
