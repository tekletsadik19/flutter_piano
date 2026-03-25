import 'package:flutter/foundation.dart';

/// Real-time note detection and performance analysis service
/// Adapted from pianalyze and piano-trainer approaches

enum NoteAccuracy {
  perfect, // Correct note
  close, // Within 1-2 semitones
  incorrect, // Wrong note
}

enum TimingAccuracy {
  onTime, // Within expected timing window
  early, // Played too early
  late, // Played too late
}

/// Represents a single note played during practice
class PlayedNote {
  final int midiNumber;
  final int expectedMidiNumber;
  final DateTime timestamp;
  final DateTime? expectedTimestamp;
  final int velocity;

  PlayedNote({
    required this.midiNumber,
    required this.expectedMidiNumber,
    required this.timestamp,
    this.expectedTimestamp,
    this.velocity = 64, // Default MIDI velocity
  });

  /// Analyze pitch accuracy of this note
  NoteAccuracy get pitchAccuracy {
    final difference = (midiNumber - expectedMidiNumber).abs();
    if (difference == 0) {
      return NoteAccuracy.perfect;
    } else if (difference <= 2) {
      return NoteAccuracy.close;
    }
    return NoteAccuracy.incorrect;
  }

  /// Analyze timing accuracy of this note
  TimingAccuracy getTimingAccuracy({
    int toleranceMs = 150, // 150ms tolerance window
  }) {
    if (expectedTimestamp == null) {
      return TimingAccuracy.onTime;
    }

    final timeDiff = timestamp.difference(expectedTimestamp!).inMilliseconds;

    if (timeDiff.abs() <= toleranceMs) {
      return TimingAccuracy.onTime;
    } else if (timeDiff < 0) {
      return TimingAccuracy.early;
    } else {
      return TimingAccuracy.late;
    }
  }

  /// Confidence score (0.0 - 1.0) based on accuracy
  double get confidenceScore {
    double score = 1.0;

    // Reduce score based on pitch error
    final pitchError = (midiNumber - expectedMidiNumber).abs();
    score -= (pitchError * 0.1);

    // Bonus for high velocity control
    if (velocity > 100) {
      score += 0.05;
    }

    return score.clamp(0.0, 1.0);
  }

  @override
  String toString() =>
      'PlayedNote(midi: $midiNumber, expected: $expectedMidiNumber, accuracy: $pitchAccuracy)';
}

/// Session statistics for practice tracking
class PracticeSessionStats {
  final List<PlayedNote> playedNotes;
  final DateTime sessionStart;
  DateTime? sessionEnd;

  PracticeSessionStats({
    required this.sessionStart,
    List<PlayedNote>? initialNotes,
  }) : playedNotes = initialNotes ?? [];

  /// Add a note to the session
  void addNote(PlayedNote note) {
    playedNotes.add(note);
  }

  /// End the session
  void endSession() {
    sessionEnd = DateTime.now();
  }

  /// Calculate total accuracy percentage
  double get accuracyPercentage {
    if (playedNotes.isEmpty) return 0.0;

    final correctNotes = playedNotes
        .where((n) => n.pitchAccuracy == NoteAccuracy.perfect)
        .length;

    return (correctNotes / playedNotes.length) * 100;
  }

  /// Count notes by accuracy
  Map<NoteAccuracy, int> get accuracyCounts {
    return {
      NoteAccuracy.perfect:
          playedNotes.where((n) => n.pitchAccuracy == NoteAccuracy.perfect).length,
      NoteAccuracy.close:
          playedNotes.where((n) => n.pitchAccuracy == NoteAccuracy.close).length,
      NoteAccuracy.incorrect:
          playedNotes.where((n) => n.pitchAccuracy == NoteAccuracy.incorrect).length,
    };
  }

  /// Count notes by timing
  Map<TimingAccuracy, int> getTimingCounts({int toleranceMs = 150}) {
    return {
      TimingAccuracy.onTime: playedNotes
          .where((n) => n.getTimingAccuracy(toleranceMs: toleranceMs) == TimingAccuracy.onTime)
          .length,
      TimingAccuracy.early: playedNotes
          .where((n) => n.getTimingAccuracy(toleranceMs: toleranceMs) == TimingAccuracy.early)
          .length,
      TimingAccuracy.late: playedNotes
          .where((n) => n.getTimingAccuracy(toleranceMs: toleranceMs) == TimingAccuracy.late)
          .length,
    };
  }

