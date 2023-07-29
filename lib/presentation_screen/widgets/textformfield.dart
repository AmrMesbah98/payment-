import 'package:flutter/material.dart';

class DefaultTextFormField extends StatelessWidget {
  TextEditingController controller;
  FormFieldValidator validate;
  TextInputType? type;
  String? hintText;
  IconData? prefix;

  bool isPassword = false;

  DefaultTextFormField({
    super.key,
    required this.controller,
    required this.validate,
    this.hintText,
    this.prefix,
    this.isPassword = false,
    this.type,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      validator: validate,
      decoration: InputDecoration(
        hintText: hintText,
        helperStyle: TextStyle(color: Colors.grey),
        prefixIcon: Icon(prefix),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: BorderSide(color: Colors.grey.shade500),
        ),
      ),
      obscureText: isPassword,
      keyboardType: type,
    );
  }
}
