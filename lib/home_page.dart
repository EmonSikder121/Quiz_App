import 'dart:async';
import 'package:flutter/material.dart';
import 'package:quiz_app/question_view.dart';
import 'package:quiz_app/quiz.dart';
import 'package:quiz_app/result_page.dart';


class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int count = 30;
  bool hasQuizStarted = false;
  Timer? timer;

  @override
  void initState() {
    DateTime dateTime = DateTime.now();
    // String formattedDate = DateFormat('mm:ss').format(dateTime);
    timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        count--;
      });
    });
    //timer?.cancel();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final List<String> dummyList = List.generate(100, (index) => 'Item ${index + 1}');
    return Scaffold(
      appBar: AppBar(
        leading: Container(alignment: Alignment.center, child: Text('$count', style: const TextStyle(fontSize: 20),),),
        title: const Text('Flutter Quiz'),
        actions: [
          TextButton(
            style: TextButton.styleFrom(
              foregroundColor: Colors.white,
            ),
            onPressed: () => Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => ResultPage())),
            child: const Text('FINISH'),
          )
        ],
      ),
      body: ListView.builder(
        itemCount: quizList.length,
        itemBuilder: (context, index) => QuestionView(map: quizList[index], index: index)),
    );
  }
}


