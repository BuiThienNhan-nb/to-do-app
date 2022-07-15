import 'package:flutter/material.dart';
import 'package:to_do_app/features/note/presentation/widget/note_page_components.dart';

class NoteTextFormField extends StatelessWidget {
  final TextEditingController controller;
  final String label;
  Function()? onTap;
  bool readOnly = false;
  final Function(String callbackValue) callback;

  NoteTextFormField({
    Key? key,
    required this.label,
    required this.controller,
    required this.callback,
    this.readOnly = false,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      autovalidateMode: AutovalidateMode.always,
      controller: controller,
      decoration: noteInputDecoration(label),
      onTap: onTap,
      readOnly: readOnly,
      onChanged: (value) {
        controller.text = value;
        controller.selection = TextSelection.fromPosition(
          TextPosition(offset: controller.text.length),
        );
        callback(value);
      },
    );
  }
}
