// ignore_for_file: non_constant_identifier_names, file_names

import 'dart:convert';

class TicketModel {
  String id_a_t;
  String subject;
  String status;
  String id_u_assignee;
  
  TicketModel({
    required this.id_a_t,
    required this.subject,
    required this.status,
    required this.id_u_assignee,
  });

  TicketModel copyWith({
    String? id_a_t,
    String? subject,
    String? status,
    String? id_u_assignee,
  }) {
    return TicketModel(
      id_a_t: id_a_t ?? this.id_a_t,
      subject: subject ?? this.subject,
      status: status ?? this.status,
      id_u_assignee: id_u_assignee ?? this.id_u_assignee,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id_a_t': id_a_t,
      'subject': subject,
      'status': status,
      'id_u_assignee': id_u_assignee,
    };
  }

  factory TicketModel.fromMap(Map<String, dynamic> map) {
    return TicketModel(
      id_a_t: map['id_a_t'] ?? '',
      subject: map['subject'] ?? '',
      status: map['status'] ?? '',
      id_u_assignee: map['id_u_assignee'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory TicketModel.fromJson(String source) => TicketModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'TicketModel(id_a_t: $id_a_t, subject: $subject, status: $status, id_u_assignee: $id_u_assignee)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is TicketModel &&
      other.id_a_t == id_a_t &&
      other.subject == subject &&
      other.status == status &&
      other.id_u_assignee == id_u_assignee;
  }

  @override
  int get hashCode {
    return id_a_t.hashCode ^
      subject.hashCode ^
      status.hashCode ^
      id_u_assignee.hashCode;
  }
}
