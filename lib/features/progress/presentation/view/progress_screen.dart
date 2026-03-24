import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hugeicons/hugeicons.dart';

import '../../../../data/source/gamification.dart';
import '../../../lessons/domain/entities/lesson.dart';
import '../../../lessons/presentation/providers/lessons_provider.dart';

class ProgressScreen extends ConsumerWidget {
  const ProgressScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final xp = ref.watch(xpProvider);
    final streak = ref.watch(streakProvider);
    final lastDate = ref.watch(lastPracticeDateProvider);
    final lessonsAsync = ref.watch(lessonsProvider);
    final playerLevel = levelForXp(xp);

    return Scaffold(
      appBar: AppBar(
        titleSpacing: 20,
        automaticallyImplyLeading: false,
        title: Text(
          'Progress',
          style: theme.textTheme.titleLarge?.copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.fromLTRB(20, 8, 20, 32),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // --- Stats row: streak, level, XP ---
            _StatsSection(
              theme: theme,
              xp: xp,
              streak: streak,
              playerLevel: playerLevel,
            ),
            const SizedBox(height: 24),
            // --- Practice Calendar ---
            _SectionHeader(
              theme: theme,
              icon: HugeIcons.strokeRoundedChartLineData01,
              label: 'Practice Calendar',
            ),
            const SizedBox(height: 10),
            _PracticeCalendar(theme: theme, lastDate: lastDate),
            const SizedBox(height: 24),
            // --- Courses progress ---
            _SectionHeader(
              theme: theme,
              icon: HugeIcons.strokeRoundedChartLineData01,
              label: 'Courses',
            ),
            const SizedBox(height: 10),
            lessonsAsync.when(
              loading: () => const Center(child: CircularProgressIndicator()),
              error: (e, _) => Text('Error: $e'),
              data: (lessons) =>
                  _CoursesSection(theme: theme, lessons: lessons),
            ),
          ],
        ),
      ),
    );
  }
}

// ---------------------------------------------------------------------------
// Stats section
// ---------------------------------------------------------------------------

class _StatsSection extends StatelessWidget {
  const _StatsSection({
    required this.theme,
    required this.xp,
    required this.streak,
    required this.playerLevel,
  });

  final ThemeData theme;
  final int xp;
  final int streak;
  final PlayerLevel playerLevel;

  @override
  Widget build(BuildContext context) {
    final nextXp = playerLevel.maxXp == -1 ? xp : playerLevel.maxXp + 1;
    final progress = playerLevel.maxXp == -1
        ? 1.0
        : (xp - playerLevel.minXp) / (nextXp - playerLevel.minXp);

    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: theme.colorScheme.surfaceContainerHighest,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Streak + Level row
          Row(
            children: [
              _StatChip(
                theme: theme,
                icon: HugeIcons.strokeRoundedFire,
                label: '$streak day${streak == 1 ? '' : 's'}',
                sublabel: 'Streak',
                color: theme.colorScheme.primary, // unified color
              ),
              const SizedBox(width: 12),
              _StatChip(
                theme: theme,
                icon: HugeIcons.strokeRoundedStar,
                label: 'Level ${playerLevel.level}',
                sublabel: playerLevel.title,
                color: theme.colorScheme.primary,
              ),
            ],
          ),
          const SizedBox(height: 16),
          // XP bar
          Row(
            children: [
              HugeIcon(
                icon: HugeIcons.strokeRoundedZap,
                color: theme.colorScheme.primary,
                size: 16,
              ),
              const SizedBox(width: 6),
              Text(
                playerLevel.maxXp == -1
                    ? '$xp XP — Max Level'
                    : '$xp / ${playerLevel.maxXp + 1} XP',
                style: theme.textTheme.labelMedium?.copyWith(
                  color: theme.colorScheme.primary, // enhanced visibility
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: LinearProgressIndicator(
              value: progress.clamp(0.0, 1.0),
              minHeight: 8,
              backgroundColor: theme.colorScheme.outline.withAlpha(30),
            ),
          ),
        ],
      ),
    );
  }
}

class _StatChip extends StatelessWidget {
  const _StatChip({
    required this.theme,
    required this.icon,
    required this.label,
    required this.sublabel,
    required this.color,
  });

