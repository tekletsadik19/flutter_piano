import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';

import '../../core/services/note_detection_service.dart';

/// Widget displaying real-time practice feedback
class PracticeFeedback extends StatelessWidget {
  const PracticeFeedback({
    super.key,
    required this.stats,
    this.showDetailedMetrics = true,
  });

  final PracticeSessionStats stats;
  final bool showDetailedMetrics;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final accuracy = stats.accuracyPercentage;

    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Overall accuracy score
          Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  _getAccuracyColor(accuracy).withAlpha(80),
                  _getAccuracyColor(accuracy).withAlpha(40),
                ],
              ),
              borderRadius: BorderRadius.circular(16),
              border: Border.all(
                color: _getAccuracyColor(accuracy),
                width: 2,
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Accuracy',
                      style: theme.textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 8,
                      ),
                      decoration: BoxDecoration(
                        color: _getAccuracyColor(accuracy).withAlpha(100),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Text(
                        '${accuracy.toStringAsFixed(1)}%',
                        style: theme.textTheme.titleSmall?.copyWith(
                          fontWeight: FontWeight.bold,
                          color: _getAccuracyColor(accuracy),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 12),
                ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: LinearProgressIndicator(
                    value: accuracy / 100,
                    minHeight: 8,
                    backgroundColor: theme.colorScheme.outline.withAlpha(30),
                    valueColor: AlwaysStoppedAnimation(
                      _getAccuracyColor(accuracy),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),

          // Quick stats
          Row(
            children: [
              _StatBox(
                label: 'Notes',
                value: stats.playedNotes.length.toString(),
                icon: HugeIcons.strokeRoundedMusicNote01,
                theme: theme,
              ),
              const SizedBox(width: 12),
              _StatBox(
                label: 'Perfect',
                value: stats.accuracyCounts[NoteAccuracy.perfect].toString(),
                icon: HugeIcons.strokeRoundedCheckmarkCircle01,
                theme: theme,
                color: Colors.green,
              ),
              const SizedBox(width: 12),
              _StatBox(
                label: 'Close',
                value: stats.accuracyCounts[NoteAccuracy.close].toString(),
                icon: HugeIcons.strokeRoundedAlertCircle,
                theme: theme,
                color: Colors.orange,
              ),
            ],
          ),
          const SizedBox(height: 20),

          // Detailed metrics
          if (showDetailedMetrics) ...[
            Text(
              'Performance Metrics',
              style: theme.textTheme.titleSmall?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 12),
            _MetricRow(
              label: 'Average Confidence',
              value: '${(stats.averageConfidence * 100).toStringAsFixed(0)}%',
              theme: theme,
            ),
            _MetricRow(
              label: 'Notes per Minute',
              value: stats.notesPerMinute.toStringAsFixed(1),
              theme: theme,
            ),
            _MetricRow(
              label: 'Session Duration',
              value: _formatDuration(stats.duration),
              theme: theme,
            ),
            const SizedBox(height: 20),

            // Accuracy breakdown
            Text(
              'Accuracy Breakdown',
              style: theme.textTheme.titleSmall?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 12),
            _AccuracyBar(
              label: 'Perfect',
              count: stats.accuracyCounts[NoteAccuracy.perfect] ?? 0,
              total: stats.playedNotes.length,
              color: Colors.green,
              theme: theme,
            ),
            _AccuracyBar(
              label: 'Close',
              count: stats.accuracyCounts[NoteAccuracy.close] ?? 0,
              total: stats.playedNotes.length,
              color: Colors.orange,
              theme: theme,
            ),
            _AccuracyBar(
              label: 'Incorrect',
              count: stats.accuracyCounts[NoteAccuracy.incorrect] ?? 0,
              total: stats.playedNotes.length,
              color: Colors.red,
              theme: theme,
            ),
            const SizedBox(height: 20),

            // Weak notes
            if (stats.getWeakNotes().isNotEmpty) ...[
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.orange.withAlpha(20),
                  border: Border.all(
                    color: Colors.orange.withAlpha(100),
                  ),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        HugeIcon(
                          icon: HugeIcons.strokeRoundedAlertCircle,
                          color: Colors.orange,
                          size: 20,
                        ),
                        const SizedBox(width: 8),
                        Text(
                          'Areas for Improvement',
                          style: theme.textTheme.titleSmall?.copyWith(
                            fontWeight: FontWeight.bold,
                            color: Colors.orange,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 12),
                    Text(
                      'Focus on these notes in your next practice session',
                      style: theme.textTheme.bodySmall,
                    ),
                  ],
                ),
              ),
            ],
          ],
        ],
      ),
    );
  }

  Color _getAccuracyColor(double accuracy) {
    if (accuracy >= 90) return Colors.green;
    if (accuracy >= 75) return Colors.blue;
    if (accuracy >= 60) return Colors.orange;
    return Colors.red;
  }

  String _formatDuration(Duration duration) {
    final minutes = duration.inMinutes;
    final seconds = (duration.inSeconds % 60).toString().padLeft(2, '0');
    return '$minutes:$seconds';
  }
}

class _StatBox extends StatelessWidget {
  const _StatBox({
    required this.label,
    required this.value,
    required this.icon,
    required this.theme,
    this.color,
  });

  final String label;
  final String value;
  final List<List<dynamic>> icon;
  final ThemeData theme;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: theme.colorScheme.surfaceContainerHigh,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: (color ?? theme.colorScheme.primary).withAlpha(50),
          ),
        ),
        child: Column(
          children: [
            HugeIcon(
              icon: icon,
              color: color ?? theme.colorScheme.primary,
              size: 20,
            ),
            const SizedBox(height: 8),
            Text(
              value,
              style: theme.textTheme.titleSmall?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              label,
              style: theme.textTheme.labelSmall?.copyWith(
                color: theme.colorScheme.onSurfaceVariant,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _MetricRow extends StatelessWidget {
  const _MetricRow({
    required this.label,
    required this.value,
    required this.theme,
  });

  final String label;
  final String value;
  final ThemeData theme;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: theme.textTheme.bodySmall,
          ),
          Text(
            value,
            style: theme.textTheme.bodySmall?.copyWith(
              fontWeight: FontWeight.bold,
              color: theme.colorScheme.primary,
            ),
          ),
        ],
      ),
    );
  }
}

class _AccuracyBar extends StatelessWidget {
  const _AccuracyBar({
    required this.label,
    required this.count,
    required this.total,
    required this.color,
    required this.theme,
  });

  final String label;
  final int count;
  final int total;
  final Color color;
  final ThemeData theme;

  @override
  Widget build(BuildContext context) {
    final percentage = total > 0 ? (count / total) : 0.0;

    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                label,
                style: theme.textTheme.labelSmall,
              ),
              Text(
                '$count / $total',
                style: theme.textTheme.labelSmall?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          const SizedBox(height: 6),
          ClipRRect(
            borderRadius: BorderRadius.circular(4),
            child: LinearProgressIndicator(
              value: percentage,
              minHeight: 6,
              backgroundColor: theme.colorScheme.outline.withAlpha(30),
              valueColor: AlwaysStoppedAnimation(color),
            ),
          ),
        ],
      ),
    );
  }
}
