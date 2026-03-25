/// Curriculum path structure organizing lessons into learning sequences
enum PathType {
  beginner,
  intermediate,
  advanced,
  specialist, // chord master, scale master, arpeggio master, etc.
}

class CurriculumPath {
  final String id;
  final String title;
  final String description;
  final PathType type;
  final List<String> lessonIds;
  final int estimatedHoursDuration;
  final String targetAudience;
  final List<String> prerequisites;
  final List<String> outcomes;

  const CurriculumPath({
    required this.id,
    required this.title,
    required this.description,
    required this.type,
    required this.lessonIds,
    required this.estimatedHoursDuration,
    required this.targetAudience,
    required this.prerequisites,
    required this.outcomes,
  });

  int get lessonCount => lessonIds.length;
}

class PathProgress {
  final String pathId;
  final String userId;
  final List<String> completedLessonIds;
  final DateTime startedAt;
  final DateTime? completedAt;
  final int totalXpEarned;

  const PathProgress({
    required this.pathId,
    required this.userId,
    required this.completedLessonIds,
    required this.startedAt,
    this.completedAt,
    this.totalXpEarned = 0,
  });

  double get percentageComplete => completedLessonIds.length / (lessonCount ?? 1) * 100;

  int? get lessonCount {
    // This would typically come from the actual path
    // For now return null, should be filled from CurriculumPath
    return null;
  }

  bool get isCompleted => completedAt != null;

  Duration get timeSinceStart => DateTime.now().difference(startedAt);
}
