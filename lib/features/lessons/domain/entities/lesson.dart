enum LessonLevel { beginner, intermediate, advanced }

enum LessonPath { soloist, chords, both }

class LessonContent {
  const LessonContent({
    this.conceptText,
    this.diagramUrl,
    this.highlightedKeys = const [],
    this.keyLabels = const {},
    this.youtubeVideoId,
  });

  /// Short explanation shown on the concept step
  final String? conceptText;

  /// Wikimedia SVG or PNG image URL (optional supplemental diagram)
  final String? diagramUrl;

  /// MIDI note numbers (21–108) to highlight on the keyboard diagram.
  /// e.g. [60, 64, 67] = C major chord (C4, E4, G4)
  final List<int> highlightedKeys;

  /// Optional note name labels for specific keys: {60: 'C', 64: 'E', 67: 'G'}
  final Map<int, String> keyLabels;

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
    this.exerciseType,
    this.exerciseId,
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
  final String? exerciseType; // 'scale', 'chord', 'arpeggio'
  final String? exerciseId; // ID from exercise data (e.g., 'scale-major-C')
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
      exerciseType: exerciseType,
      exerciseId: exerciseId,
      starRating: starRating ?? this.starRating,
      isCompleted: isCompleted ?? this.isCompleted,
    );
  }
}
