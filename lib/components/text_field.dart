import 'package:flutter/material.dart';
import 'package:future_code_test/utils/constance.dart';

class MyTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final String? validationMessage;
  final Color? color;
  final IconData? icon;
 final IconData? iconprefix;
  const MyTextField({
    Key? key,
    required this.controller,
    required this.hintText,
    this.validationMessage,
    this.color,
    this.icon,
    this.iconprefix

  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      textAlign: TextAlign.right,
      textDirection: TextDirection.rtl,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: TextStyle(color: mainColor),
        hintTextDirection: TextDirection.rtl, // Align the hintText from right to left
        suffixIcon: icon != null ? Icon(icon,color: Color(0xffEB6440),) : null,
        prefixIcon: iconprefix != null ? Icon(iconprefix,color: Color(0xffB1B1B1),) : null,

        errorText: validationMessage,
        errorStyle: TextStyle(color: Colors.red),
        filled: true,
        fillColor: color ?? Colors.white,
        // border: OutlineInputBorder(
        //   borderRadius: BorderRadius.circular(8.0),
        // ),
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return validationMessage ?? 'الحقل مطلوب';
        }
        return null;
      },
    );
  }
}