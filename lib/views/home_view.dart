import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:provider/provider.dart';
import 'package:test_preparation_app/constants.dart';

import 'package:test_preparation_app/views/take_image_test.dart';
import 'package:test_preparation_app/views/take_test_view.dart';

import '../model/question_list.dart';

class HomePage extends StatefulWidget {
  static const String route = 'home_page';
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool showSpinner = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.notifications_none_rounded,
            color: Colors.white,
            size: 28.0,
          ),
        ),
        title: Text(
          'JNVST Navigator',
          style: myAppBarTextStyle,
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.account_circle_rounded,
              color: Colors.white,
              size: 28.0,
            ),
          ),
        ],
        elevation: 1,
        backgroundColor: secondaryColor,
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: secondaryColor,
        elevation: 1,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home_outlined,
              size: 32.0,
              color: Colors.white,
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.book_outlined, size: 32.0, color: Colors.white),
            label: '',
          ),
          BottomNavigationBarItem(
            icon:
                Icon(Icons.bar_chart_rounded, size: 32.0, color: Colors.white),
            label: '',
          ),
        ],
      ),
      body: ModalProgressHUD(
        inAsyncCall: showSpinner,
        child: Center(
            child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            TextButton(
              style: myButtonStyle,
              onPressed: () {
                setState(() {
                  showSpinner = true;
                });
                Provider.of<QuestionData>(context, listen: false)
                    .getQuestions()
                    .whenComplete(
                  () {
                    setState(() {
                      showSpinner = false;
                    });
                    Navigator.pushNamed(context, TakeTestView.route);
                  },
                );
              },
              child: const Text(
                'Take Test',
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                    fontSize: 24.0),
              ),
            ),
            TextButton(
              style: myButtonStyle,
              onPressed: () {
                setState(() {
                  showSpinner = true;
                });
                Provider.of<QuestionData>(context, listen: false)
                    .getImageQuestions()
                    .whenComplete(
                  () {
                    setState(() {
                      showSpinner = false;
                    });
                    Navigator.pushNamed(context, TakeImageTest.route);
                  },
                );
              },
              child: const Text(
                'Take Image Test',
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                    fontSize: 24.0),
              ),
            ),
          ],
        )),
      ),
    );
  }
}
