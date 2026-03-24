import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';

import '../../domain/entities/lesson.dart';

/// Widget for guided practice mode showing exercise notes with real-time feedback
class PracticeGuide extends StatefulWidget {
  const PracticeGuide({
    super.key,
    required this.lesson,
    this.onNotePressed,
    this.currentNoteIndex = 0,
  });

  final Lesson lesson;
  final void Function(int midiNote)? onNotePressed;
  final int currentNoteIndex;

  @override
  State<PracticeGuide> createState() => _PracticeGuideState();
}

class _PracticeGuideState extends State<PracticeGuide> {
  late int _currentIndex;
  late List<int> _notesToPlay;
  final List<bool> _completedNotes = [];

  @override
  void initState() {
    super.initState();
    _currentIndex = widget.currentNoteIndex;
    _notesToPlay = widget.lesson.content?.highlightedKeys ?? [];
    _completedNotes.addAll(List<bool>.filled(_notesToPlay.length, false));
  }

  void _recordNote(int midiNote) {
    if (_currentIndex >= _notesToPlay.length) return;

    final expectedNote = _notesToPlay[_currentIndex];
    if (midiNote == expectedNote) {
      setState(() {
        _completedNotes[_currentIndex] = true;
        if (_currentIndex < _notesToPlay.length - 1) {
          _currentIndex++;
        }
      });
      widget.onNotePressed?.call(midiNote);
    }
  }

  double get _progress => _completedNotes.isEmpty
      ? 0
      : _completedNotes.where((c) => c).length / _completedNotes.length;

  bool get _isComplete =>
      _completedNotes.isNotEmpty && _completedNotes.every((c) => c);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final content = widget.lesson.content;
    final keyLabels = content?.keyLabels ?? {};

    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // ── Header ────────────────────────────────────────────────────────
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
              'Play the highlighted notes',
              style: theme.textTheme.titleLarge?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),

            // ── Progress bar ──────────────────────────────────────────────────
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: LinearProgressIndicator(
                value: _progress,
                minHeight: 8,
                backgroundColor:
                    theme.colorScheme.outline.withAlpha(30),
                valueColor: AlwaysStoppedAnimation(
                  _isComplete
                      ? Colors.green
                      : theme.colorScheme.primary,
                ),
              ),
            ),
            const SizedBox(height: 8),
            Text(
              '${(_progress * 100).toStringAsFixed(0)}% complete',
              style: theme.textTheme.labelSmall?.copyWith(
                color: theme.colorScheme.primary,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 24),

            // ── Note sequence display ─────────────────────────────────────────
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
                  final noteLabel = keyLabels[note]?.toString() ?? note.toString();

                  return _NoteButton(
                    label: noteLabel,
                    isCompleted: isCompleted,
                    isCurrent: isCurrent,
                    onTap: () => _recordNote(note),
                  );
                }),
              ),
              const SizedBox(height: 24),
            ],

            // ── Keyboard diagram (reference) ───────────────────────────────────
            if (widget.lesson.content?.highlightedKeys.isNotEmpty ?? false) ...[
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: theme.colorScheme.surfaceContainerHighest,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Piano keyboard reference',
                      style: theme.textTheme.labelSmall?.copyWith(
                        color: theme.colorScheme.onSurfaceVariant,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 12),
                    _KeyboardReference(
                      highlightedKeys: widget.lesson.content!.highlightedKeys,
                      keyLabels: keyLabels,
                      completedNotes: _completedNotes,
                      currentNote: _currentIndex < _notesToPlay.length
                          ? _notesToPlay[_currentIndex]
                          : null,
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 24),
            ],

            // ── Instructions ──────────────────────────────────────────────────
            _InstructionCard(theme: theme, isComplete: _isComplete),

            // ── Completion state ──────────────────────────────────────────────
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
                      'Perfect! You\'ve completed this exercise.',
                      style: theme.textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                        color: Colors.green,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'Ready for the next challenge?',
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
    );
  }
}

class _NoteButton extends StatelessWidget {
  const _NoteButton({
    required this.label,
    required this.isCompleted,
    required this.isCurrent,
    required this.onTap,
  });

  final String label;
  final bool isCompleted;
  final bool isCurrent;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
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
      ),
    );
  }
}

class _KeyboardReference extends StatelessWidget {
  const _KeyboardReference({
    required this.highlightedKeys,
    required this.keyLabels,
    required this.completedNotes,
    required this.currentNote,
  });

  final List<int> highlightedKeys;
  final Map<int, String> keyLabels;
  final List<bool> completedNotes;
  final int? currentNote;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: List.generate(
          highlightedKeys.length,
          (i) {
            final midiNote = highlightedKeys[i];
            final isCompleted = i < completedNotes.length && completedNotes[i];
            final isCurrent = midiNote == currentNote;
            final label = keyLabels[midiNote]?.toString() ?? midiNote.toString();

            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 4),
              child: Container(
                width: 48,
                height: 80,
                decoration: BoxDecoration(
                  color: isCompleted
                      ? Colors.green.withAlpha(100)
                      : isCurrent
                          ? theme.colorScheme.primary.withAlpha(150)
                          : theme.colorScheme.surfaceContainerHigh,
                  border: Border.all(
                    color: isCurrent
                        ? theme.colorScheme.primary
                        : isCompleted
                            ? Colors.green
                            : theme.colorScheme.outlineVariant,
                    width: isCurrent ? 2 : 1,
                  ),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Center(
                  child: Text(
                    label,
                    style: theme.textTheme.labelSmall?.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            );
          },
        ),
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
              text: 'Play each note in order (left to right)',
              theme: theme,
            ),
            const SizedBox(height: 10),
            _TipRow(
              icon: HugeIcons.strokeRoundedRepeat,
              text: 'Can\'t get it right? Try again — repetition builds muscle memory',
              theme: theme,
            ),
            const SizedBox(height: 10),
            _TipRow(
              icon: HugeIcons.strokeRoundedThumbsUp,
              text: 'Take your time — accuracy matters more than speed',
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
                    'Well done! Try it again to improve your speed.',
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
