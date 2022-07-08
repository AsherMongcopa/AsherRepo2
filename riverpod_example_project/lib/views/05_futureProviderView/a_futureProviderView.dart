// ignore_for_file: avoid_print, file_names

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_example_project/views/05_futureProviderView/c_co_commentsController.dart';
import 'package:riverpod_example_project/views/05_futureProviderView/c_fp_getComments.dart';
import 'package:riverpod_example_project/views/05_futureProviderView/c_fp_getTickets.dart';
import 'package:riverpod_example_project/views/05_futureProviderView/c_snp_currentTicketState.dart';

class FutureProviderView extends StatelessWidget {
  /// View for a FutureProvider example
  ///
  /// A FutureProvider is a Provider that returns a Future. Depending on the
  /// state that the Future is currently in, the view can update to the
  /// appropriate status. This is done by using a .when method with the
  /// provider.
  ///
  /// This example uses tickets and comments from the BizAppz2 database. Data
  /// is retrieved using the FlutterFire package.
  const FutureProviderView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final commentsField = TextEditingController();
    // POCO used as a controller
    final viewController = CommentsController();

    return Scaffold(
      appBar: AppBar(
        title: const Text('FutureProvider example'),
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
                    Expanded(child: Consumer(builder: (context, ref, child) {
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
                                        title:
                                            Text(data.elementAt(index).subject),
                                        selected:
                                            ref.watch(currentTicketState) ==
                                                data.elementAt(index),
                                        // Using a StateNotifierProvider to retain information
                                        // on the current ticket to show linked comments
                                        onTap: () {
                                          ref
                                              .read(currentTicketState.notifier)
                                              .changeState(
                                                  data.elementAt(index));
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
                      trailing: Consumer(builder: (context, ref, child) {
                        return IconButton(
                            onPressed: () async {
                              if (ref.watch(currentTicketState) == null) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                        content: Text(
                                            "Cannot find a ticket to add a comment")));
                              } else {
                                if (commentsField.text != "") {
                                  String text = commentsField.text;

                                  commentsField.text = '';

                                  await viewController.addComment(
                                      text, ref.watch(currentTicketState)!);

                                  // ref.refresh() recalls the function for the
                                  // FutureProvider. Very useful for updating
                                  // lists.
                                  ref.refresh(getComments);
                                }
                              }
                            },
                            icon: const Icon(Icons.send));
                      }),
                    ),
                    Expanded(child: Consumer(builder: (context, ref, child) {
                      // .when method for showing comments
                      return ref.watch(getComments).when(
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
