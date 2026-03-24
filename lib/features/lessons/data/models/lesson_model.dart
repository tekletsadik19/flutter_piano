import '../../domain/entities/lesson.dart';

class LessonModel extends Lesson {
  const LessonModel({
    required super.id,
    required super.title,
    required super.description,
    required super.level,
    required super.path,
    required super.durationMinutes,
    super.content,
    super.exerciseType,
    super.exerciseId,
    super.starRating = 0,
    super.isCompleted = false,
  });

  LessonModel copyWithProgress({
    required int starRating,
    required bool isCompleted,
  }) {
    return LessonModel(
      id: id,
      title: title,
      description: description,
      level: level,
      path: path,
      durationMinutes: durationMinutes,
      content: content,
      exerciseType: exerciseType,
      exerciseId: exerciseId,
      starRating: starRating,
      isCompleted: isCompleted,
    );
  }
}
