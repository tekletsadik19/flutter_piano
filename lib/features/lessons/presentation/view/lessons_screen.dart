import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hugeicons/hugeicons.dart';

import '../../domain/entities/lesson.dart';
import '../providers/lessons_provider.dart';
import '../widget/lesson_card.dart';
import 'lesson_detail_screen.dart';

class LessonsScreen extends ConsumerWidget {
  const LessonsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final lessonsAsync = ref.watch(lessonsProvider);
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        titleSpacing: 20,
        automaticallyImplyLeading: false,
        title: Text(
          'Lessons',
          style: theme.textTheme.titleLarge?.copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: lessonsAsync.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (e, _) => Center(child: Text('Error: $e')),
        data: (lessons) => _LessonsBody(lessons: lessons),
      ),
    );
  }
}

class _LessonsBody extends StatelessWidget {
  const _LessonsBody({required this.lessons});
  final List<Lesson> lessons;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final beginner = lessons.where((l) => l.level == LessonLevel.beginner).toList();
    final intermediate = lessons.where((l) => l.level == LessonLevel.intermediate).toList();
    final advanced = lessons.where((l) => l.level == LessonLevel.advanced).toList();
    final totalDone = lessons.where((l) => l.isCompleted).length;

    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(20, 8, 20, 20),
            child: _ProgressSummary(
              theme: theme,
              done: totalDone,
              total: lessons.length,
            ),
          ),
        ),
        _LevelSection(
          title: 'Beginner',
          icon: HugeIcons.strokeRoundedMusicNote01,
          lessons: beginner,
        ),
        _LevelSection(
          title: 'Intermediate',
          icon: HugeIcons.strokeRoundedMusicNote02,
          lessons: intermediate,
        ),
        _LevelSection(
          title: 'Advanced',
          icon: HugeIcons.strokeRoundedMusicNote03,
          lessons: advanced,
        ),
        const SliverToBoxAdapter(child: SizedBox(height: 32)),
      ],
    );
  }
}

class _ProgressSummary extends StatelessWidget {
  const _ProgressSummary({
    required this.theme,
    required this.done,
    required this.total,
  });

  final ThemeData theme;
  final int done;
  final int total;

  @override
  Widget build(BuildContext context) {
    final progress = total > 0 ? done / total : 0.0;
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: theme.colorScheme.surfaceContainerHighest,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Your Progress',
                style: theme.textTheme.titleSmall?.copyWith(
                  fontWeight: FontWeight.w600,
                ),
              ),
              Text(
                '$done / $total lessons',
                style: theme.textTheme.labelSmall?.copyWith(
                  color: theme.colorScheme.onSurfaceVariant,
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: LinearProgressIndicator(
              value: progress,
              minHeight: 6,
              backgroundColor: theme.colorScheme.outline.withAlpha(30),
            ),
          ),
          const SizedBox(height: 6),
          Text(
            '${(progress * 100).toInt()}% complete',
            style: theme.textTheme.labelSmall?.copyWith(
              color: theme.colorScheme.primary,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}

class _LevelSection extends StatelessWidget {
  const _LevelSection({
    required this.title,
    required this.icon,
    required this.lessons,
  });

  final String title;
  final List<List<dynamic>> icon;
  final List<Lesson> lessons;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final done = lessons.where((l) => l.isCompleted).length;

    return SliverToBoxAdapter(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 4, 20, 8),
            child: Row(
              children: [
                HugeIcon(
                  icon: icon,
                  color: theme.colorScheme.primary,
                  size: 16,
                ),
                const SizedBox(width: 6),
                Text(
                  title,
                  style: theme.textTheme.titleSmall?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Spacer(),
                Text(
                  '$done / ${lessons.length}',
                  style: theme.textTheme.labelSmall?.copyWith(
                    color: theme.colorScheme.onSurfaceVariant,
                  ),
                ),
              ],
            ),
          ),
          ...lessons.map((l) => LessonCard(
                lesson: l,
                onTap: () => Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (_) => LessonDetailScreen(lesson: l),
                  ),
                ),
              )),
          const SizedBox(height: 16),
        ],
      ),
    );
  }
}
