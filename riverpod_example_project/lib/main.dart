import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_example_project/views/00_0_homeView/a_homeView.dart';

// Riverpod example project

// The purpose of this project is to show the different features in Riverpod
// A more detailed documentation is available in https://riverpod.dev/docs/getting_started
// Pub.dev link: https://pub.dev/packages/flutter_riverpod

void main() async {
  if (!kIsWeb) {
    WidgetsFlutterBinding.ensureInitialized();
    await Firebase.initializeApp(
        // options: DefaultFirebaseOptions.currentPlatform,
        );
  }

  try {
    var firebaseAuth = FirebaseAuth.instance;

    await firebaseAuth.signInWithEmailAndPassword(
        email: 'a@a.com', password: '123456');
  } catch (e) {
    // ignore: avoid_print
    print(e);
  }

  // To make sure that Riverpod works properly in the application, add the ProviderScope
  // widget and add the main app (default name as MyApp) as a child widget.
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      home: const HomeView(),
    );
  }
}
