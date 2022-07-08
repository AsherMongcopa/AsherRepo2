// ignore_for_file: avoid_print, file_names

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_example_project/views/07_0_streamProviderConsumerWidgetView/c_snp_currentTicketState.dart';
import 'package:riverpod_example_project/views/07_0_streamProviderConsumerWidgetView/commentsConsumerWidget/c_co_commentsController.dart';
import 'package:riverpod_example_project/views/07_0_streamProviderConsumerWidgetView/commentsConsumerWidget/c_sp_getComments.dart';

// ConsumerWidget for Comments List
//
// A ConsumerWidget is a StatelessWidget that has a WidgetRef. This allows the
// programmer to reference a provider without using Consumer.
class CommentsConsumerWidget extends ConsumerWidget {
  const CommentsConsumerWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final commentsField = TextEditingController();
    // POCO used as a controller
    final viewController = CommentsController();

    return Card(
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
                  if (ref.watch(currentTicketState) == null) {
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                        content:
                            Text("Cannot find a ticket to add a comment")));
                  } else {
                    if (commentsField.text != "") {
                      String text = commentsField.text;

                      commentsField.text = '';

                      await viewController.addComment(
                          text, ref.watch(currentTicketState)!);
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
                                      padding: const EdgeInsets.all(8.0),
                                      alignment: Alignment.centerLeft,
                                      width: double.infinity,
                                      child: Text(data.elementAt(index).body),
                                    ),
                                    Container(
                                      padding: const EdgeInsets.all(8.0),
                                      alignment: Alignment.centerRight,
                                      child: Text(
                                        (data.elementAt(index).dateCreated ??
                                                Timestamp
                                                    .fromMicrosecondsSinceEpoch(
                                                        0))
                                            .toDate()
                                            .toString(),
                                        style: const TextStyle(
                                            fontStyle: FontStyle.italic,
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
    );
  }
}
