// ignore_for_file: avoid_print, file_names

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_example_project/views/07_0_streamProviderConsumerWidgetView/ticketsConsumerWidget/c_fp_getTickets.dart';
import 'package:riverpod_example_project/views/07_0_streamProviderConsumerWidgetView/c_snp_currentTicketState.dart';

// ConsumerWidget for Ticket List
//
// A ConsumerWidget is a StatelessWidget that has a WidgetRef. This allows the
// programmer to reference a provider without using Consumer.
class TicketConsumerWidget extends ConsumerWidget {
  const TicketConsumerWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Card(
      elevation: 2.5,
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.only(left: 8.0, top: 8.0),
            child: Text(
              'Tickets',
              style: Theme.of(context).textTheme.headline5,
            ),
            alignment: Alignment.centerLeft,
          ),
          const Divider(),
          Expanded(child: Builder(builder: (context) {
            // A .when method performs similarly to a FutureBuilder
            // widget. It contains three parameters that corresponds
            // to statuses.
            return ref.watch(getTickets).when(
                // Widgets returned in the data parameter show up when
                // data has been retrieved.
                data: (data) {
                  return ListView(
                    primary: false,
                    children: List.generate(
                        data.length,
                        (index) => ListTile(
                              title: Text(data.elementAt(index).subject),
                              selected: ref.watch(currentTicketState) ==
                                  data.elementAt(index),
                              // Using a StateNotifierProvider to retain information
                              // on the current ticket to show linked comments
                              onTap: () {
                                ref
                                    .read(currentTicketState.notifier)
                                    .changeState(data.elementAt(index));
                              },
                            )),
                  );
                },
                // Widgets returned in the error parameter show up
                // when the FutureProvider returns an error.
                error: (e, _) {
                  print(e);

                  return const Center(
                    child: Icon(Icons.error),
                  );
                },
                // Widgets returned in the loading parameter show up
                // when data is being retrieved or the FutureProvider
                // is still running.
                loading: () =>
                    const Center(child: CircularProgressIndicator()));
          }))
        ],
      ),
    );
  }
}
