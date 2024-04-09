import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:test_preparation_app/model/question_list.dart';

import '../constants.dart';

class TakeImageTest extends StatelessWidget {
  static const String route = 'take_image_test';
  const TakeImageTest({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(
          'Image Test',
          style: myAppBarTextStyle,
        ),
        elevation: 0.5,
        backgroundColor: Colors.blue,
      ),
      body: SingleChildScrollView(
        child: Consumer<QuestionData>(
          builder: (context, value, child) {
            return Column(children: [
              ElevatedButton(onPressed: () {}, child: Text('Submit')),
              Image.network(
                value.imageQuestions[value.questionNumber].questionImage,
                height: 250,
                width: MediaQuery.of(context).size.width,
              ),
              Image.network(
                value.imageQuestions[value.questionNumber].option1Image,
                height: 250,
                width: MediaQuery.of(context).size.width,
              ),
              Image.network(
                value.imageQuestions[value.questionNumber].option2Image,
                height: 250,
                width: MediaQuery.of(context).size.width,
              ),
              Image.network(
                value.imageQuestions[value.questionNumber].option3Image,
                height: 250,
                width: MediaQuery.of(context).size.width,
              ),
              Image.network(
                value.imageQuestions[value.questionNumber].option4Image,
                height: 250,
                width: MediaQuery.of(context).size.width,
              ),
            ]);
          },
        ),
      ),
    );
  }
}
