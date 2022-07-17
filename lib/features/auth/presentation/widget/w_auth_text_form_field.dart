import 'package:flutter/material.dart';

import 'w_auth_components.dart';

class AuthTextFormField extends StatelessWidget {
  final TextEditingController controller;
  final String label;
  Function()? onTap;
  bool readOnly = false;
  final Widget prefixIcon;
  Widget? suffixIcon;
  bool obscureText = false;

  AuthTextFormField({
    Key? key,
    required this.label,
    required this.controller,
    required this.prefixIcon,
    this.readOnly = false,
    this.obscureText = false,
    this.suffixIcon,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      autovalidateMode: AutovalidateMode.always,
      controller: controller,
      decoration: authInputDecoration(
        label,
        prefixIcon,
        suffixIcon,
      ),
      onTap: onTap,
      readOnly: readOnly,
      obscureText: obscureText,
    );
  }
}
