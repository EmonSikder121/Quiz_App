import 'package:flutter/material.dart';
import 'package:quiz_app/quiz.dart';

import 'home_page.dart';


class ResultPage extends StatelessWidget {
  ResultPage({Key? key}) : super(key: key);
  int correct = 0;
  int incorrect = 0;
  @override
  Widget build(BuildContext context) {
    _generateResult();
    return Scaffold(
      appBar: AppBar(title: const Text('Quiz Result'),),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text('CORRECT: $correct', style: const TextStyle(fontSize: 30),),
            Text('INCORRECT: $incorrect', style: const TextStyle(fontSize: 30),),
            OutlinedButton(
              onPressed: () {
                _resetQuiz();
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => HomePage()));
              },
              child: const Text('RESTART'),
            )
          ],
        ),
      ),
    );
  }

  void _generateResult() {
    for(final map in quizList) {
      if(map[rightAnswer] == map[givenAnswer]) {
        correct++;
      } else {
        incorrect++;
      }
    }
    print('CORRECT: $correct - INCORRECT: $incorrect');
  }

  void _resetQuiz() {
    for(final map in quizList) {
      map[givenAnswer] = '';
    }
  }
}
