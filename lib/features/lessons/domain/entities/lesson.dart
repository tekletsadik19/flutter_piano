enum LessonLevel { beginner, intermediate, advanced }

enum LessonPath { soloist, chords, both }

class LessonContent {
  const LessonContent({
    this.conceptText,
    this.diagramUrl,
    this.audioUrl,
    this.youtubeVideoId,
  });

  /// Short explanation shown on the concept step
  final String? conceptText;

  /// Wikimedia SVG or PNG image URL
  final String? diagramUrl;

  /// Musopen / mfiles MP3 URL for the demo listen step
  final String? audioUrl;

  /// YouTube video ID for the watch step (Hoffman Academy etc.)
  final String? youtubeVideoId;
}

class Lesson {
  const Lesson({
    required this.id,
    required this.title,
    required this.description,
    required this.level,
    required this.path,
    required this.durationMinutes,
    this.content,
    this.starRating = 0,
    this.isCompleted = false,
  });

  final String id;
  final String title;
  final String description;
  final LessonLevel level;
  final LessonPath path;
  final int durationMinutes;
  final LessonContent? content;
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
      content: content,
      starRating: starRating ?? this.starRating,
      isCompleted: isCompleted ?? this.isCompleted,
    );
  }
}
