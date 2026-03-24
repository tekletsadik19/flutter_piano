class ArpeggioExercise {
  final String id;
  final String name;
  final String chordType; // 'major', 'minor', 'diminished', 'augmented', 'seventh'
  final String key;
  final List<int> midiNotes; // Arpeggio pattern spanning 2+ octaves
  final int difficulty;
  final String pattern; // 'ascending', 'descending', 'wave'

  ArpeggioExercise({
    required this.id,
    required this.name,
    required this.chordType,
    required this.key,
    required this.midiNotes,
    required this.difficulty,
    required this.pattern,
  });
}

class ArpeggioData {
  static const keys = {
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

  static List<ArpeggioExercise> get allArpeggios {
    final arpeggios = <ArpeggioExercise>[];

    keys.forEach((key, root) {
      // Major arpeggios
      arpeggios.add(_createMajorAscending(key, root));
      arpeggios.add(_createMajorDescending(key, root));
      arpeggios.add(_createMajorWave(key, root));

      // Minor arpeggios
      arpeggios.add(_createMinorAscending(key, root));
      arpeggios.add(_createMinorDescending(key, root));
      arpeggios.add(_createMinorWave(key, root));

      // Seventh arpeggios
      arpeggios.add(_createSeventhAscending(key, root));
      arpeggios.add(_createSeventhDescending(key, root));
    });

    return arpeggios;
  }

  static ArpeggioExercise _createMajorAscending(String key, int root) {
    // Root, 3rd, 5th, octave, 3rd, 5th, octave
    final midiNotes = [root, root + 4, root + 7, root + 12, root + 16, root + 19, root + 24];
    return ArpeggioExercise(
      id: 'arpeggio-major-asc-$key',
      name: '$key Major Ascending',
      chordType: 'major',
      key: key,
      midiNotes: midiNotes,
      difficulty: _getDifficultyForKey(key),
      pattern: 'ascending',
    );
  }

  static ArpeggioExercise _createMajorDescending(String key, int root) {
    final midiNotes = [root + 24, root + 19, root + 16, root + 12, root + 7, root + 4, root];
    return ArpeggioExercise(
      id: 'arpeggio-major-desc-$key',
      name: '$key Major Descending',
      chordType: 'major',
      key: key,
      midiNotes: midiNotes,
      difficulty: _getDifficultyForKey(key),
      pattern: 'descending',
    );
  }

  static ArpeggioExercise _createMajorWave(String key, int root) {
    // Up and down pattern
    final midiNotes = [
      root, root + 4, root + 7, root + 12, // Up
      root + 19, root + 16, root + 12, root + 7, root + 4, root // Down
    ];
    return ArpeggioExercise(
      id: 'arpeggio-major-wave-$key',
      name: '$key Major Wave',
      chordType: 'major',
      key: key,
      midiNotes: midiNotes,
      difficulty: _getDifficultyForKey(key) + 1,
      pattern: 'wave',
    );
  }

  static ArpeggioExercise _createMinorAscending(String key, int root) {
    // Root, b3rd, 5th, octave, b3rd, 5th, octave
    final midiNotes = [root, root + 3, root + 7, root + 12, root + 15, root + 19, root + 24];
    return ArpeggioExercise(
      id: 'arpeggio-minor-asc-$key',
      name: '$key Minor Ascending',
      chordType: 'minor',
      key: key,
      midiNotes: midiNotes,
      difficulty: _getDifficultyForKey(key),
      pattern: 'ascending',
    );
  }

  static ArpeggioExercise _createMinorDescending(String key, int root) {
    final midiNotes = [root + 24, root + 19, root + 15, root + 12, root + 7, root + 3, root];
    return ArpeggioExercise(
      id: 'arpeggio-minor-desc-$key',
      name: '$key Minor Descending',
      chordType: 'minor',
      key: key,
      midiNotes: midiNotes,
      difficulty: _getDifficultyForKey(key),
      pattern: 'descending',
    );
  }

  static ArpeggioExercise _createMinorWave(String key, int root) {
    final midiNotes = [
      root, root + 3, root + 7, root + 12, // Up
      root + 19, root + 15, root + 12, root + 7, root + 3, root // Down
    ];
    return ArpeggioExercise(
      id: 'arpeggio-minor-wave-$key',
      name: '$key Minor Wave',
      chordType: 'minor',
      key: key,
      midiNotes: midiNotes,
      difficulty: _getDifficultyForKey(key) + 1,
      pattern: 'wave',
    );
  }

  static ArpeggioExercise _createSeventhAscending(String key, int root) {
    // Root, 3rd, 5th, 7th, octave
    final midiNotes = [root, root + 4, root + 7, root + 11, root + 12, root + 16];
    return ArpeggioExercise(
      id: 'arpeggio-seventh-asc-$key',
      name: '$key Seventh Ascending',
      chordType: 'seventh',
      key: key,
      midiNotes: midiNotes,
      difficulty: _getDifficultyForKey(key) + 1,
      pattern: 'ascending',
    );
  }

  static ArpeggioExercise _createSeventhDescending(String key, int root) {
    final midiNotes = [root + 16, root + 12, root + 11, root + 7, root + 4, root];
    return ArpeggioExercise(
      id: 'arpeggio-seventh-desc-$key',
      name: '$key Seventh Descending',
      chordType: 'seventh',
      key: key,
      midiNotes: midiNotes,
      difficulty: _getDifficultyForKey(key) + 1,
      pattern: 'descending',
    );
  }

  static int _getDifficultyForKey(String key) {
    const beginnerKeys = ['C', 'G', 'D', 'A', 'E', 'F', 'Bb', 'Eb', 'Ab'];
    const intermediateKeys = ['B', 'F#', 'C#'];

    if (beginnerKeys.contains(key)) return 1;
    if (intermediateKeys.contains(key)) return 2;
    return 3;
  }

  static List<ArpeggioExercise> getArpeggiosByDifficulty(int difficulty) {
    return allArpeggios.where((a) => a.difficulty == difficulty).toList();
  }

  static List<ArpeggioExercise> getArpeggiosByType(String chordType) {
    return allArpeggios.where((a) => a.chordType == chordType).toList();
  }

  static List<ArpeggioExercise> getArpeggiosByPattern(String pattern) {
    return allArpeggios.where((a) => a.pattern == pattern).toList();
  }
}
