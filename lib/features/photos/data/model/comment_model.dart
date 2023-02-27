// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:equatable/equatable.dart';

class CommentModel extends Equatable {
  const CommentModel({
    required this.id,
    required this.date,
    required this.text,
  });

  final int id;
  final DateTime date;
  final String text;

  CommentModel copyWith({
    int? id,
    DateTime? date,
    String? text,
  }) {
    return CommentModel(
      id: id ?? this.id,
      date: date ?? this.date,
      text: text ?? this.text,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'date': date.millisecondsSinceEpoch / 1000,
      'text': text,
    };
  }

  factory CommentModel.fromMap(Map<String, dynamic> map) {
    return CommentModel(
      id: map['id'] as int,
      date: DateTime.fromMillisecondsSinceEpoch((map['date'] as int) * 1000),
      text: map['text'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory CommentModel.fromJson(String source) =>
      CommentModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  bool get stringify => true;

  @override
  List<Object> get props => [id, date, text];
}
