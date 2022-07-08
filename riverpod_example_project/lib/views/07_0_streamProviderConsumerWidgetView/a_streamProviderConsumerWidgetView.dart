// ignore_for_file: avoid_print, file_names

import 'package:flutter/material.dart';
import 'package:riverpod_example_project/views/07_0_streamProviderConsumerWidgetView/commentsConsumerWidget/a_commentsConsumerWidget.dart';
import 'package:riverpod_example_project/views/07_0_streamProviderConsumerWidgetView/ticketsConsumerWidget/a_tickets_consumerWidget.dart';

class StreamProviderConsumerWidgetView extends StatelessWidget {
  /// View for a StreamProvider example using ConsumerWidgets
  ///
  /// This example has the same functionality as the StreamProvider example, but
  /// uses ConsumerWidgets to get the provider references.
  const StreamProviderConsumerWidgetView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: const Text('StreamProvider example'),
      ),
      body: Center(
        child: Row(
          children: const [
            Flexible(
              // ConsumerWidget for the Ticket Card
              child: TicketConsumerWidget(),
            ),
            Flexible(
              // ConsumerWidget for the Comments Card
              child: CommentsConsumerWidget(),
            ),
          ],
        ),
      ),
    );
  }
}
