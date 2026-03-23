import '../entities/lesson.dart';

abstract class LessonRepository {
  List<Lesson> getLessons();
  Lesson? getLessonById(String id);
  void saveProgress(String id, {required int starRating, required bool isCompleted});
}