  final ThemeData theme;
  final List<List<dynamic>> icon;
  final String label;
  final String sublabel;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
        decoration: BoxDecoration(
          color: color.withAlpha(20),
          borderRadius: BorderRadius.circular(14),
        ),
        child: Row(
          children: [
            HugeIcon(icon: icon, color: color, size: 20),
            const SizedBox(width: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  label,
                  style: theme.textTheme.titleSmall?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: color,
                  ),
                ),
                Text(
                  sublabel,
                  style: theme.textTheme.labelSmall?.copyWith(
                    color: theme.colorScheme.onSurfaceVariant,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

// ---------------------------------------------------------------------------
// Practice calendar — last 28 days, 4 rows × 7 cols
// ---------------------------------------------------------------------------

class _PracticeCalendar extends StatelessWidget {
  const _PracticeCalendar({required this.theme, required this.lastDate});

  final ThemeData theme;
  final String lastDate;

  @override
  Widget build(BuildContext context) {
    final today = DateTime.now();
    final todayDate = DateTime(today.year, today.month, today.day);

    // Parse last practice date if available
    DateTime? lastPracticed;
    if (lastDate.isNotEmpty) {
      try {
        final p = DateTime.parse(lastDate);
        lastPracticed = DateTime(p.year, p.month, p.day);
      } catch (_) {}
    }

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: theme.colorScheme.surfaceContainerHighest,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Day labels
          Row(
            children: ['M', 'T', 'W', 'T', 'F', 'S', 'S'].map((d) {
              return Expanded(
                child: Center(
                  child: Text(
                    d,
                    style: theme.textTheme.labelSmall?.copyWith(
                      color: theme.colorScheme.onSurfaceVariant,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              );
            }).toList(),
          ),
          const SizedBox(height: 6),
          // 4 rows × 7 cols
          ...List.generate(4, (row) {
            return Padding(
              padding: const EdgeInsets.only(bottom: 6),
              child: Row(
                children: List.generate(7, (col) {
                  final dayOffset = (3 - row) * 7 + (6 - col);
                  final cellDate =
                      todayDate.subtract(Duration(days: dayOffset));
                  final isToday = cellDate == todayDate;
                  final isPracticed =
                      lastPracticed != null && cellDate == lastPracticed;
                  final isFuture = cellDate.isAfter(todayDate);

                  Color bgColor;
                  Color fgColor;
                  if (isFuture) {
                    bgColor = Colors.transparent;
                    fgColor = theme.colorScheme.onSurface.withAlpha(30);
                  } else if (isPracticed || (isToday && isPracticed)) {
                    bgColor = theme.colorScheme.primary;
                    fgColor = theme.colorScheme.onPrimary;
                  } else if (isToday) {
                    bgColor = theme.colorScheme.primary.withAlpha(30);
                    fgColor = theme.colorScheme.primary;
                  } else {
                    bgColor = theme.colorScheme.outline.withAlpha(20);
                    fgColor = theme.colorScheme.onSurface.withAlpha(100);
                  }

                  return Expanded(
                    child: Container(
                      margin: const EdgeInsets.symmetric(horizontal: 2),
                      height: 32,
                      decoration: BoxDecoration(
                        color: bgColor,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Center(
                        child: Text(
                          '${cellDate.day}',
                          style: theme.textTheme.labelSmall?.copyWith(
                            color: fgColor,
                            fontWeight:
                                isToday ? FontWeight.bold : FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                  );
                }),
              ),
            );
          }),
        ],
      ),
    );
  }
}

// ---------------------------------------------------------------------------
// Courses section
// ---------------------------------------------------------------------------

class _CoursesSection extends StatelessWidget {
  const _CoursesSection({required this.theme, required this.lessons});

  final ThemeData theme;
  final List<Lesson> lessons;

  @override
  Widget build(BuildContext context) {
    final beginner =
        lessons.where((l) => l.level == LessonLevel.beginner).toList();
    final intermediate =
        lessons.where((l) => l.level == LessonLevel.intermediate).toList();
    final advanced =
        lessons.where((l) => l.level == LessonLevel.advanced).toList();

    return Column(
      children: [
        _CourseRow(
          theme: theme,
          icon: HugeIcons.strokeRoundedMusicNote01,
          label: 'Beginner',
          lessons: beginner,
        ),
        const SizedBox(height: 10),
        _CourseRow(
          theme: theme,
          icon: HugeIcons.strokeRoundedMusicNote02,
          label: 'Intermediate',
          lessons: intermediate,
        ),
        const SizedBox(height: 10),
        _CourseRow(
          theme: theme,
          icon: HugeIcons.strokeRoundedMusicNote03,
          label: 'Advanced',
          lessons: advanced,
        ),
      ],
    );
  }
}

class _CourseRow extends StatelessWidget {
  const _CourseRow({
    required this.theme,
    required this.icon,
    required this.label,
    required this.lessons,
  });

  final ThemeData theme;
  final List<List<dynamic>> icon;
  final String label;
  final List<Lesson> lessons;

  @override
  Widget build(BuildContext context) {
    final done = lessons.where((l) => l.isCompleted).length;
    final total = lessons.length;
    final progress = total > 0 ? done / total : 0.0;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      decoration: BoxDecoration(
        color: theme.colorScheme.surfaceContainerHighest,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              HugeIcon(
                icon: icon,
                color: theme.colorScheme.primary,
                size: 18,
              ),
              const SizedBox(width: 8),
              Expanded(
                child: Text(
                  label,
                  style: theme.textTheme.titleSmall?.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              Text(
                '$done / $total',
                style: theme.textTheme.labelSmall?.copyWith(
                  color: theme.colorScheme.onSurfaceVariant,
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          ClipRRect(
            borderRadius: BorderRadius.circular(6),
            child: LinearProgressIndicator(
              value: progress,
              minHeight: 6,
              backgroundColor: theme.colorScheme.outline.withAlpha(30),
            ),
          ),
        ],
      ),
    );
  }
}

// ---------------------------------------------------------------------------
// Shared helpers
// ---------------------------------------------------------------------------

class _SectionHeader extends StatelessWidget {
  const _SectionHeader({
    required this.theme,
    required this.icon,
    required this.label,
  });

  final ThemeData theme;
  final List<List<dynamic>> icon;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        HugeIcon(icon: icon, color: theme.colorScheme.primary, size: 16),
        const SizedBox(width: 6),
        Text(
          label,
          style: theme.textTheme.labelSmall?.copyWith(
            color: theme.colorScheme.onSurfaceVariant,
            letterSpacing: 1.5,
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }
}
