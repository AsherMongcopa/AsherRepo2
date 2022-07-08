// ignore_for_file: file_names

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_example_project/views/07_0_streamProviderConsumerWidgetView/ma_ticketModel.dart';

/// FutureProvider for getting tickets from Firestore database
///
/// FutureProviders are useful for calling asynchronous methods. Once the 
/// provider returns a value, the method terminates. To get updates, 
/// ref.refresh() must be called referencing the provider to get the latest 
/// data.
final getTickets = FutureProvider.autoDispose<Iterable<TicketModel>>((ref) async {
  var docs = await FirebaseFirestore.instance
      .collection('act_a_t')
      .where('id_u_assignee', isNotEqualTo: "")
      .get();

  return docs.docs.map((e) => TicketModel.fromMap(e.data()));
});
