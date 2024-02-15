import 'package:flutter/material.dart';
import 'package:flutterconnect/utils/colors.dart';
import 'package:flutterconnect/widgets/app_Style.dart';

class TextFieldInput extends StatelessWidget {
  final TextEditingController controller;
  final String labelText;
  final TextInputType textInputType;
  final Icon icon;
  final bool isSecure;
  const TextFieldInput({
    super.key,
    required this.controller,
    required this.labelText,
    required this.textInputType,
    required this.icon,
    this.isSecure = false,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: TextField(
        controller: controller,
        keyboardType: textInputType,
        obscureText: isSecure,
        decoration: InputDecoration(
          labelText: labelText,
          labelStyle: appStyle(blackColor, FontWeight.bold, 22),
          prefixIcon: icon,
          prefixIconColor: iconColor,
          contentPadding: const EdgeInsets.all(10.0),
        ),
      ),
    );
  }
}
