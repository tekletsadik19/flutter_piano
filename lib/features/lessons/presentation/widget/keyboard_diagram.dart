import 'package:flutter/material.dart';

/// Renders a 2-octave piano keyboard (C3–B4, MIDI 48–71) with optional
/// highlighted keys and labels. Inspired by sightread's piano.ts canvas logic.
class KeyboardDiagram extends StatelessWidget {
  const KeyboardDiagram({
    super.key,
    this.highlightedKeys = const [],
    this.keyLabels = const {},
    this.startMidi = 48,
    this.endMidi = 71,
  });

  /// MIDI note numbers to highlight (e.g. [60, 64, 67] = C major chord)
  final List<int> highlightedKeys;

  /// Optional labels per MIDI note number, e.g. {60: 'C', 64: 'E'}
  final Map<int, String> keyLabels;

  /// First MIDI note shown (default 48 = C3)
  final int startMidi;

  /// Last MIDI note shown (default 71 = B4)
  final int endMidi;

  @override
  Widget build(BuildContext context) {
    final primary = Theme.of(context).colorScheme.primary;
    return LayoutBuilder(
      builder: (_, constraints) {
        final width = constraints.maxWidth;
        return SizedBox(
          width: width,
          height: width * 0.28,
          child: CustomPaint(
            painter: _KeyboardPainter(
              highlightedKeys: highlightedKeys,
              keyLabels: keyLabels,
              startMidi: startMidi,
              endMidi: endMidi,
              highlightColor: primary,
            ),
          ),
        );
      },
    );
  }
}

// ── Painter ───────────────────────────────────────────────────────────────────

const _blackIndices = {1, 3, 6, 8, 10};

bool _isBlack(int midi) => _blackIndices.contains(midi % 12);
bool _isWhite(int midi) => !_isBlack(midi);

class _KeyboardPainter extends CustomPainter {
  const _KeyboardPainter({
    required this.highlightedKeys,
    required this.keyLabels,
    required this.startMidi,
    required this.endMidi,
    required this.highlightColor,
  });

  final List<int> highlightedKeys;
  final Map<int, String> keyLabels;
  final int startMidi;
  final int endMidi;
  final Color highlightColor;

  @override
  void paint(Canvas canvas, Size size) {
    final highlighted = Set<int>.from(highlightedKeys);

    // Count white keys
    int whiteCount = 0;
    for (int n = startMidi; n <= endMidi; n++) {
      if (_isWhite(n)) whiteCount++;
    }

    if (whiteCount == 0) return;

    final whiteW = size.width / whiteCount;
    final whiteH = size.height;
    final blackW = whiteW * 0.6;
    final blackH = whiteH * 0.62;
    const radius = Radius.circular(3);

    final whitePaint = Paint()..color = Colors.white;
    final whiteHighPaint = Paint()..color = highlightColor.withAlpha(220);
    final blackPaint = Paint()..color = const Color(0xFF1A1A2E);
    final blackHighPaint = Paint()..color = highlightColor;
    final borderPaint = Paint()
      ..color = const Color(0xFFCCCCCC)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1;

    // ── White keys ────────────────────────────────────────────────────────────
    int whiteIdx = 0;
    final List<(int, double)> whitePositions = []; // (midi, left)

    for (int n = startMidi; n <= endMidi; n++) {
      if (!_isWhite(n)) continue;
      final left = whiteIdx * whiteW;
      whitePositions.add((n, left));

      final isHigh = highlighted.contains(n);
      final rr = RRect.fromLTRBR(
        left + 0.5,
        0,
        left + whiteW - 0.5,
        whiteH,
        radius,
      );
      canvas.drawRRect(rr, isHigh ? whiteHighPaint : whitePaint);
      canvas.drawRRect(rr, borderPaint);

      // Label
      final label = keyLabels[n];
      if (label != null || isHigh) {
        _drawLabel(
          canvas,
          label ?? _noteName(n),
          left + whiteW / 2,
          whiteH - 14,
          isHigh ? Colors.white : highlightColor,
          isHigh ? FontWeight.bold : FontWeight.w500,
          10,
        );
      }

      whiteIdx++;
    }

    // ── Black keys ────────────────────────────────────────────────────────────
    whiteIdx = 0;
    int whiteTrack = 0;

    for (int n = startMidi; n <= endMidi; n++) {
      if (_isBlack(n)) {
        // Black key sits between the previous and next white key.
        // Its center x = previous white key right edge.
        final prevWhiteRight = whiteTrack * whiteW;
        final left = prevWhiteRight - blackW / 2;

        final isHigh = highlighted.contains(n);
        final rr = RRect.fromLTRBR(
          left,
          0,
          left + blackW,
          blackH,
          radius,
        );
        canvas.drawRRect(rr, isHigh ? blackHighPaint : blackPaint);

        if (isHigh) {
          final label = keyLabels[n] ?? _noteName(n);
          _drawLabel(canvas, label, left + blackW / 2, blackH - 12,
              Colors.white, FontWeight.bold, 8);
        }
      } else {
        whiteTrack++;
      }
    }
  }

  void _drawLabel(Canvas canvas, String text, double cx, double cy,
      Color color, FontWeight weight, double fontSize) {
    final tp = TextPainter(
      text: TextSpan(
        text: text,
        style: TextStyle(
          color: color,
          fontSize: fontSize,
          fontWeight: weight,
          fontFamily: 'Outfit',
        ),
      ),
      textDirection: TextDirection.ltr,
    )..layout();
    tp.paint(canvas, Offset(cx - tp.width / 2, cy - tp.height / 2));
  }

  String _noteName(int midi) {
    const names = ['C', 'C♯', 'D', 'D♯', 'E', 'F', 'F♯', 'G', 'G♯', 'A', 'A♯', 'B'];
    return names[midi % 12];
  }

  @override
  bool shouldRepaint(_KeyboardPainter old) =>
      old.highlightedKeys != highlightedKeys ||
      old.keyLabels != keyLabels ||
      old.highlightColor != highlightColor;
}
