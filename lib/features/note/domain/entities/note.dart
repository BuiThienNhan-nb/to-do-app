// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:equatable/equatable.dart';

// ignore: must_be_immutable
class Note extends Equatable {
  final String id;
  final String userId;
  String title;
  String description;
  DateTime? deadline;
  bool hasDone = false;
  DateTime? createdAt;
  Note({
    required this.id,
    required this.userId,
    required this.title,
    required this.description,
    this.deadline,
    required this.hasDone,
    this.createdAt,
  });

  Note copyWith({
    String? id,
    String? userId,
    String? title,
    String? description,
    DateTime? deadline,
    bool? hasDone,
    DateTime? createdAt,
  }) {
    return Note(
      id: id ?? this.id,
      userId: userId ?? this.userId,
      title: title ?? this.title,
      description: description ?? this.description,
      deadline: deadline ?? this.deadline,
      hasDone: hasDone ?? this.hasDone,
      createdAt: createdAt ?? this.createdAt,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'userId': userId,
      'title': title,
      'description': description,
      'deadline': deadline?.millisecondsSinceEpoch,
      'hasDone': hasDone,
      'createdAt': createdAt?.millisecondsSinceEpoch,
    };
  }

  factory Note.fromMap(Map<String, dynamic> map) {
    return Note(
      id: (map['id'] ?? '') as String,
      userId: (map['userId'] ?? '') as String,
      title: (map['title'] ?? '') as String,
      description: (map['description'] ?? '') as String,
      deadline: map['deadline'] != null
          ? DateTime.fromMillisecondsSinceEpoch((map['deadline'] ?? 0) as int)
          : null,
      hasDone: (map['hasDone'] ?? false) as bool,
      createdAt: map['createdAt'] != null
          ? DateTime.fromMillisecondsSinceEpoch((map['createdAt'] ?? 0) as int)
          : null,
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
      userId,
      title,
      description,
      deadline ?? DateTime.now().add(const Duration(days: -1)),
      hasDone,
      createdAt ?? DateTime.now(),
    ];
  }
}
