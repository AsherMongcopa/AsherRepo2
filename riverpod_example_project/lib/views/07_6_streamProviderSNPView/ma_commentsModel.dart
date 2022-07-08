// ignore_for_file: non_constant_identifier_names, file_names

import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';

class CommentsModel {
  String id_a_t_c;
  String body;
  Timestamp? dateCreated;

  CommentsModel({
    required this.id_a_t_c,
    required this.body,
    this.dateCreated,
  });

  CommentsModel copyWith({
    String? id_a_t_c,
    String? body,
    Timestamp? dateCreated,
  }) {
    return CommentsModel(
      id_a_t_c: id_a_t_c ?? this.id_a_t_c,
      body: body ?? this.body,
      dateCreated: dateCreated ?? this.dateCreated,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id_a_t_c': id_a_t_c,
      'body': body,
      'dateCreated': dateCreated,
    };
  }

  factory CommentsModel.fromMap(Map<String, dynamic> map) {
    return CommentsModel(
      id_a_t_c: map['id_a_t_c'] ?? '',
      body: map['body'] ?? '',
      dateCreated: map['dateCreated'],
    );
  }

  String toJson() => json.encode(toMap());

  factory CommentsModel.fromJson(String source) => CommentsModel.fromMap(json.decode(source));

  @override
  String toString() => 'CommentsModel(id_a_t_c: $id_a_t_c, body: $body, dateCreated: $dateCreated)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is CommentsModel &&
      other.id_a_t_c == id_a_t_c &&
      other.body == body &&
      other.dateCreated == dateCreated;
  }

  @override
  int get hashCode => id_a_t_c.hashCode ^ body.hashCode ^ dateCreated.hashCode;
}
