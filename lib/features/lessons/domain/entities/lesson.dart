enum LessonLevel { beginner, intermediate, advanced }

enum LessonPath { soloist, chords, both }

class Lesson {
  const Lesson({
    required this.id,
    required this.title,
    required this.description,
    required this.level,
    required this.path,
    required this.durationMinutes,
    this.starRating = 0,
    this.isCompleted = false,
  });

  final String id;
  final String title;
  final String description;
  final LessonLevel level;
  final LessonPath path;
  final int durationMinutes;
  final int starRating; // 0–3
  final bool isCompleted;

  Lesson copyWith({
    int? starRating,
    bool? isCompleted,
  }) {
    return Lesson(
      id: id,
      title: title,
      description: description,
      level: level,
      path: path,
      durationMinutes: durationMinutes,
      starRating: starRating ?? this.starRating,
      isCompleted: isCompleted ?? this.isCompleted,
    );
  }
}
