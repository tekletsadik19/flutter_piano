import 'package:flutter/material.dart';

import '../../domain/entities/quiz.dart';
import '../widget/quiz_viewer.dart';

class QuizScreen extends StatefulWidget {
  const QuizScreen({
    super.key,
    required this.quiz,
    required this.onComplete,
  });

  final LessonQuiz quiz;
  final Function(QuizAttempt) onComplete;

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  late PageController _pageController;
  late List<int> _selectedAnswers;
  int _currentQuestionIndex = 0;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
    _selectedAnswers = List<int>.filled(widget.quiz.questions.length, -1);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _selectAnswer(int answerIndex) {
    setState(() {
      _selectedAnswers[_currentQuestionIndex] = answerIndex;
    });
  }

  void _nextQuestion() {
    if (_currentQuestionIndex < widget.quiz.questions.length - 1) {
      _pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  void _previousQuestion() {
    if (_currentQuestionIndex > 0) {
      _pageController.previousPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  void _submitQuiz() {
    int score = 0;
    for (int i = 0; i < widget.quiz.questions.length; i++) {
      if (_selectedAnswers[i] == widget.quiz.questions[i].correctAnswerIndex) {
        score += widget.quiz.questions[i].points;
      }
    }

    final percentage = (score / widget.quiz.totalPoints * 100).round();
    final passed = percentage >= widget.quiz.passingScore;

    final attempt = QuizAttempt(
      id: DateTime.now().millisecondsSinceEpoch.toString(),
      lessonId: widget.quiz.lessonId,
      userId: 'user', // TODO: get actual user ID from auth
      attemptedAt: DateTime.now(),
      selectedAnswers: _selectedAnswers,
      score: percentage,
      passed: passed,
      timeTaken: const Duration(minutes: 5), // TODO: track actual time
    );

    widget.onComplete(attempt);
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final totalQuestions = widget.quiz.questions.length;

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.quiz.title),
        centerTitle: true,
        actions: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: Center(
              child: Text(
                '${_currentQuestionIndex + 1}/$totalQuestions',
                style: theme.textTheme.titleSmall?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          // Progress bar
          LinearProgressIndicator(
            value: (_currentQuestionIndex + 1) / totalQuestions,
            minHeight: 4,
          ),
          Expanded(
            child: PageView(
              controller: _pageController,
              onPageChanged: (index) {
                setState(() => _currentQuestionIndex = index);
              },
              children: List.generate(
                totalQuestions,
                (index) => QuizViewer(
                  question: widget.quiz.questions[index],
                  selectedAnswer: _selectedAnswers[index],
                  onAnswerSelected: _selectAnswer,
                ),
              ),
            ),
          ),
          // Navigation buttons
          Container(
            padding: const EdgeInsets.all(16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton.icon(
                  onPressed: _currentQuestionIndex > 0 ? _previousQuestion : null,
                  icon: const Icon(Icons.arrow_back),
                  label: const Text('Previous'),
                ),
                ElevatedButton.icon(
                  onPressed: _currentQuestionIndex == totalQuestions - 1
                      ? _submitQuiz
                      : _nextQuestion,
                  icon: Icon(
                    _currentQuestionIndex == totalQuestions - 1
                        ? Icons.check_circle
                        : Icons.arrow_forward,
                  ),
                  label: Text(
                    _currentQuestionIndex == totalQuestions - 1
                        ? 'Submit'
                        : 'Next',
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
