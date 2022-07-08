// ignore_for_file: file_names

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_example_project/views/06_streamProviderView/ma_ticketModel.dart';

/// StateNotifier to hold ticket state
/// 
/// This provider is the indicator of what ticket is currently shown on the
/// comments list.
final currentTicketState =
    StateNotifierProvider.autoDispose<CurrentTicketController, TicketModel?>((ref) {
  return CurrentTicketController();
});

class CurrentTicketController extends StateNotifier<TicketModel?> {
  CurrentTicketController() : super(null);

  changeState(TicketModel ticket) {
    state = ticket;
  }
}
