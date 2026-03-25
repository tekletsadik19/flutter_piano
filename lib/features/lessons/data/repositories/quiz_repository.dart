import 'package:shared_preferences/shared_preferences.dart';

import '../../../lessons/domain/entities/quiz.dart';
import '../../../../data/lessons/quiz_database.dart';

abstract class QuizRepository {
  Future<LessonQuiz?> getQuiz(String lessonId);
  Future<List<QuizAttempt>> getAttempts(String lessonId);
  Future<QuizAttempt?> getBestAttempt(String lessonId);
  Future<void> saveAttempt(QuizAttempt attempt);
  Future<int> getAverageScore(String lessonId);
}

class QuizRepositoryImpl implements QuizRepository {
  QuizRepositoryImpl(this._prefs);

  final SharedPreferences _prefs;

  static const String _attemptsPrefix = 'quiz_attempts_';
  static const String _bestScorePrefix = 'quiz_best_score_';

  @override
  Future<LessonQuiz?> getQuiz(String lessonId) async {
    return QuizDatabase.getQuiz(lessonId);
  }

  @override
  Future<List<QuizAttempt>> getAttempts(String lessonId) async {
    final key = '$_attemptsPrefix$lessonId';
    final jsonList = _prefs.getStringList(key) ?? [];
    return jsonList.map((json) => _deserializeAttempt(json)).toList();
  }

  @override
  Future<QuizAttempt?> getBestAttempt(String lessonId) async {
    final key = '$_bestScorePrefix$lessonId';
    final json = _prefs.getString(key);
    if (json == null) return null;
    return _deserializeAttempt(json);
  }

  @override
  Future<void> saveAttempt(QuizAttempt attempt) async {
    // Save to attempts list
    final key = '$_attemptsPrefix${attempt.lessonId}';
    final existing = _prefs.getStringList(key) ?? [];
    existing.add(_serializeAttempt(attempt));
    await _prefs.setStringList(key, existing);

    // Update best score if applicable
    final bestKey = '$_bestScorePrefix${attempt.lessonId}';
    final bestJson = _prefs.getString(bestKey);
    if (bestJson == null || attempt.score > _deserializeAttempt(bestJson).score) {
      await _prefs.setString(bestKey, _serializeAttempt(attempt));
    }
  }

  @override
  Future<int> getAverageScore(String lessonId) async {
    final attempts = await getAttempts(lessonId);
    if (attempts.isEmpty) return 0;
    final total = attempts.fold<int>(0, (sum, a) => sum + a.score);
    return (total / attempts.length).round();
  }

  String _serializeAttempt(QuizAttempt attempt) {
    return '${attempt.id}|${attempt.lessonId}|${attempt.userId}|'
        '${attempt.attemptedAt.toIso8601String()}|'
        '${attempt.selectedAnswers.join(',')}|${attempt.score}|'
        '${attempt.passed}|${attempt.timeTaken.inSeconds}';
  }

  QuizAttempt _deserializeAttempt(String json) {
    final parts = json.split('|');
    return QuizAttempt(
      id: parts[0],
      lessonId: parts[1],
      userId: parts[2],
      attemptedAt: DateTime.parse(parts[3]),
      selectedAnswers: parts[4].split(',').map(int.parse).toList(),
      score: int.parse(parts[5]),
      passed: parts[6] == 'true',
      timeTaken: Duration(seconds: int.parse(parts[7])),
    );
  }
}
