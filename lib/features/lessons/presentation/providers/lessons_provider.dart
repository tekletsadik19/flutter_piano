import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../data/source/settings.dart';
import '../../data/repositories/lesson_repository_impl.dart';
import '../../domain/entities/lesson.dart';
import '../../domain/repositories/lesson_repository.dart';

final lessonRepositoryProvider = FutureProvider<LessonRepository>((ref) async {
  final prefs = await ref.watch(prefsProvider.future);
  return LessonRepositoryImpl(prefs);
});

final lessonsProvider = FutureProvider<List<Lesson>>((ref) async {
  final repo = await ref.watch(lessonRepositoryProvider.future);
  return repo.getLessons();
});

final lessonsByLevelProvider = FutureProvider.family<List<Lesson>, LessonLevel>(
  (ref, level) async {
    final lessons = await ref.watch(lessonsProvider.future);
    return lessons.where((l) => l.level == level).toList();
  },
);
