// ignore_for_file: file_names

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_example_project/views/05_futureProviderView/ma_commentsModel.dart';
import 'package:riverpod_example_project/views/05_futureProviderView/c_snp_currentTicketState.dart';

/// FutureProvider for getting comments from Firestore database
///
/// FutureProviders are useful for calling asynchronous methods. Once the 
/// provider returns a value, the method terminates. To get updates, 
/// ref.refresh() must be called referencing the provider to get the latest 
/// data.
final getComments = FutureProvider.autoDispose<Iterable<CommentsModel>>((ref) async {
  // Getting the current ticket state by referencing the StateNotifierProvider. 
  // This allows the comments box to only show comments from the selected 
  // ticket.
  //
  // When the provider state changes, the FutureProvider is refreshed.
  String id = ref.watch(currentTicketState)?.id_a_t ?? '';

  if (id == '') return [];

  var docs = await FirebaseFirestore.instance
      .collection('act_a_t_c')
      .where('id_a_t', isEqualTo: id)
      .get();

  return docs.docs.map((e) => CommentsModel.fromMap(e.data()));
});
