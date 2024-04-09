import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_preparation_app/constants.dart';
import 'package:test_preparation_app/model/question_list.dart';

import 'package:test_preparation_app/views/home_view.dart';
import 'package:test_preparation_app/views/result_view.dart';
import 'package:test_preparation_app/views/take_image_test.dart';
import 'package:test_preparation_app/views/take_test_view.dart';
import 'views/take_test_view.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  ).then((value) => print('Firebase Initialized'));
  runApp(ChangeNotifierProvider(
      create: (context) => QuestionData(), child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(scaffoldBackgroundColor: background),
      home: const HomePage(),
      routes: {
        HomePage.route: (context) => const HomePage(),
        TakeTestView.route: (context) => const TakeTestView(),
        ResultView.route: (context) => const ResultView(),
        TakeImageTest.route: (context) => const TakeImageTest(),
      },
    );
  }
}
