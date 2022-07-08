// ignore_for_file: file_names

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_example_project/views/07_5_streamProviderCNPView/ma_commentsModel.dart';

/// StreamProvider for getting comments from Firestore database
///
/// StreamProviders allow providers to return streams. Data returned from
/// streams are updated real-time. If a new update exists, the state also
/// updates to reflect the new data.
final getComments = StreamProvider.autoDispose.family<Iterable<CommentsModel>, String>((ref, id) {
  // Getting the current ticket state by referencing the StateNotifierProvider.
  // This allows the comments box to only show comments from the selected
  // ticket.

  var docs = FirebaseFirestore.instance
      .collection('act_a_t_c')
      .where('id_a_t', isEqualTo: id);

  return docs
      .snapshots()
      .map((event) => event.docs.map((e) => CommentsModel.fromMap(e.data())));
});
