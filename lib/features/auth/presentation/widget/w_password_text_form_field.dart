import 'package:flutter/material.dart';

import 'w_auth_text_form_field.dart';

class PasswordTextFormField extends StatefulWidget {
  final TextEditingController controller;
  String hintText = "Password";

  PasswordTextFormField({
    Key? key,
    required this.controller,
    this.hintText = "Password",
  }) : super(key: key);

  @override
  State<PasswordTextFormField> createState() => _PasswordTextFormFieldState();
}

class _PasswordTextFormFieldState extends State<PasswordTextFormField> {
  bool togglePassword = true;
  late Image suffixIcon;

  @override
  Widget build(BuildContext context) {
    suffixIcon = togglePassword
        ? Image.asset("assets/icons/password_hide_icon.png")
        : Image.asset("assets/icons/password_show_icon.png");

    return AuthTextFormField(
      label: widget.hintText,
      controller: widget.controller,
      prefixIcon: Image.asset("assets/icons/lock_icon.png"),
      suffixIcon: GestureDetector(
        onTap: () => setState(() => togglePassword = !togglePassword),
        child: suffixIcon,
      ),
      obscureText: togglePassword,
    );
  }
}
