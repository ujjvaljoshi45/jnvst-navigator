import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:test_preparation_app/model/question.dart';

import '../views/result_view.dart';
import 'image_question.dart';

class QuestionData extends ChangeNotifier {
  int questionNumber = 0;

  int myScore = 0;

  List<Question> myQuestionList = [];

  List<ImageQuestion> _imageQuestions = [];

  late int max;

  late List<int> myAnswers;
  List<Question> get questionList => myQuestionList;

  List<ImageQuestion> get imageQuestions => _imageQuestions;
  int get maxImage => _imageQuestions.length;

  List<int> get answers => myAnswers;

  int get score => myScore;

  QuestionData() {
    max = myQuestionList.length;
    myAnswers = List<int>.filled(max, -1);
  }

  Future<void> getQuestions() async {
    final QuerySnapshot<Map<String, dynamic>> questions =
        await FirebaseFirestore.instance
            .collection('questions')
            .where('title', isEqualTo: 'test 1')
            .get();

    myQuestionList = questions.docs
        .map((QueryDocumentSnapshot<Map<String, dynamic>> e) =>
            Question.fromMap(e.data()))
        .toList();
    max = myQuestionList.length;
    myAnswers = List<int>.filled(max, -1);

    notifyListeners();
  }

  Future<void> getImageQuestions() async {
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    CollectionReference cr = firestore.collection('questionsImage');
    QuerySnapshot<Map<String, dynamic>> questions =
        await cr.get() as QuerySnapshot<Map<String, dynamic>>;
    for (var item in questions.docs) {
      _imageQuestions.add(ImageQuestion.fromMap(item.data()));
    }
    notifyListeners();
  }

  void nextQuestion(context) {
    if (questionNumber < max - 1) {
      questionNumber++;
      notifyListeners();
    } else {
      calculateScore();
      Navigator.pushNamed(context, ResultView.route);
    }
  }

  void previousQuestion() {
    if (questionNumber > 0) {
      questionNumber--;
    }

    notifyListeners();
  }

  void calculateScore() {
    myScore = 0;
    for (int i = 0; i < max; i++) {
      if (myAnswers[i] == myQuestionList[i].correctIndex) {
        myScore++;
      }
    }
    questionNumber = 0;
    notifyListeners();
  }
}
