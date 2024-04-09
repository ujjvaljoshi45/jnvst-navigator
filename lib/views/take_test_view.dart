import 'dart:async';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_preparation_app/constants.dart';
import 'package:test_preparation_app/model/question_list.dart';

import 'result_view.dart';

class TakeTestView extends StatefulWidget {
  static const String route = 'take_test';
  const TakeTestView({super.key});

  @override
  State<TakeTestView> createState() => _TakeTestViewState();
}

class _TakeTestViewState extends State<TakeTestView> {
  int _seletecOption = -1;
  late Duration oneHr;
  late void Function()? finishTest;
  @override
  void initState() {
    super.initState();
    startTimer();
  }

  // function for timer logic of the test for 1 hour
  void startTimer() {
    oneHr = const Duration(hours: 1);
    Timer.periodic(const Duration(seconds: 1), (timer) {
      if (oneHr.inSeconds == 0) {
        timer.cancel();
        finishTest!();
      } else {
        setState(() {
          oneHr = oneHr - const Duration(seconds: 1);
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<QuestionData>(
      builder: (context, quizData, child) {
        finishTest = () {
          Navigator.pushNamed(context, ResultView.route);
        };

        return Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            automaticallyImplyLeading: false,
            leading: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              child: IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.power_settings_new_rounded,
                  color: Colors.black,
                  size: 36.0,
                ),
              ),
            ),
            actions: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 4.0),
                child: ElevatedButton(
                  style: myButtonStyle,
                  onPressed: () {
                    quizData.previousQuestion();
                  },
                  child: const Text("Previous",
                      style: TextStyle(color: Colors.white)),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 18.0),
                child: ElevatedButton(
                  style: myButtonStyle,
                  onPressed: () {
                    quizData.answers[quizData.questionNumber] =
                        _seletecOption - 1;
                    quizData.nextQuestion(context);
                    _seletecOption = -1;
                  },
                  child:
                      const Text("Next", style: TextStyle(color: Colors.white)),
                ),
              ),
            ],
          ),
          body: Column(
            children: [
              const SizedBox(height: 10),
              _buildProgressBar(quizData.questionNumber, quizData.max),
              const SizedBox(height: 10),
              SizedBox(
                height: MediaQuery.of(context).size.height - 154,
                child: Column(
                  children: [
                    const SizedBox(height: 20),
                    _buildQuestionCard(quizData),
                    const SizedBox(height: 20),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  _buildProgressBar(int index, int max) {
    Container progressBarContainer(double width, Color color) => Container(
          height: 14,
          width: width,
          decoration: BoxDecoration(
            color: color,
            borderRadius: const BorderRadius.all(
              Radius.circular(20),
            ),
          ),
        );

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18.0, vertical: 2.0),
      child: Stack(
        children: [
          progressBarContainer(double.infinity, background),
          progressBarContainer(
              MediaQuery.of(context).size.width * (index / max), secondaryColor)
        ],
      ),
    );
  }

  _buildQuestionCard(QuestionData quizData) {
    int currentQuestion = quizData.questionNumber + 1;
    int maxQuestion = quizData.max;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18.0),
      child: Card(
        elevation: 5.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        child: Padding(
          padding: const EdgeInsets.all(18.0),
          child: Column(
            children: [
              Row(
                children: [
                  Align(
                    alignment: Alignment.topLeft,
                    child: Text("Question $currentQuestion/$maxQuestion",
                        style: testTextStyle.copyWith(
                            fontWeight: FontWeight.bold, fontSize: 22.0)),
                  ),
                  // Timer
                  const Spacer(),
                  Row(
                    children: [
                      const Icon(Icons.timer_outlined, size: 30),
                      const SizedBox(width: 5),
                      Text(
                        "${oneHr.inMinutes.remainder(60)}:${oneHr.inSeconds.remainder(60)}",
                        style: testTextStyle.copyWith(
                            fontWeight: FontWeight.bold, fontSize: 24.0),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 10),
              SizedBox(
                width: double.infinity,
                height: MediaQuery.of(context).size.height * 0.25,
                child: Scrollbar(
                  thickness: 4,
                  child: SingleChildScrollView(
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        quizData
                            .questionList[quizData.questionNumber].questionText,
                        maxLines: null,
                        style: testTextStyle.copyWith(
                            fontSize: 20.0, fontWeight: FontWeight.w500),
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 5),
              IconButton(
                  onPressed: () => setState(() => _seletecOption = -1),
                  icon: const Column(
                    children: [Icon(Icons.clear), Text("Clear Response")],
                  )),
              const SizedBox(height: 5),
              _buildOptions(quizData),
            ],
          ),
        ),
      ),
    );
  }

  _buildOptions(QuestionData quizData) {
    return Column(
      children: [
        _buildOption(
            "A", quizData.questionList[quizData.questionNumber].options[0], 0),
        _buildOption(
            "B", quizData.questionList[quizData.questionNumber].options[1], 1),
        _buildOption(
            "C", quizData.questionList[quizData.questionNumber].options[2], 2),
        _buildOption(
            "D", quizData.questionList[quizData.questionNumber].options[3], 3),
      ],
    );
  }

  _buildOption(String s, String t, int index) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: ElevatedButton(
        style: _seletecOption == index ? mySelectedOption : myUnSelectedOption,
        onPressed: () => setState(() => _seletecOption = index),
        child: Row(
          children: [
            Text(
              s,
              style: _seletecOption == index
                  ? mySelectedOptionText
                  : myUnSelectedOptionText,
            ),
            const SizedBox(width: 10),
            Text(
              t,
              style: _seletecOption == index
                  ? mySelectedOptionText
                  : myUnSelectedOptionText,
            ),
          ],
        ),
      ),
    );
  }
}
