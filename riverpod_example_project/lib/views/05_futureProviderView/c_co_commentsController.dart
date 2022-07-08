// ignore_for_file: file_names

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:riverpod_example_project/views/05_futureProviderView/ma_ticketModel.dart';

// POCO for the FutureProviderPage view
//
// Holds the logic for adding a comment to the Firestore database.
class CommentsController {
  Future addComment(String text, TicketModel ticket) async {
    var colRef = FirebaseFirestore.instance.collection('act_a_t_c');

    var doc = colRef.doc();

    await doc.set({
      "attachments": [],
      "body": "Test comment (Riverpod example)\n\n$text",
      "dateCreated": FieldValue.serverTimestamp(),
      "id_a_t": ticket.id_a_t,
      "id_a_t_c": doc.id,
      "id_u_sender": ticket.id_u_assignee,
      "status": ticket.status,
      "subject": ticket.subject,
    });
  }
}
