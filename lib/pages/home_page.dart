import 'package:flutter/material.dart';
import 'package:quiz_app/models/questions_answers.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int questionIndex = 0;
  int score = 0;
  bool isFinished = false;
  @override
  Widget build(BuildContext context) {
    List<QuestionsWithAnswers> questionsWithAnswers = [
      QuestionsWithAnswers(
          question: 'In which sport would you perform a slam dunk?',
          answers: ['Volleyball', 'Basketball', 'Football'],
          correct: 'Basketball'),
      QuestionsWithAnswers(
          question: ' Which country is known as the Land of the Rising Sun?',
          answers: ['China', 'Japan', 'Thailand'],
          correct: 'Japan'),
      QuestionsWithAnswers(
          question: 'What is the chemical symbol for gold?',
          answers: ['Au', 'Ag', 'Zn'],
          correct: 'Au'),
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Quiz App',style:TextStyle(fontSize: 16),),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 30, vertical: 40),
        child: Column(
        
          children: [
            if (!isFinished) ...[
              Padding(
                padding: EdgeInsets.only(bottom: 20),
                child: Text(
                  questionsWithAnswers[questionIndex].question,
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                ),
              ),
              Column(
                children: (questionsWithAnswers[questionIndex].answers
                        as List<String>)
                    .map((answer) => answerButton(
                        text: answer,
                        onPress: () {
                          setState(() {
                            if (answer ==
                                questionsWithAnswers[questionIndex].correct) {
                              score++;
                            }
                            if (questionIndex <
                                questionsWithAnswers.length - 1) {
                              questionIndex++;
                            } else {
                              isFinished = true;
                            }
                          });
                        }))
                    .toList(),
              )
            ],
            if (isFinished) ...[
              Center(
                child: Column(
                  children: [
                    Text(
                      'Congratulations',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                    ),
                    SizedBox(
                      height: 24,
                    ),
                    Text('Your score: ${score}/${questionIndex + 1}'),
                    SizedBox(
                      child: TextButton(
                          onPressed: () {
                            setState(() {
                              isFinished = false;
                              score = 0;
                              questionIndex = 0;
                            });
                          },
                          child: Text('reset')),
                    ),
                  ],
                ),
              )
            ]
          ],
        ),
      ),
    );
  }
}

Widget answerButton({required String text, required VoidCallback onPress}) {
  return Padding(
      padding: EdgeInsets.only(bottom: 10),
      child: SizedBox(
          width: double.infinity,
          child: ElevatedButton(onPressed: onPress, child: Text(text))));
}

void answerQuestion() {
  debugPrint('clicked');
}


