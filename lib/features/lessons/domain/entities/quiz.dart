/// Quiz and assessment entities for lesson comprehension testing
enum QuestionType {
  multipleChoice,
  trueOrFalse,
  matching,
  fillInTheBlank,
}

class QuizQuestion {
  final String id;
  final String lessonId;
  final String question;
  final QuestionType type;
  final List<String> options;
  final int correctAnswerIndex;
  final String explanation;
  final int points;

  const QuizQuestion({
    required this.id,
    required this.lessonId,
    required this.question,
    required this.type,
    required this.options,
    required this.correctAnswerIndex,
    required this.explanation,
    this.points = 10,
  });
}

class LessonQuiz {
  final String lessonId;
  final String title;
  final String description;
  final List<QuizQuestion> questions;
  final int passingScore;

  const LessonQuiz({
    required this.lessonId,
    required this.title,
    required this.description,
    required this.questions,
    this.passingScore = 70,
  });

  int get totalPoints => questions.fold<int>(0, (sum, q) => sum + q.points);
}

class QuizAttempt {
  final String id;
  final String lessonId;
  final String userId;
  final DateTime attemptedAt;
  final List<int> selectedAnswers;
  final int score;
  final bool passed;
  final Duration timeTaken;

  const QuizAttempt({
    required this.id,
    required this.lessonId,
    required this.userId,
    required this.attemptedAt,
    required this.selectedAnswers,
    required this.score,
    required this.passed,
    required this.timeTaken,
  });

  double get percentage => (score / 100) * 100;
}
