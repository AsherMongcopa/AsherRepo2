// ignore_for_file: avoid_print, file_names

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_example_project/views/07_6_streamProviderSNPView/c_snp_currentTicketState.dart';

class StreamProviderSNPView extends ConsumerWidget {
  /// View for a StreamProvider via StateNotifierProvider example
  ///
  /// It is possible to call all your providers inside a StateNotifierProvider.
  /// It might not be ideal to use this method, but it can be applicable in
  /// some situations where a StateNotifierProvider is handling the main state
  /// of a view.
  const StreamProviderSNPView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final commentsField = TextEditingController();

    // Initializing the main state and the notifier.
    final state = ref.watch(currentTicketState);
    final stateNotifier = ref.watch(currentTicketState.notifier);

    return Scaffold(
      appBar: AppBar(
        title: const Text('StreamProvider example'),
      ),
      body: Center(
        child: Row(
          children: [
            Flexible(
              child: Card(
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
                    Expanded(
                        child: ListView(
                      primary: false,
                      children: List.generate(
                          state.ticketList.length,
                          (index) => ListTile(
                                title: Text(
                                    state.ticketList.elementAt(index).subject),
                                selected: state.currentTicketId ==
                                    state.ticketList.elementAt(index).id_a_t,
                                // Using a StateNotifierProvider to retain information
                                // on the current ticket to show linked comments
                                onTap: () {
                                  stateNotifier.getCommentsFromId(
                                      state.ticketList.elementAt(index).id_a_t);
                                },
                              )),
                    ))
                  ],
                ),
              ),
            ),
            Flexible(
              child: Card(
                elevation: 2.5,
                child: Column(
                  children: [
                    Container(
                      padding: const EdgeInsets.only(left: 8.0, top: 8.0),
                      child: Text(
                        'Comments',
                        style: Theme.of(context).textTheme.headline5,
                      ),
                      alignment: Alignment.centerLeft,
                    ),
                    const Divider(),
                    ListTile(
                      title: TextFormField(
                        controller: commentsField,
                        maxLines: 3,
                      ),
                      trailing: IconButton(
                          onPressed: () async {
                            if (ref.watch(currentTicketState).currentTicketId ==
                                '') {
                              ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                      content: Text(
                                          "Cannot find a ticket to add a comment")));
                            } else {
                              if (commentsField.text != "") {
                                String text = commentsField.text;

                                commentsField.text = '';

                                await stateNotifier.addComment(text);
                              }
                            }
                          },
                          icon: const Icon(Icons.send)),
                    ),
                    Expanded(child: Builder(builder: (context) {
                      // .when method for showing comments
                      //
                      // StreamProvider uses same .when() method for updating
                      // state.
                      // 
                      // Does not work using current method.
                      // Having the variable as an actual Stream rather than an
                      // output from the StreamProvider would be a better
                      // alternative.
                      //
                      // Currently the StateNotifierProvider will dispose and
                      // reset to its initial values when a ticket is selected,
                      // where commentList is equal to null.
                      if (state.commentList == null) {
                        return ListView(
                          children: const [
                            Center(
                                child: Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Text('No ticket selected.'),
                            ))
                          ],
                        );
                      }

                      return state.commentList!.when(
                          data: (data) {
                            return ListView(
                              primary: false,
                              children: List.generate(
                                  data.length,
                                  (index) => Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Card(
                                          elevation: 5,
                                          child: Column(
                                            mainAxisSize: MainAxisSize.min,
                                            children: [
                                              Container(
                                                padding:
                                                    const EdgeInsets.all(8.0),
                                                alignment: Alignment.centerLeft,
                                                width: double.infinity,
                                                child: Text(
                                                    data.elementAt(index).body),
                                              ),
                                              Container(
                                                padding:
                                                    const EdgeInsets.all(8.0),
                                                alignment:
                                                    Alignment.centerRight,
                                                child: Text(
                                                  (data
                                                              .elementAt(index)
                                                              .dateCreated ??
                                                          Timestamp
                                                              .fromMicrosecondsSinceEpoch(
                                                                  0))
                                                      .toDate()
                                                      .toString(),
                                                  style: const TextStyle(
                                                      fontStyle:
                                                          FontStyle.italic,
                                                      color: Colors.grey),
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                      )),
                            );
                          },
                          error: (e, _) {
                            print(e);

                            return const Center(
                              child: Icon(Icons.error),
                            );
                          },
                          loading: () =>
                              const Center(child: CircularProgressIndicator()));
                    }))
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
