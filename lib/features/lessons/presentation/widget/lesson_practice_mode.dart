import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hugeicons/hugeicons.dart';

import '../../domain/entities/lesson.dart';

/// Real practice mode that integrates with the actual piano
/// Users play notes on the piano, progress is tracked in real-time
class LessonPracticeMode extends StatefulWidget {
  const LessonPracticeMode({
    super.key,
    required this.lesson,
    this.onComplete,
  });

  final Lesson lesson;
  final VoidCallback? onComplete;

  @override
  State<LessonPracticeMode> createState() => _LessonPracticeModeState();
}

class _LessonPracticeModeState extends State<LessonPracticeMode> {
  late List<int> _notesToPlay;
  late List<bool> _completedNotes;
  int _currentIndex = 0;
  int _attempts = 0;
  final List<int> _playedNotes = [];

  @override
  void initState() {
    super.initState();
    _notesToPlay = widget.lesson.content?.highlightedKeys ?? [];
    _completedNotes = List<bool>.filled(_notesToPlay.length, false);
  }

  /// Called when a note is played on the piano
  void recordNotePressed(int midiNote) {
    if (_currentIndex >= _notesToPlay.length) return;

    _playedNotes.add(midiNote);
    _attempts++;

    final expectedNote = _notesToPlay[_currentIndex];
    if (midiNote == expectedNote) {
      // Correct note!
      setState(() {
        _completedNotes[_currentIndex] = true;
        if (_currentIndex < _notesToPlay.length - 1) {
          _currentIndex++;
        }
      });

      // Haptic feedback
      HapticFeedback.mediumImpact();
    } else {
      // Wrong note - visual feedback
      HapticFeedback.lightImpact();
      setState(() {}); // Trigger rebuild for error state
    }
  }

  double get _progress => _completedNotes.isEmpty
      ? 0
      : _completedNotes.where((c) => c).length / _completedNotes.length;

  bool get _isComplete =>
      _completedNotes.isNotEmpty && _completedNotes.every((c) => c);

  void _reset() {
    setState(() {
      _currentIndex = 0;
      _attempts = 0;
      _playedNotes.clear();
      _completedNotes = List<bool>.filled(_notesToPlay.length, false);
    });
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final content = widget.lesson.content;
    final keyLabels = content?.keyLabels ?? {};

    return Column(
      children: [
        // ── Header ────────────────────────────────────────────────────────
        Expanded(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'PRACTICE',
                  style: theme.textTheme.labelSmall?.copyWith(
                    color: theme.colorScheme.primary,
                    letterSpacing: 1.5,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 6),
                Text(
                  'Play the highlighted notes on the piano below',
                  style: theme.textTheme.titleLarge?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 16),

                // ── Progress bar ──────────────────────────────────────────
                ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: LinearProgressIndicator(
                    value: _progress,
                    minHeight: 8,
                    backgroundColor: theme.colorScheme.outline.withAlpha(30),
                    valueColor: AlwaysStoppedAnimation(
                      _isComplete ? Colors.green : theme.colorScheme.primary,
                    ),
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  '${(_progress * 100).toStringAsFixed(0)}% complete • $_attempts attempts',
                  style: theme.textTheme.labelSmall?.copyWith(
                    color: theme.colorScheme.primary,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 20),

                // ── Note sequence display ─────────────────────────────────
                if (_notesToPlay.isNotEmpty) ...[
                  Text(
                    'Notes to play:',
                    style: theme.textTheme.labelSmall?.copyWith(
                      color: theme.colorScheme.onSurfaceVariant,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 12),
                  Wrap(
                    spacing: 8,
                    runSpacing: 8,
                    children: List.generate(_notesToPlay.length, (i) {
                      final note = _notesToPlay[i];
                      final isCompleted = _completedNotes[i];
                      final isCurrent = i == _currentIndex;
                      final noteLabel =
                          keyLabels[note]?.toString() ?? note.toString();

                      return _NoteButton(
                        label: noteLabel,
                        isCompleted: isCompleted,
                        isCurrent: isCurrent,
                      );
                    }),
                  ),
                  const SizedBox(height: 24),
                ],

                // ── Instructions ──────────────────────────────────────────
                _InstructionCard(theme: theme, isComplete: _isComplete),

                // ── Completion state ──────────────────────────────────────
                if (_isComplete) ...[
                  const SizedBox(height: 24),
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: Colors.green.withAlpha(25),
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(color: Colors.green.withAlpha(100)),
                    ),
                    child: Column(
                      children: [
                        HugeIcon(
                          icon: HugeIcons.strokeRoundedCheckmarkCircle01,
                          size: 48,
                          color: Colors.green,
                        ),
                        const SizedBox(height: 12),
                        Text(
                          'Perfect! You completed the exercise.',
                          style: theme.textTheme.titleMedium?.copyWith(
                            fontWeight: FontWeight.bold,
                            color: Colors.green,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(height: 8),
                        Text(
                          'Completed in $_attempts attempts',
                          style: theme.textTheme.bodySmall?.copyWith(
                            color: theme.colorScheme.onSurfaceVariant,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),
                ],

                const SizedBox(height: 24),
              ],
            ),
          ),
        ),

        // ── Piano section ─────────────────────────────────────────────────
        Container(
          color: theme.colorScheme.surfaceContainer,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 16, 20, 12),
                child: Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Now playing',
                            style: theme.textTheme.labelSmall?.copyWith(
                              color: theme.colorScheme.onSurfaceVariant,
                            ),
                          ),
                          Text(
                            _currentIndex < _notesToPlay.length
                                ? keyLabels[_notesToPlay[_currentIndex]]
                                        ?.toString() ??
                                    'Done'
                                : 'Complete!',
                            style: theme.textTheme.titleMedium?.copyWith(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                    if (_isComplete)
                      OutlinedButton.icon(
                        onPressed: _reset,
                        icon: HugeIcon(
                          icon: HugeIcons.strokeRoundedRepeat,
                          size: 16,
                          color: theme.colorScheme.primary,
                        ),
                        label: const Text('Try Again'),
                        style: OutlinedButton.styleFrom(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 16, vertical: 12),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12)),
                        ),
                      ),
                  ],
                ),
              ),
              // ── Embedded piano ────────────────────────────────────────
              SizedBox(
                height: 200,
                child: _PianoForPractice(
                  highlightedKeys: _notesToPlay,
                  currentKey: _currentIndex < _notesToPlay.length
                      ? _notesToPlay[_currentIndex]
                      : null,
                  completedKeys: _completedNotes
                      .asMap()
                      .entries
                      .where((e) => e.value)
                      .map((e) => _notesToPlay[e.key])
                      .toList(),
                  onNotePressed: recordNotePressed,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _NoteButton extends StatelessWidget {
  const _NoteButton({
    required this.label,
    required this.isCompleted,
    required this.isCurrent,
  });

  final String label;
  final bool isCompleted;
  final bool isCurrent;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      decoration: BoxDecoration(
        color: isCompleted
            ? Colors.green.withAlpha(80)
            : isCurrent
                ? theme.colorScheme.primary.withAlpha(200)
                : theme.colorScheme.surfaceContainer,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: isCurrent
              ? theme.colorScheme.primary
              : isCompleted
                  ? Colors.green
                  : theme.colorScheme.outline.withAlpha(40),
          width: isCurrent ? 2 : 1,
        ),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (isCompleted)
            Padding(
              padding: const EdgeInsets.only(right: 6),
              child: HugeIcon(
                icon: HugeIcons.strokeRoundedCheckmarkCircle01,
                size: 14,
                color: Colors.green,
              ),
            ),
          Text(
            label,
            style: theme.textTheme.labelMedium?.copyWith(
              fontWeight: FontWeight.w600,
              color: isCompleted ? Colors.green : theme.colorScheme.onSurface,
            ),
          ),
        ],
      ),
    );
  }
}

