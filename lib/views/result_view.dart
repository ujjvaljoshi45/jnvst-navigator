import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_preparation_app/model/question_list.dart';

class ResultView extends StatelessWidget {
  static const String route = 'result_view';
  const ResultView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text(
          'Result',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.w500),
        ),
        elevation: 1,
        backgroundColor: Colors.blue,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'Score : ${Provider.of<QuestionData>(context).myScore}',
              style:
                  const TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
            ),
            ElevatedButton(
                onPressed: () {
                  Navigator.popUntil(context, (route) => false);
                  Navigator.pushNamed(context, '/');
                },
                child: const Text('Go to Home Page'))
          ],
        ),
      ),
    );
  }
}
