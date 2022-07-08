// ignore_for_file: file_names

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_example_project/views/07_0_streamProviderConsumerWidgetView/ma_commentsModel.dart';
import 'package:riverpod_example_project/views/07_0_streamProviderConsumerWidgetView/c_snp_currentTicketState.dart';

/// StreamProvider for getting comments from Firestore database
///
/// StreamProviders allow providers to return streams. Data returned from
/// streams are updated real-time. If a new update exists, the state also
/// updates to reflect the new data.
final getComments = StreamProvider.autoDispose<Iterable<CommentsModel>>((ref) {
  // Getting the current ticket state by referencing the StateNotifierProvider.
  // This allows the comments box to only show comments from the selected
  // ticket.
  String id = ref.watch(currentTicketState)?.id_a_t ?? '';

  if (id == '') return Stream.value([]);

  var docs = FirebaseFirestore.instance
      .collection('act_a_t_c')
      .where('id_a_t', isEqualTo: id);

  return docs.snapshots().map((event) => event.docs.map((e) => CommentsModel.fromMap(e.data())));
});
