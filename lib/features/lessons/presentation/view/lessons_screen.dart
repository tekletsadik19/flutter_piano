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

class _SearchBar extends StatefulWidget {
  const _SearchBar({required this.onSearch});
  final void Function(String) onSearch;

  @override
  State<_SearchBar> createState() => _SearchBarState();
}

class _SearchBarState extends State<_SearchBar> {
  late TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
    _controller.addListener(() => widget.onSearch(_controller.text));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 16, 20, 12),
      child: TextField(
        controller: _controller,
        decoration: InputDecoration(
          hintText: 'Search lessons...',
          hintStyle: theme.textTheme.bodyMedium?.copyWith(
            color: theme.colorScheme.onSurfaceVariant,
          ),
          prefixIcon: HugeIcon(
            icon: HugeIcons.strokeRoundedSearch01,
            color: theme.colorScheme.onSurfaceVariant,
            size: 20,
          ),
          suffixIcon: _controller.text.isNotEmpty
              ? GestureDetector(
                  onTap: () {
                    _controller.clear();
                    FocusScope.of(context).unfocus();
                  },
                  child: HugeIcon(
                    icon: HugeIcons.strokeRoundedCancel01,
                    color: theme.colorScheme.onSurfaceVariant,
                    size: 20,
                  ),
                )
              : null,
          contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide(color: theme.colorScheme.outline),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide(color: theme.colorScheme.outline.withAlpha(60)),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide(color: theme.colorScheme.primary),
          ),
        ),
      ),
    );
  }
}

class _LessonsBody extends StatefulWidget {
  const _LessonsBody({required this.lessons});
  final List<Lesson> lessons;

  @override
  State<_LessonsBody> createState() => _LessonsBodyState();
}

class _LessonsBodyState extends State<_LessonsBody> {
  String _searchQuery = '';

  List<Lesson> _filterLessons(List<Lesson> lessons) {
    if (_searchQuery.isEmpty) return lessons;
    return lessons
        .where((l) =>
            l.title.toLowerCase().contains(_searchQuery.toLowerCase()) ||
            l.description.toLowerCase().contains(_searchQuery.toLowerCase()))
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final filtered = _filterLessons(widget.lessons);
    final beginner = filtered.where((l) => l.level == LessonLevel.beginner).toList();
    final intermediate = filtered.where((l) => l.level == LessonLevel.intermediate).toList();
    final advanced = filtered.where((l) => l.level == LessonLevel.advanced).toList();
    final totalDone = widget.lessons.where((l) => l.isCompleted).length;
    final hasResults = beginner.isNotEmpty || intermediate.isNotEmpty || advanced.isNotEmpty;

    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: _SearchBar(
            onSearch: (query) => setState(() => _searchQuery = query),
          ),
        ),
        if (_searchQuery.isEmpty)
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(20, 8, 20, 20),
              child: _ProgressSummary(
                theme: theme,
                done: totalDone,
                total: widget.lessons.length,
              ),
            ),
          ),
        if (!hasResults && _searchQuery.isNotEmpty)
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(32),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  HugeIcon(
                    icon: HugeIcons.strokeRoundedSearch01,
                    size: 48,
                    color: theme.colorScheme.onSurfaceVariant.withAlpha(100),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    'No lessons found',
                    style: theme.textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Try searching for a different term',
                    style: theme.textTheme.bodySmall?.copyWith(
                      color: theme.colorScheme.onSurfaceVariant,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          )
        else ...[
          if (beginner.isNotEmpty)
            _LevelSection(
              title: 'Beginner',
              icon: HugeIcons.strokeRoundedMusicNote01,
              lessons: beginner,
            ),
          if (intermediate.isNotEmpty)
            _LevelSection(
              title: 'Intermediate',
              icon: HugeIcons.strokeRoundedMusicNote02,
              lessons: intermediate,
            ),
          if (advanced.isNotEmpty)
            _LevelSection(
              title: 'Advanced',
              icon: HugeIcons.strokeRoundedMusicNote03,
              lessons: advanced,
            ),
          const SliverToBoxAdapter(child: SizedBox(height: 32)),
        ],
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
