import 'package:flutter/material.dart';
import 'package:quiz_v1/data/questions.dart';
import 'package:quiz_v1/quiz_summary.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen({
    super.key,
    required this.chosenAnswer,
    required this.onRestart,
  });

  final List<String> chosenAnswer;
  final void Function() onRestart;

  List<Map<String, Object>> getSummaryData() {
    final List<Map<String, Object>> summary = [];

    for (int i = 0; i < chosenAnswer.length; i++) {
      summary.add({
        'question_index': i,
        'question': questions[i].question,
        'correct_answer': questions[i].answers[0],
        'user_answer': chosenAnswer[i],
      });
    }
    return summary;
  }

  @override
  Widget build(BuildContext context) {
    var summaryData = getSummaryData();

    var numTotalQuestions = questions.length;
    var numCorrectAnswers =
        summaryData
            .where((data) => data['correct_answer'] == data['user_answer'])
            .length;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Total Questions $numTotalQuestions | Correct Answers: $numCorrectAnswers',
            style: TextStyle(
              fontSize: 30,
              color: Colors.white70,
              fontWeight: FontWeight.bold,
            ),
          ),
          QuizSummary(summaryData: getSummaryData()),
          SizedBox(height: 30),
          OutlinedButton.icon(
            style: OutlinedButton.styleFrom(foregroundColor: Colors.white),
            onPressed: onRestart,
            icon: const Icon(Icons.arrow_right_alt),
            label: const Text('Reset Quiz'),
          ),
        ],
      ),
    );
  }
}
