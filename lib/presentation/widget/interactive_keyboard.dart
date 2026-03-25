import 'package:flutter/material.dart';

import '../../core/services/music_service.dart';

enum KeyFeedback {
  none,
  correct,
  incorrect,
  active,
}

/// Interactive piano keyboard widget with visual feedback
/// Adapted from noteflow Piano component
class InteractiveKeyboard extends StatefulWidget {
  const InteractiveKeyboard({
    super.key,
    required this.onNotePressed,
    required this.onNoteReleased,
    this.activeNotes = const {},
    this.feedbackNotes = const {},
    this.startOctave = 3,
    this.octaveCount = 3,
    this.keyHeight = 200,
    this.whiteKeyWidth = 48,
  });

  final Function(int midiNumber) onNotePressed;
  final Function(int midiNumber) onNoteReleased;
  final Set<int> activeNotes;
  final Map<int, KeyFeedback> feedbackNotes;
  final int startOctave;
  final int octaveCount;
  final double keyHeight;
  final double whiteKeyWidth;

  @override
  State<InteractiveKeyboard> createState() => _InteractiveKeyboardState();
}

class _InteractiveKeyboardState extends State<InteractiveKeyboard> {
  static const List<String> whiteKeys = ['C', 'D', 'E', 'F', 'G', 'A', 'B'];
  static const List<String> blackKeys = ['C#', 'D#', 'F#', 'G#', 'A#'];
  static const List<double> blackKeyPositions = [0.37, 0.75, 1.5, 1.88, 2.26];

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      decoration: BoxDecoration(
        color: theme.colorScheme.surface,
        border: Border.all(color: theme.colorScheme.outline),
        borderRadius: BorderRadius.circular(12),
      ),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Stack(
          children: [
            // White keys
            Row(
              children: [
                for (int octave = widget.startOctave;
                    octave < widget.startOctave + widget.octaveCount;
                    octave++)
                  Row(
                    children: [
                      for (String note in whiteKeys)
                        _WhiteKey(
                          note: note,
                          octave: octave,
                          width: widget.whiteKeyWidth,
                          height: widget.keyHeight,
                          isActive: widget.activeNotes
                              .contains(noteToMidiNumber(note, octave)),
                          feedback: widget.feedbackNotes[
                              noteToMidiNumber(note, octave)],
                          onPressed: () => widget.onNotePressed(
                              noteToMidiNumber(note, octave)),
                          onReleased: () => widget.onNoteReleased(
                              noteToMidiNumber(note, octave)),
                          theme: theme,
                        ),
                    ],
                  ),
              ],
            ),

            // Black keys (overlaid)
            Positioned(
              top: 0,
              left: 0,
              child: Row(
                children: [
                  for (int octave = widget.startOctave;
                      octave < widget.startOctave + widget.octaveCount;
                      octave++)
                    Stack(
                      children: [
                        SizedBox(
                          width: whiteKeys.length * widget.whiteKeyWidth,
                          height: widget.keyHeight,
                        ),
                        for (int i = 0; i < blackKeys.length; i++)
                          Positioned(
                            left:
                                (widget.whiteKeyWidth * blackKeyPositions[i]) -
                                    (widget.whiteKeyWidth * 0.25),
                            top: 0,
                            child: _BlackKey(
                              note: blackKeys[i],
                              octave: octave,
                              width: widget.whiteKeyWidth * 0.5,
                              height: widget.keyHeight * 0.6,
                              isActive: widget.activeNotes.contains(
                                  noteToMidiNumber(blackKeys[i], octave)),
                              feedback: widget.feedbackNotes[
                                  noteToMidiNumber(blackKeys[i], octave)],
                              onPressed: () => widget.onNotePressed(
                                  noteToMidiNumber(blackKeys[i], octave)),
                              onReleased: () => widget.onNoteReleased(
                                  noteToMidiNumber(blackKeys[i], octave)),
                              theme: theme,
                            ),
                          ),
                      ],
                    ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _WhiteKey extends StatefulWidget {
  const _WhiteKey({
    required this.note,
    required this.octave,
    required this.width,
    required this.height,
    required this.isActive,
    this.feedback,
    required this.onPressed,
    required this.onReleased,
    required this.theme,
  });

  final String note;
  final int octave;
  final double width;
  final double height;
  final bool isActive;
  final KeyFeedback? feedback;
  final VoidCallback onPressed;
  final VoidCallback onReleased;
  final ThemeData theme;

  @override
  State<_WhiteKey> createState() => _WhiteKeyState();
}

class _WhiteKeyState extends State<_WhiteKey> {
  bool _isPressed = false;

  @override
  Widget build(BuildContext context) {
    Color backgroundColor;
    Color borderColor = widget.theme.colorScheme.outline;
    BoxShadow? shadow;

    if (widget.feedback == KeyFeedback.correct) {
      backgroundColor = Colors.green.shade400;
      borderColor = Colors.green;
      shadow = BoxShadow(
        color: Colors.green.withAlpha(100),
        blurRadius: 8,
      );
    } else if (widget.feedback == KeyFeedback.incorrect) {
      backgroundColor = Colors.red.shade400;
      borderColor = Colors.red;
      shadow = BoxShadow(
        color: Colors.red.withAlpha(100),
        blurRadius: 8,
      );
    } else if (widget.isActive || _isPressed) {
      backgroundColor = Colors.purple.shade200;
      borderColor = Colors.purple;
      shadow = BoxShadow(
        color: Colors.purple.withAlpha(100),
        blurRadius: 8,
      );
    } else {
      backgroundColor = Colors.white;
      borderColor = widget.theme.colorScheme.outline;
    }

    return GestureDetector(
      onTapDown: (_) {
        setState(() => _isPressed = true);
        widget.onPressed();
      },
      onTapUp: (_) {
        setState(() => _isPressed = false);
        widget.onReleased();
      },
      onTapCancel: () {
        setState(() => _isPressed = false);
        widget.onReleased();
      },
      child: Container(
        width: widget.width,
        height: widget.height,
        margin: const EdgeInsets.all(2),
        decoration: BoxDecoration(
          color: backgroundColor,
          border: Border.all(
            color: borderColor,
            width: 2,
          ),
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(8),
            bottomRight: Radius.circular(8),
          ),
          boxShadow: shadow != null ? [shadow] : null,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 8),
              child: Text(
                '${widget.note}${widget.octave}',
                style: TextStyle(
                  fontSize: 10,
                  fontWeight: FontWeight.bold,
                  color: widget.feedback == KeyFeedback.correct ||
                          widget.feedback == KeyFeedback.incorrect
                      ? Colors.white
                      : widget.theme.colorScheme.onSurface,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _BlackKey extends StatefulWidget {
  const _BlackKey({
    required this.note,
    required this.octave,
    required this.width,
    required this.height,
    required this.isActive,
    this.feedback,
    required this.onPressed,
    required this.onReleased,
    required this.theme,
  });

  final String note;
  final int octave;
  final double width;
  final double height;
  final bool isActive;
  final KeyFeedback? feedback;
  final VoidCallback onPressed;
  final VoidCallback onReleased;
  final ThemeData theme;

  @override
  State<_BlackKey> createState() => _BlackKeyState();
}

class _BlackKeyState extends State<_BlackKey> {
  bool _isPressed = false;

  @override
  Widget build(BuildContext context) {
    Color backgroundColor;
    BoxShadow? shadow;

    if (widget.feedback == KeyFeedback.correct) {
      backgroundColor = Colors.green.shade600;
      shadow = BoxShadow(
        color: Colors.green.withAlpha(150),
        blurRadius: 8,
      );
    } else if (widget.feedback == KeyFeedback.incorrect) {
      backgroundColor = Colors.red.shade600;
      shadow = BoxShadow(
        color: Colors.red.withAlpha(150),
        blurRadius: 8,
      );
    } else if (widget.isActive || _isPressed) {
      backgroundColor = Colors.purple.shade700;
      shadow = BoxShadow(
        color: Colors.purple.withAlpha(150),
        blurRadius: 8,
      );
    } else {
      backgroundColor = Colors.black;
    }

    return GestureDetector(
      onTapDown: (_) {
        setState(() => _isPressed = true);
        widget.onPressed();
      },
      onTapUp: (_) {
        setState(() => _isPressed = false);
        widget.onReleased();
      },
      onTapCancel: () {
        setState(() => _isPressed = false);
        widget.onReleased();
      },
      child: Container(
        width: widget.width,
        height: widget.height,
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(4),
            bottomRight: Radius.circular(4),
          ),
          boxShadow: shadow != null ? [shadow] : null,
        ),
        child: Center(
          child: Text(
            widget.note,
            style: const TextStyle(
              fontSize: 8,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
