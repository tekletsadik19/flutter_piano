class ScaleExercise {
  final String id;
  final String name;
  final String type; // 'major', 'minor_natural', 'minor_melodic'
  final String key; // 'C', 'C#', 'D', 'Eb', etc.
  final List<int> midiNotes; // MIDI numbers for the scale
  final List<String> romanNumerals; // Scale degrees (I, ii, iii, etc.)
  final int difficulty; // 1-3 (beginner to advanced)

  ScaleExercise({
    required this.id,
    required this.name,
    required this.type,
    required this.key,
    required this.midiNotes,
    required this.romanNumerals,
    required this.difficulty,
  });
}

// Major Scale Intervals: W-W-H-W-W-W-H (whole and half steps)
const _majorScaleIntervals = [0, 2, 4, 5, 7, 9, 11, 12];
const _majorRomanNumerals = ['I', 'ii', 'iii', 'IV', 'V', 'vi', 'viiº', 'I'];

// Minor Natural Scale Intervals: W-H-W-W-H-W-W
const _minorNaturalIntervals = [0, 2, 3, 5, 7, 8, 10, 12];
const _minorNaturalRomanNumerals = ['i', 'iiº', 'III', 'iv', 'v', 'VI', 'VII', 'i'];

// Minor Melodic Scale Intervals: W-H-W-W-W-W-H
const _minorMelodicIntervals = [0, 2, 3, 5, 7, 9, 11, 12];
const _minorMelodicRomanNumerals = ['i', 'iiº', 'III+', 'IV', 'V', 'viº', 'viiº', 'i'];

// MIDI root notes for each key
const _majorScaleRoots = {
  'C': 48,
  'C#': 49,
  'D': 50,
  'Eb': 51,
  'E': 52,
  'F': 53,
  'F#': 54,
  'G': 55,
  'Ab': 56,
  'A': 57,
  'Bb': 58,
  'B': 59,
};

const _minorNaturalRoots = {
  'C': 48,
  'C#': 49,
  'D': 50,
  'Eb': 51,
  'E': 52,
  'F': 53,
  'F#': 54,
  'G': 55,
  'Ab': 56,
  'A': 57,
  'Bb': 58,
  'B': 59,
};

const _minorMelodicRoots = {
  'C': 48,
  'C#': 49,
  'D': 50,
  'Eb': 51,
  'E': 52,
  'F': 53,
  'F#': 54,
  'G': 55,
  'Ab': 56,
  'A': 57,
  'Bb': 58,
  'B': 59,
};

class ScaleData {
  static List<ScaleExercise> get allScales {
    final scales = <ScaleExercise>[];

    // Generate all major scales
    _majorScaleRoots.forEach((key, root) {
      scales.add(_createMajorScale(key, root));
    });

    // Generate all minor natural scales
    _minorNaturalRoots.forEach((key, root) {
      scales.add(_createMinorNaturalScale(key, root));
    });

    // Generate all minor melodic scales
    _minorMelodicRoots.forEach((key, root) {
      scales.add(_createMinorMelodicScale(key, root));
    });

    return scales;
  }

  static ScaleExercise _createMajorScale(String key, int root) {
    final midiNotes = _majorScaleIntervals.map((i) => root + i).toList();
    return ScaleExercise(
      id: 'scale-major-$key',
      name: '$key Major',
      type: 'major',
      key: key,
      midiNotes: midiNotes,
      romanNumerals: _majorRomanNumerals,
      difficulty: _getDifficultyForKey(key),
    );
  }

  static ScaleExercise _createMinorNaturalScale(String key, int root) {
    final midiNotes = _minorNaturalIntervals.map((i) => root + i).toList();
    return ScaleExercise(
      id: 'scale-minor-natural-$key',
      name: '$key Minor (Natural)',
      type: 'minor_natural',
      key: key,
      midiNotes: midiNotes,
      romanNumerals: _minorNaturalRomanNumerals,
      difficulty: _getDifficultyForKey(key),
    );
  }

  static ScaleExercise _createMinorMelodicScale(String key, int root) {
    final midiNotes = _minorMelodicIntervals.map((i) => root + i).toList();
    return ScaleExercise(
      id: 'scale-minor-melodic-$key',
      name: '$key Minor (Melodic)',
      type: 'minor_melodic',
      key: key,
      midiNotes: midiNotes,
      romanNumerals: _minorMelodicRomanNumerals,
      difficulty: _getDifficultyForKey(key),
    );
  }

  /// Difficulty increases for keys with more sharps/flats
  /// Beginner: C, G, D, A, E, F, Bb, Eb, Ab
  /// Intermediate: B, F#, Db, Gb, Cb, C#
  static int _getDifficultyForKey(String key) {
    const beginnerKeys = ['C', 'G', 'D', 'A', 'E', 'F', 'Bb', 'Eb', 'Ab'];
    const intermediateKeys = ['B', 'F#', 'C#'];

    if (beginnerKeys.contains(key)) return 1;
    if (intermediateKeys.contains(key)) return 2;
    return 3;
  }

  /// Get scales by difficulty level
  static List<ScaleExercise> getScalesByDifficulty(int difficulty) {
    return allScales.where((s) => s.difficulty == difficulty).toList();
  }

  /// Get all scales of a specific type
  static List<ScaleExercise> getScalesByType(String type) {
    return allScales.where((s) => s.type == type).toList();
  }

  /// Circle of Fifths for progression exercises
  static const circleOfFifths = [
    'C', 'G', 'D', 'A', 'E', 'B', 'F#',
    'C#', 'G#', 'D#', 'A#', 'F',
  ];
}
