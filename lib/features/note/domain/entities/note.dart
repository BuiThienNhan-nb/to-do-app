// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:equatable/equatable.dart';

// ignore: must_be_immutable
class Note extends Equatable {
  final String id;
  String title;
  String description;
  DateTime? deadline;
  bool hasDone = false;
  Note({
    required this.id,
    required this.title,
    required this.description,
    this.deadline,
    required this.hasDone,
  });

  Note copyWith({
    String? id,
    String? title,
    String? description,
    DateTime? deadline,
    bool? hasDone,
  }) {
    return Note(
      id: id ?? this.id,
      title: title ?? this.title,
      description: description ?? this.description,
      deadline: deadline ?? this.deadline,
      hasDone: hasDone ?? this.hasDone,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'title': title,
      'description': description,
      'deadline': deadline?.millisecondsSinceEpoch,
      'hasDone': hasDone,
    };
  }

  factory Note.fromMap(Map<String, dynamic> map) {
    return Note(
      id: (map['id'] ?? '') as String,
      title: (map['title'] ?? '') as String,
      description: (map['description'] ?? '') as String,
      deadline: map['deadline'] != null
          ? DateTime.fromMillisecondsSinceEpoch((map['deadline'] ?? 0) as int)
          : null,
      hasDone: (map['hasDone'] ?? false) as bool,
    );
  }

  String toJson() => json.encode(toMap());

  factory Note.fromJson(String source) =>
      Note.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  bool get stringify => true;

  @override
  List<Object> get props {
    return [
      id,
      title,
      description,
      deadline ?? DateTime.now().add(const Duration(days: -1)),
      hasDone,
    ];
  }
}
