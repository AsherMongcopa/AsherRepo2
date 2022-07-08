// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:riverpod_example_project/views/01_pocoExampleView/a_pocoExampleView.dart';
import 'package:riverpod_example_project/views/00_5_pocoStatelessExampleView/a_pocoStatelessExampleView.dart';
import 'package:riverpod_example_project/views/02_providerExampleview/a_providerExampleView.dart';
import 'package:riverpod_example_project/views/00_6_providerAutoDisposeStatelessExampleView/a_providerAutodisposeExampleView.dart';
import 'package:riverpod_example_project/views/03_providerAutoDisposeExampleView/a_providerAutodisposeExampleView.dart';
import 'package:riverpod_example_project/views/04_stateNotifierProviderView/a_stateNotifierProviderView.dart';
import 'package:riverpod_example_project/views/05_futureProviderView/a_futureProviderView.dart';
import 'package:riverpod_example_project/views/06_streamProviderView/a_streamProviderView.dart';
import 'package:riverpod_example_project/views/08_restApiExampleView/a_restApiExampleView.dart';
import 'package:riverpod_example_project/views/07_0_streamProviderConsumerWidgetView/a_streamProviderConsumerWidgetView.dart';
import 'package:riverpod_example_project/views/09_restApiTodosExampleView/a_restApiTodosExampleView.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Home'),
        ),
        body: ListView(
          children: [
            ListTile(
              title: const Text('00.5 - Class object example (basic controller, StatelessWidget)'),
              onTap: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) {
                  return const POCOStatelessExampleView();
                }));
              },
            ),

            ListTile(
              title: const Text('00.6 - Provider AutoDispose Stateless example'),
              onTap: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) {
                  return const ProviderAutoDisposeStatelessExampleView();
                }));
              },
            ),
            ListTile(
              title: const Text('01 - Class object example (basic controller)'),
              onTap: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) {
                  return const POCOExampleView();
                }));
              },
            ),
            
            ListTile(
              title: const Text('02 - Provider example'),
              onTap: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) {
                  return const ProviderExampleView();
                }));
              },
            ),
            ListTile(
              title: const Text('03 - Provider AutoDispose example'),
              onTap: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) {
                  return const ProviderAutoDisposeExampleView();
                }));
              },
            ),
            ListTile(
              title: const Text('04 - StateNotifierProvider example'),
              onTap: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) {
                  return const StateNotifierProviderView();
                }));
              },
            ),
            ListTile(
              title: const Text('05 - FutureProvider example (Firestore)'),
              onTap: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) {
                  return const FutureProviderView();
                }));
              },
            ),
            ListTile(
              title: const Text('06 - StreamProvider example (Firestore)'),
              onTap: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) {
                  return const StreamProviderView();
                }));
              },
            ),
            ListTile(
              title: const Text('07 - StreamProvider example (Firestore, ConsumerWidget)'),
              onTap: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) {
                  return const StreamProviderConsumerWidgetView();
                }));
              },
            ),
            // ListTile(
            //   title: const Text('07.5 - StreamProvider via StateNotifierProvider example (Firestore)'),
            //   onTap: () {
            //     Navigator.of(context)
            //         .push(MaterialPageRoute(builder: (context) {
            //       return const StreamProviderCNPView();
            //     }));
            //   },
            // ),
            ListTile(
              title: const Text('08 - Rest API example'),
              onTap: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) {
                  return const RestApiExampleView();
                }));
              },
            ),
            ListTile(
              title: const Text('09 - Rest API Todos example'),
              onTap: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) {
                  return const RestApiTodosExampleView();
                }));
              },
            ),
          ],
        ));
  }
}
