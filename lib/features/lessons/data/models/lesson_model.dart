import '../../domain/entities/lesson.dart';

class LessonModel extends Lesson {
  const LessonModel({
    required super.id,
    required super.title,
    required super.description,
    required super.level,
    required super.path,
    required super.durationMinutes,
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
      starRating: starRating,
      isCompleted: isCompleted,
    );
  }

  factory LessonModel.fromJson(Map<String, dynamic> json) {
    return LessonModel(
      id: json['id'] as String,
      title: json['title'] as String,
      description: json['description'] as String,
      level: LessonLevel.values.firstWhere((e) => e.name == json['level']),
      path: LessonPath.values.firstWhere((e) => e.name == json['path']),
      durationMinutes: json['duration_minutes'] as int,
      starRating: json['star_rating'] as int? ?? 0,
      isCompleted: json['is_completed'] as bool? ?? false,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'level': level.name,
      'path': path.name,
      'duration_minutes': durationMinutes,
      'star_rating': starRating,
      'is_completed': isCompleted,
    };
  }
}
