import 'package:flutter/material.dart';
import 'package:to_do_app/features/note/domain/entities/note.dart';
import 'package:to_do_app/features/note/presentation/widget/note_page_components.dart';

class NoteDropDownButton extends StatelessWidget {
  final String label;
  final String selectedValue;
  final Function(String callbackValue) callback;

  const NoteDropDownButton({
    Key? key,
    required this.label,
    required this.selectedValue,
    required this.callback,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<String>(
      value: selectedValue,
      decoration: noteInputDecoration(label),
      autovalidateMode: AutovalidateMode.always,
      items: notePriority
          .map(
            (item) => DropdownMenuItem<String>(
              child: Text(item),
              value: item,
            ),
          )
          .toList(),
      onChanged: (value) => callback(value ?? selectedValue),
    );
  }
}