class _InstructionCard extends StatelessWidget {
  const _InstructionCard({
    required this.theme,
    required this.isComplete,
  });

  final ThemeData theme;
  final bool isComplete;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: theme.colorScheme.primaryContainer.withAlpha(60),
        borderRadius: BorderRadius.circular(14),
        border: Border.all(
          color: theme.colorScheme.primary.withAlpha(40),
        ),
      ),
      child: Column(
        children: [
          if (!isComplete) ...[
            _TipRow(
              icon: HugeIcons.strokeRoundedMusicNote01,
              text: 'Press each note on the piano below in order',
              theme: theme,
            ),
            const SizedBox(height: 10),
            _TipRow(
              icon: HugeIcons.strokeRoundedRepeat,
              text: 'Wrong note? Try again — no penalty, just practice',
              theme: theme,
            ),
          ] else ...[
            Row(
              children: [
                HugeIcon(
                  icon: HugeIcons.strokeRoundedStar,
                  size: 18,
                  color: theme.colorScheme.primary,
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: Text(
                    'Try again to improve your speed and accuracy.',
                    style: theme.textTheme.bodySmall?.copyWith(
                      height: 1.4,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ],
      ),
    );
  }
}

class _TipRow extends StatelessWidget {
  const _TipRow({
    required this.icon,
    required this.text,
    required this.theme,
  });

  final List<List<dynamic>> icon;
  final String text;
  final ThemeData theme;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        HugeIcon(icon: icon, size: 16, color: theme.colorScheme.primary),
        const SizedBox(width: 10),
        Expanded(
          child: Text(
            text,
            style: theme.textTheme.bodySmall?.copyWith(height: 1.4),
          ),
        ),
      ],
    );
  }
}

/// Simplified piano widget for practice mode
/// Shows only the relevant keys and highlights the current note to play
class _PianoForPractice extends StatelessWidget {
  const _PianoForPractice({
    required this.highlightedKeys,
    required this.currentKey,
    required this.completedKeys,
    required this.onNotePressed,
  });

  final List<int> highlightedKeys;
  final int? currentKey;
  final List<int> completedKeys;
  final void Function(int) onNotePressed;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: List.generate(highlightedKeys.length, (i) {
          final midiNote = highlightedKeys[i];
          final isCurrent = midiNote == currentKey;
          final isCompleted = completedKeys.contains(midiNote);

          return GestureDetector(
            onTap: () => onNotePressed(midiNote),
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 150),
              margin: const EdgeInsets.symmetric(horizontal: 4, vertical: 12),
              width: 56,
              height: 140,
              decoration: BoxDecoration(
                color: isCompleted
                    ? Colors.green.withAlpha(150)
                    : isCurrent
                        ? theme.colorScheme.primary.withAlpha(200)
                        : theme.colorScheme.surfaceContainerHigh,
                border: Border.all(
                  color: isCurrent
                      ? theme.colorScheme.primary
                      : isCompleted
                          ? Colors.green
                          : theme.colorScheme.outlineVariant,
                  width: isCurrent ? 3 : 1,
                ),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Material(
                color: Colors.transparent,
                child: InkWell(
                  onTap: () => onNotePressed(midiNote),
                  borderRadius: BorderRadius.circular(8),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      if (isCurrent)
                        HugeIcon(
                          icon: HugeIcons.strokeRoundedArrowDown01,
                          color: theme.colorScheme.primary,
                          size: 20,
                        ),
                      const SizedBox(height: 8),
                      Text(
                        highlightedKeys[i].toString(),
                        style: theme.textTheme.bodySmall?.copyWith(
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        }),
      ),
    );
  }
}
