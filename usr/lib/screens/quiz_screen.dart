import 'package:flutter/material.dart';
import '../data/mock_data.dart';
import '../models/quiz_question.dart';

class QuizScreen extends StatefulWidget {
  const QuizScreen({super.key});

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  int _currentQuestionIndex = 0;
  int _score = 0;
  bool _hasAnswered = false;
  int? _selectedOptionIndex;

  void _answerQuestion(int optionIndex) {
    if (_hasAnswered) return;

    setState(() {
      _hasAnswered = true;
      _selectedOptionIndex = optionIndex;
      if (optionIndex == MockData.quizQuestions[_currentQuestionIndex].correctOptionIndex) {
        _score++;
      }
    });
  }

  void _nextQuestion() {
    if (_currentQuestionIndex < MockData.quizQuestions.length - 1) {
      setState(() {
        _currentQuestionIndex++;
        _hasAnswered = false;
        _selectedOptionIndex = null;
      });
    } else {
      _showResults();
    }
  }

  void _showResults() {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (ctx) => AlertDialog(
        title: const Text('Quiz Completed!'),
        content: Text('You scored $_score out of ${MockData.quizQuestions.length}.'),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(ctx).pop();
              Navigator.of(context).pop();
            },
            child: const Text('Back to Home'),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.of(ctx).pop();
              setState(() {
                _currentQuestionIndex = 0;
                _score = 0;
                _hasAnswered = false;
                _selectedOptionIndex = null;
              });
            },
            child: const Text('Restart Quiz'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final question = MockData.quizQuestions[_currentQuestionIndex];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Knowledge Quiz'),
      ),
      body: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 600),
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  'Question ${_currentQuestionIndex + 1} of ${MockData.quizQuestions.length}',
                  style: const TextStyle(
                    fontSize: 16,
                    color: Colors.grey,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),
                LinearProgressIndicator(
                  value: (_currentQuestionIndex + 1) / MockData.quizQuestions.length,
                ),
                const SizedBox(height: 32),
                Text(
                  question.questionText,
                  style: const TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 32),
                ...List.generate(question.options.length, (index) {
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 12.0),
                    child: _buildOptionButton(index, question.options[index], question.correctOptionIndex),
                  );
                }),
                if (_hasAnswered) ...[
                  const SizedBox(height: 24),
                  Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: _selectedOptionIndex == question.correctOptionIndex
                          ? Colors.green.withOpacity(0.1)
                          : Colors.red.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          _selectedOptionIndex == question.correctOptionIndex
                              ? 'Correct!'
                              : 'Incorrect!',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: _selectedOptionIndex == question.correctOptionIndex
                                ? Colors.green
                                : Colors.red,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(question.explanation),
                      ],
                    ),
                  ),
                  const Spacer(),
                  ElevatedButton(
                    onPressed: _nextQuestion,
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.all(16),
                    ),
                    child: Text(_currentQuestionIndex < MockData.quizQuestions.length - 1 ? 'Next Question' : 'Finish Quiz'),
                  ),
                ],
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildOptionButton(int index, String text, int correctIndex) {
    Color backgroundColor = Colors.white;
    Color borderColor = Colors.grey.shade300;
    Color textColor = Colors.black87;

    if (_hasAnswered) {
      if (index == correctIndex) {
        backgroundColor = Colors.green;
        borderColor = Colors.green;
        textColor = Colors.white;
      } else if (index == _selectedOptionIndex) {
        backgroundColor = Colors.red;
        borderColor = Colors.red;
        textColor = Colors.white;
      }
    }

    return InkWell(
      onTap: () => _answerQuestion(index),
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: backgroundColor,
          border: Border.all(color: borderColor, width: 2),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Text(
          text,
          style: TextStyle(
            fontSize: 16,
            color: textColor,
            fontWeight: _hasAnswered && index == correctIndex ? FontWeight.bold : FontWeight.normal,
          ),
        ),
      ),
    );
  }
}
