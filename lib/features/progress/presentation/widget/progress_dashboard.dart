import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';

import '../../../lessons/domain/entities/lesson.dart';

/// Progress dashboard showing learning analytics and achievements
class ProgressDashboard extends StatelessWidget {
  const ProgressDashboard({
    super.key,
    required this.lessons,
  });

  final List<Lesson> lessons;

  int get _totalLessons => lessons.length;
  int get _completedLessons => lessons.where((l) => l.isCompleted).length;
  int get _totalStars => lessons.fold<int>(0, (sum, l) => sum + l.starRating);

  List<Lesson> get _beginnerLessons =>
      lessons.where((l) => l.level == LessonLevel.beginner).toList();
  List<Lesson> get _intermediateLessons =>
      lessons.where((l) => l.level == LessonLevel.intermediate).toList();
  List<Lesson> get _advancedLessons =>
      lessons.where((l) => l.level == LessonLevel.advanced).toList();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final completionPercentage =
        _totalLessons > 0 ? (_completedLessons / _totalLessons * 100).toInt() : 0;

    return SingleChildScrollView(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // ── Overall progress ──────────────────────────────────────────
          _ProgressCard(
            title: 'Overall Progress',
            percentage: completionPercentage,
            stats: [
              _StatItem('Lessons Completed', '$_completedLessons / $_totalLessons'),
              _StatItem('Total Stars Earned', '$_totalStars / ${_totalLessons * 3}'),
            ],
            theme: theme,
          ),
          const SizedBox(height: 20),

          // ── Level breakdown ────────────────────────────────────────────
          Text(
            'Progress by Level',
            style: theme.textTheme.titleMedium?.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 12),
          _LevelProgressCard(
            level: 'Beginner',
            icon: HugeIcons.strokeRoundedMusicNote01,
            completed: _beginnerLessons.where((l) => l.isCompleted).length,
            total: _beginnerLessons.length,
            theme: theme,
          ),
          const SizedBox(height: 12),
          _LevelProgressCard(
            level: 'Intermediate',
            icon: HugeIcons.strokeRoundedMusicNote02,
            completed: _intermediateLessons.where((l) => l.isCompleted).length,
            total: _intermediateLessons.length,
            theme: theme,
          ),
          const SizedBox(height: 12),
          _LevelProgressCard(
            level: 'Advanced',
            icon: HugeIcons.strokeRoundedMusicNote03,
            completed: _advancedLessons.where((l) => l.isCompleted).length,
            total: _advancedLessons.length,
            theme: theme,
          ),
          const SizedBox(height: 24),

          // ── Learning statistics ────────────────────────────────────────
          Text(
            'Learning Statistics',
            style: theme.textTheme.titleMedium?.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 12),
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: theme.colorScheme.surfaceContainerHigh,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Column(
              children: [
                _StatRow(
                  label: 'Perfect Scores (3 stars)',
                  value:
                      '${lessons.where((l) => l.starRating == 3 && l.isCompleted).length}',
                  icon: HugeIcons.strokeRoundedStar,
                  theme: theme,
                ),
                const SizedBox(height: 12),
                _StatRow(
                  label: 'Good Scores (2 stars)',
                  value:
                      '${lessons.where((l) => l.starRating == 2 && l.isCompleted).length}',
                  icon: HugeIcons.strokeRoundedStar,
                  theme: theme,
                ),
                const SizedBox(height: 12),
                _StatRow(
                  label: 'Learning Progress (1 star)',
                  value:
                      '${lessons.where((l) => l.starRating == 1 && l.isCompleted).length}',
                  icon: HugeIcons.strokeRoundedStar,
                  theme: theme,
                ),
                const SizedBox(height: 12),
                _StatRow(
                  label: 'Not Yet Started',
                  value:
                      '${lessons.where((l) => !l.isCompleted && l.starRating == 0).length}',
                  icon: HugeIcons.strokeRoundedNotification01,
                  theme: theme,
                ),
              ],
            ),
          ),
          const SizedBox(height: 24),

          // ── Achievements ──────────────────────────────────────────────
          Text(
            'Achievements',
            style: theme.textTheme.titleMedium?.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 12),
          _AchievementBadge(
            unlocked: _completedLessons >= 1,
            label: 'First Steps',
            description: 'Complete your first lesson',
            icon: HugeIcons.strokeRoundedMusicNote01,
            theme: theme,
          ),
          const SizedBox(height: 8),
          _AchievementBadge(
            unlocked: _completedLessons >= 5,
            label: 'Beginner Master',
            description: 'Complete 5 lessons',
            icon: HugeIcons.strokeRoundedAward01,
            theme: theme,
          ),
          const SizedBox(height: 8),
          _AchievementBadge(
            unlocked: completionPercentage == 100,
            label: 'Scholar',
            description: 'Complete all available lessons',
            icon: HugeIcons.strokeRoundedBook01,
            theme: theme,
          ),
          const SizedBox(height: 8),
          _AchievementBadge(
            unlocked: _totalStars >= 30,
            label: 'Star Collector',
            description: 'Earn 30 total stars',
            icon: HugeIcons.strokeRoundedStar,
            theme: theme,
          ),
          const SizedBox(height: 8),
          _AchievementBadge(
            unlocked: _advancedLessons.where((l) => l.isCompleted).isNotEmpty,
            label: 'Advanced Player',
            description: 'Complete an advanced lesson',
            icon: HugeIcons.strokeRoundedMusicNote03,
            theme: theme,
          ),
        ],
      ),
    );
  }
}

