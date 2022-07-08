// ignore_for_file: avoid_print, file_names

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:riverpod_example_project/views/07_6_streamProviderSNPView/c_sp_getComments.dart';
import 'package:riverpod_example_project/views/07_6_streamProviderSNPView/c_fp_getTickets.dart';
import 'package:riverpod_example_project/views/07_6_streamProviderSNPView/ma_commentsModel.dart';
import 'package:riverpod_example_project/views/07_6_streamProviderSNPView/ma_ticketModel.dart';

// StateNotifierProvider
//
// This is the main state of the view. Currently, it does not work very well.
// Some improvements can be made, but it would deviate from its purpose of handling
// the other providers.
final currentTicketState = StateNotifierProvider.autoDispose<
    CurrentTicketController, TicketsCommentsListModel>((ref) {
  print('currentTicketState run');

  return CurrentTicketController(ref);
});

class CurrentTicketController extends StateNotifier<TicketsCommentsListModel> {
  CurrentTicketController(
    this.ref,
  ) : super(TicketsCommentsListModel(
            // The value of the Ticket list FutureProvider is passed to the initial
            // state value using a .when() method.
            ticketList: ref.watch(getTickets).when(
                  data: (data) => data.toList(),
                  error: (Object error, StackTrace? stackTrace) => [],
                  loading: () => [],
                ),
            currentTicketId: ''));

  AutoDisposeStateNotifierProviderRef ref;

  TicketModel? get currentTicket => state.currentTicketId != ''
      ? state.ticketList.firstWhere(
          (element) => element.id_a_t == state.currentTicketId,
        )
      : null;

  getCommentsFromId(String id) {
    // Currently, when the notifier requests a value from the StreamNotifier, it
    // will cause the StateNotifierProvider to be disposed and initialized again.
    // This makes the value of the StreamProvider impossible to retrieve.

    // A solution would be to ditch using a StreamProvider, and use a normal
    // Stream if using the StateNotifierProvider is essential to the view, or
    // refer to the previous examples.
    state = state.copyWith(
        commentList: ref.watch(getComments(id)), 
        currentTicketId: id);
  }

  Future addComment(String text) async {
    if (currentTicket == null) {
      return;
    }

    var ticket = currentTicket!;

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

class TicketsCommentsListModel {
  List<TicketModel> ticketList;
  String currentTicketId;
  AsyncValue<Iterable<CommentsModel>>? commentList;

  TicketsCommentsListModel({
    required this.ticketList,
    required this.currentTicketId,
    this.commentList,
  });

  TicketsCommentsListModel copyWith({
    List<TicketModel>? ticketList,
    String? currentTicketId,
    AsyncValue<Iterable<CommentsModel>>? commentList,
  }) {
    return TicketsCommentsListModel(
      ticketList: ticketList ?? this.ticketList,
      currentTicketId: currentTicketId ?? this.currentTicketId,
      commentList: commentList ?? this.commentList,
    );
  }
}
