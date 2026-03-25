import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';

import '../../domain/entities/quiz.dart';

class QuizResultsScreen extends StatelessWidget {
  const QuizResultsScreen({
    super.key,
    required this.attempt,
    required this.quiz,
    required this.onRetake,
    required this.onExit,
  });

  final QuizAttempt attempt;
  final LessonQuiz quiz;
  final VoidCallback onRetake;
  final VoidCallback onExit;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final percentage = attempt.score;
    final isPassing = attempt.passed;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Quiz Results'),
        centerTitle: true,
        automaticallyImplyLeading: false,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 20),

            // Large score display
            Container(
              width: 200,
              height: 200,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: isPassing
                    ? Colors.green.withAlpha(20)
                    : Colors.orange.withAlpha(20),
                border: Border.all(
                  color: isPassing ? Colors.green : Colors.orange,
                  width: 4,
                ),
              ),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      '$percentage%',
                      style: theme.textTheme.displayMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                        color: isPassing ? Colors.green : Colors.orange,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      isPassing ? 'PASSED' : 'NEEDS IMPROVEMENT',
                      style: theme.textTheme.labelMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                        color: isPassing ? Colors.green : Colors.orange,
                        letterSpacing: 1,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 40),

            // Stats row
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _StatCard(
                  label: 'Passing Score',
                  value: '${quiz.passingScore}%',
                  icon: HugeIcons.strokeRoundedTarget01,
                  theme: theme,
                ),
                _StatCard(
                  label: 'Your Score',
                  value: '$percentage%',
                  icon: HugeIcons.strokeRoundedAward01,
                  theme: theme,
                ),
              ],
            ),
            const SizedBox(height: 24),

            // Questions breakdown
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: theme.colorScheme.surfaceContainerHigh,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Performance Breakdown',
                    style: theme.textTheme.titleSmall?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 12),
                  _BreakdownItem(
                    label: 'Total Questions',
                    value: quiz.questions.length.toString(),
                    theme: theme,
                  ),
                  _BreakdownItem(
                    label: 'Correct Answers',
                    value: _getCorrectCount().toString(),
                    theme: theme,
                  ),
                  _BreakdownItem(
                    label: 'Incorrect Answers',
                    value: (quiz.questions.length - _getCorrectCount()).toString(),
                    theme: theme,
                  ),
                  _BreakdownItem(
                    label: 'Time Taken',
                    value: _formatDuration(attempt.timeTaken),
                    theme: theme,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),

            // Feedback message
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: isPassing
                    ? Colors.green.withAlpha(20)
                    : Colors.orange.withAlpha(20),
                border: Border.all(
                  color: isPassing ? Colors.green : Colors.orange,
                ),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                children: [
                  Text(
                    isPassing
                        ? 'Congratulations! 🎉'
                        : 'Keep Practicing! 💪',
                    style: theme.textTheme.titleSmall?.copyWith(
                      fontWeight: FontWeight.bold,
                      color: isPassing ? Colors.green : Colors.orange,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    isPassing
                        ? 'You have mastered this lesson content. '
                            'Move on to the next lesson or practice more advanced material.'
                        : 'Review the lesson content and try again. '
                            'Pay special attention to the areas where you had difficulty.',
                    style: theme.textTheme.bodySmall?.copyWith(
                      height: 1.5,
                      color: theme.colorScheme.onSurfaceVariant,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 32),

            // Action buttons
            Column(
              children: [
                SizedBox(
                  width: double.infinity,
                  height: 48,
                  child: ElevatedButton(
                    onPressed: onExit,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: theme.colorScheme.primary,
                    ),
                    child: Text(
                      'Back to Lesson',
                      style: theme.textTheme.labelLarge?.copyWith(
                        color: theme.colorScheme.onPrimary,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 12),
                SizedBox(
                  width: double.infinity,
                  height: 48,
                  child: OutlinedButton(
                    onPressed: onRetake,
                    child: const Text('Retake Quiz'),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  int _getCorrectCount() {
    int correct = 0;
    for (int i = 0; i < quiz.questions.length; i++) {
      if (attempt.selectedAnswers[i] == quiz.questions[i].correctAnswerIndex) {
        correct++;
      }
    }
    return correct;
  }

  String _formatDuration(Duration duration) {
    final minutes = duration.inMinutes;
    final seconds = duration.inSeconds % 60;
    return '$minutes:${seconds.toString().padLeft(2, '0')}';
  }
}

class _StatCard extends StatelessWidget {
  const _StatCard({
    required this.label,
    required this.value,
    required this.icon,
    required this.theme,
  });

  final String label;
  final String value;
  final List<List<dynamic>> icon;
  final ThemeData theme;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: theme.colorScheme.surfaceContainerHigh,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        children: [
          HugeIcon(
            icon: icon,
            color: theme.colorScheme.primary,
            size: 28,
          ),
          const SizedBox(height: 8),
          Text(
            label,
            style: theme.textTheme.labelSmall?.copyWith(
              color: theme.colorScheme.onSurfaceVariant,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            value,
            style: theme.textTheme.titleMedium?.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}

class _BreakdownItem extends StatelessWidget {
  const _BreakdownItem({
    required this.label,
    required this.value,
    required this.theme,
  });

  final String label;
  final String value;
  final ThemeData theme;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: theme.textTheme.bodySmall,
          ),
          Text(
            value,
            style: theme.textTheme.bodySmall?.copyWith(
              fontWeight: FontWeight.bold,
              color: theme.colorScheme.primary,
            ),
          ),
        ],
      ),
    );
  }
}