class _ProgressCard extends StatelessWidget {
  const _ProgressCard({
    required this.title,
    required this.percentage,
    required this.stats,
    required this.theme,
  });

  final String title;
  final int percentage;
  final List<_StatItem> stats;
  final ThemeData theme;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            theme.colorScheme.primary.withAlpha(80),
            theme.colorScheme.primaryContainer.withAlpha(60),
          ],
        ),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: theme.colorScheme.primary.withAlpha(40),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: theme.textTheme.titleMedium?.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              Expanded(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: LinearProgressIndicator(
                    value: percentage / 100,
                    minHeight: 12,
                    backgroundColor: theme.colorScheme.outline.withAlpha(30),
                    valueColor: AlwaysStoppedAnimation(
                      percentage == 100 ? Colors.green : theme.colorScheme.primary,
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 12),
              Text(
                '$percentage%',
                style: theme.textTheme.titleSmall?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          ...stats.map((stat) => Padding(
            padding: const EdgeInsets.only(bottom: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  stat.label,
                  style: theme.textTheme.bodySmall,
                ),
                Text(
                  stat.value,
                  style: theme.textTheme.bodySmall?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          )),
        ],
      ),
    );
  }
}

class _StatItem {
  final String label;
  final String value;

  _StatItem(this.label, this.value);
}

class _LevelProgressCard extends StatelessWidget {
  const _LevelProgressCard({
    required this.level,
    required this.icon,
    required this.completed,
    required this.total,
    required this.theme,
  });

  final String level;
  final List<List<dynamic>> icon;
  final int completed;
  final int total;
  final ThemeData theme;

  @override
  Widget build(BuildContext context) {
    final percentage = total > 0 ? (completed / total * 100).toInt() : 0;

    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: theme.colorScheme.surfaceContainerHigh,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          HugeIcon(icon: icon, color: theme.colorScheme.primary, size: 24),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  level,
                  style: theme.textTheme.labelMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 6),
                ClipRRect(
                  borderRadius: BorderRadius.circular(4),
                  child: LinearProgressIndicator(
                    value: percentage / 100,
                    minHeight: 6,
                    backgroundColor: theme.colorScheme.outline.withAlpha(30),
                    valueColor: AlwaysStoppedAnimation(
                      theme.colorScheme.primary,
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 12),
          Text(
            '$completed/$total',
            style: theme.textTheme.labelSmall?.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}

class _StatRow extends StatelessWidget {
  const _StatRow({
    required this.label,
    required this.value,
    required this.icon,
    required this.theme,
  });

  final String label;
  final String value;
  final List<List<dynamic>> icon;
  final ThemeData theme;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            HugeIcon(icon: icon, size: 16, color: theme.colorScheme.primary),
            const SizedBox(width: 8),
            Text(
              label,
              style: theme.textTheme.bodySmall,
            ),
          ],
        ),
        Text(
          value,
          style: theme.textTheme.bodySmall?.copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}

class _AchievementBadge extends StatelessWidget {
  const _AchievementBadge({
    required this.unlocked,
    required this.label,
    required this.description,
    required this.icon,
    required this.theme,
  });

  final bool unlocked;
  final String label;
  final String description;
  final List<List<dynamic>> icon;
  final ThemeData theme;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: unlocked
            ? theme.colorScheme.primaryContainer.withAlpha(80)
            : theme.colorScheme.surfaceContainerHigh,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: unlocked
              ? theme.colorScheme.primary.withAlpha(60)
              : theme.colorScheme.outline.withAlpha(30),
        ),
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: unlocked
                  ? theme.colorScheme.primary.withAlpha(80)
                  : theme.colorScheme.outline.withAlpha(20),
              borderRadius: BorderRadius.circular(8),
            ),
            child: HugeIcon(
              icon: icon,
              color: unlocked
                  ? theme.colorScheme.primary
                  : theme.colorScheme.onSurfaceVariant,
              size: 20,
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  label,
                  style: theme.textTheme.labelMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: unlocked
                        ? theme.colorScheme.primary
                        : theme.colorScheme.onSurfaceVariant,
                  ),
                ),
                Text(
                  description,
                  style: theme.textTheme.labelSmall?.copyWith(
                    color: theme.colorScheme.onSurfaceVariant,
                  ),
                ),
              ],
            ),
          ),
          if (unlocked)
            HugeIcon(
              icon: HugeIcons.strokeRoundedCheckmarkCircle01,
              color: Colors.green,
              size: 20,
            ),
        ],
      ),
    );
  }
}