  /// Average confidence across all notes
  double get averageConfidence {
    if (playedNotes.isEmpty) return 0.0;
    final sum = playedNotes.fold<double>(0, (sum, n) => sum + n.confidenceScore);
    return sum / playedNotes.length;
  }

  /// Session duration
  Duration get duration {
    final end = sessionEnd ?? DateTime.now();
    return end.difference(sessionStart);
  }

  /// Notes per minute (practice speed)
  double get notesPerMinute {
    final minutes = duration.inSeconds / 60;
    if (minutes == 0) return 0;
    return playedNotes.length / minutes;
  }

  /// Identify weak areas (notes with low accuracy)
  List<int> getWeakNotes({double accuracyThreshold = 0.6}) {
    final midiCounts = <int, int>{};
    final midiAccuracy = <int, double>{};

    for (final note in playedNotes) {
      midiCounts[note.expectedMidiNumber] =
          (midiCounts[note.expectedMidiNumber] ?? 0) + 1;

      midiAccuracy[note.expectedMidiNumber] =
          (midiAccuracy[note.expectedMidiNumber] ?? 1.0);

      if (note.pitchAccuracy != NoteAccuracy.perfect) {
        midiAccuracy[note.expectedMidiNumber] =
            midiAccuracy[note.expectedMidiNumber]! * 0.8;
      }
    }

    return midiAccuracy.entries
        .where((e) => e.value < accuracyThreshold)
        .map((e) => e.key)
        .toList();
  }

  @override
  String toString() =>
      'PracticeSessionStats(notes: ${playedNotes.length}, accuracy: ${accuracyPercentage.toStringAsFixed(1)}%)';
}

/// Service for detecting and analyzing played notes
class NoteDetectionService extends ChangeNotifier {
  final List<PlayedNote> _recentNotes = [];
  PracticeSessionStats? _currentSession;

  /// Get recent played notes (last N notes)
  List<PlayedNote> getRecentNotes({int count = 10}) {
    return _recentNotes.skip((_recentNotes.length - count).clamp(0, _recentNotes.length)).toList();
  }

  /// Record a note being played
  void noteDetected(int midiNumber, {int expectedMidi = -1, int velocity = 64}) {
    final playedNote = PlayedNote(
      midiNumber: midiNumber,
      expectedMidiNumber: expectedMidi >= 0 ? expectedMidi : midiNumber,
      timestamp: DateTime.now(),
      velocity: velocity,
    );

    _recentNotes.add(playedNote);
    _currentSession?.addNote(playedNote);

    // Keep only last 100 notes in memory
    if (_recentNotes.length > 100) {
      _recentNotes.removeAt(0);
    }

    notifyListeners();
  }

  /// Start a new practice session
  void startSession() {
    _currentSession = PracticeSessionStats(sessionStart: DateTime.now());
    _recentNotes.clear();
    notifyListeners();
  }

  /// End current session and get statistics
  PracticeSessionStats? endSession() {
    _currentSession?.endSession();
    final stats = _currentSession;
    _currentSession = null;
    notifyListeners();
    return stats;
  }

  /// Get current session statistics
  PracticeSessionStats? get currentSession => _currentSession;

  /// Analyze a sequence of expected notes vs played notes
  Map<String, dynamic> analyzePerformance(
    List<int> expectedSequence,
    List<int> playedSequence,
  ) {
    int correctCount = 0;
    int closeCount = 0;

    for (int i = 0; i < expectedSequence.length && i < playedSequence.length; i++) {
      final difference = (playedSequence[i] - expectedSequence[i]).abs();
      if (difference == 0) {
        correctCount++;
      } else if (difference <= 2) {
        closeCount++;
      }
    }

    return {
      'accuracy': (correctCount / expectedSequence.length) * 100,
      'closeAccuracy': ((correctCount + closeCount) / expectedSequence.length) * 100,
      'correct': correctCount,
      'close': closeCount,
      'incorrect': expectedSequence.length - correctCount - closeCount,
    };
  }

  /// Clear all data
  void clear() {
    _recentNotes.clear();
    _currentSession = null;
    notifyListeners();
  }
}
