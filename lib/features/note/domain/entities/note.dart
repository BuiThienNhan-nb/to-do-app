// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:equatable/equatable.dart';

const List<String> notePriority = ["Must Do", "Should Do", "Low Priority"];

// ignore: must_be_immutable
class Note extends Equatable {
  final String id;
  final String userId;
  String title;
  String description;
  String priority;
  DateTime? deadline;
  bool hasDone = false;
  DateTime? createdAt;
  Note({
    required this.id,
    required this.userId,
    required this.title,
    required this.description,
    required this.priority,
    this.deadline,
    required this.hasDone,
    this.createdAt,
  });

  Note copyWith({
    String? id,
    String? userId,
    String? title,
    String? description,
    String? priority,
    DateTime? deadline,
    bool? hasDone,
    DateTime? createdAt,
  }) {
    return Note(
      id: id ?? this.id,
      userId: userId ?? this.userId,
      title: title ?? this.title,
      description: description ?? this.description,
      priority: priority ?? this.priority,
      deadline: deadline ?? this.deadline,
      hasDone: hasDone ?? this.hasDone,
      createdAt: createdAt ?? this.createdAt,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      '_id': id,
      'userId': userId,
      'title': title,
      'description': description,
      'priority': priority,
      'deadline': deadline?.toIso8601String(),
      'hasDone': hasDone,
      'createdAt': createdAt?.toIso8601String(),
    };
  }

  factory Note.fromMap(Map<String, dynamic> map) {
    return Note(
      id: (map['_id'] ?? '') as String,
      userId: (map['userId'] ?? '') as String,
      title: (map['title'] ?? '') as String,
      description: (map['description'] ?? '') as String,
      priority: (map['priority'] ?? '') as String,
      deadline: map['deadline'] != null
          // ? DateTime.fromMillisecondsSinceEpoch((map['deadline'] ?? 0) as int)
          ? DateTime.parse(map['deadline'])
          : null,
      hasDone: (map['hasDone'] ?? false) as bool,
      createdAt:
          map['createdAt'] != null ? DateTime.parse(map['createdAt']) : null,
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
      priority,
      deadline ?? DateTime.now().add(const Duration(days: -1)),
      hasDone,
      createdAt ?? DateTime.now().add(const Duration(days: 1)),
    ];
  }
}
