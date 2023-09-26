import 'package:cakeke/config/design_system/design_system.dart';
import 'package:flutter/material.dart';

class SignTextField extends StatelessWidget {
  const SignTextField({
    super.key,
    required this.textController,
    this.hintText,
    this.inputType,
    this.autoFocus = false,
    this.isPassword = false,
    this.isLast = false,
  });

  final TextEditingController textController;
  final TextInputType? inputType;
  final String? hintText;
  final bool autoFocus;
  final bool isPassword;
  final bool isLast;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: textController,
      autofocus: autoFocus,
      obscureText: isPassword,
      maxLength: isPassword ? 1 : null,
      keyboardType: inputType,
      textAlign: isPassword ? TextAlign.center : TextAlign.start,
      style: DesignSystem.typography.heading3(),
      obscuringCharacter: '●',
      decoration: InputDecoration(
        isDense: true,
        counterText: '',
        hintText: hintText,
        hintStyle: DesignSystem.typography.heading3(TextStyle(
            color: DesignSystem.colors.textDisabled,
            fontWeight: FontWeight.w700)),
        enabledBorder: UnderlineInputBorder(
          borderSide: isPassword
              ? BorderSide(width: 2, color: DesignSystem.colors.appPrimary)
              : BorderSide(color: DesignSystem.colors.divider),
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide:
              BorderSide(width: 2, color: DesignSystem.colors.appPrimary),
        ),
      ),
      onChanged: isPassword
          ? (value) {
              if (value.length == 1 && !isLast) {
                FocusScope.of(context).nextFocus();
              }
              if (value.isEmpty && autoFocus) {
                FocusScope.of(context).previousFocus();
              }
            }
          : null,
    );
  }
}
