class ChordExercise {
  final String id;
  final String name;
  final String type; // 'triad', 'seventh'
  final String key; // 'C', 'C#', 'D', etc.
  final String quality; // 'major', 'minor', 'diminished', 'augmented'
  final List<int> midiNotes; // MIDI numbers for the chord notes
  final int difficulty;

  ChordExercise({
    required this.id,
    required this.name,
    required this.type,
    required this.key,
    required this.quality,
    required this.midiNotes,
    required this.difficulty,
  });
}

class ChordData {
  // Chord construction intervals (semitones)
  static const majorTriad = [0, 4, 7]; // Root, Major 3rd, Perfect 5th
  static const minorTriad = [0, 3, 7]; // Root, Minor 3rd, Perfect 5th
  static const diminishedTriad = [0, 3, 6]; // Root, Minor 3rd, Diminished 5th
  static const augmentedTriad = [0, 4, 8]; // Root, Major 3rd, Augmented 5th

  static const majorSeventh = [0, 4, 7, 11]; // Major triad + Major 7th
  static const minorSeventh = [0, 3, 7, 10]; // Minor triad + Minor 7th
  static const dominantSeventh = [0, 4, 7, 10]; // Major triad + Minor 7th

  // MIDI root notes
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

  static List<ChordExercise> get allChords {
    final chords = <ChordExercise>[];

    // Generate all triad chords
    keys.forEach((key, root) {
      chords.add(_createMajorTriad(key, root));
      chords.add(_createMinorTriad(key, root));
      chords.add(_createDiminishedTriad(key, root));
      chords.add(_createAugmentedTriad(key, root));
    });

    // Generate all seventh chords
    keys.forEach((key, root) {
      chords.add(_createMajorSeventh(key, root));
      chords.add(_createMinorSeventh(key, root));
      chords.add(_createDominantSeventh(key, root));
    });

    return chords;
  }

  static ChordExercise _createMajorTriad(String key, int root) {
    final midiNotes = majorTriad.map((i) => root + i).toList();
    return ChordExercise(
      id: 'chord-major-triad-$key',
      name: '$key Major',
      type: 'triad',
      key: key,
      quality: 'major',
      midiNotes: midiNotes,
      difficulty: _getDifficultyForKey(key),
    );
  }

  static ChordExercise _createMinorTriad(String key, int root) {
    final midiNotes = minorTriad.map((i) => root + i).toList();
    return ChordExercise(
      id: 'chord-minor-triad-$key',
      name: '$key Minor',
      type: 'triad',
      key: key,
      quality: 'minor',
      midiNotes: midiNotes,
      difficulty: _getDifficultyForKey(key),
    );
  }

  static ChordExercise _createDiminishedTriad(String key, int root) {
    final midiNotes = diminishedTriad.map((i) => root + i).toList();
    return ChordExercise(
      id: 'chord-diminished-triad-$key',
      name: '$key Diminished',
      type: 'triad',
      key: key,
      quality: 'diminished',
      midiNotes: midiNotes,
      difficulty: _getDifficultyForKey(key) + 1,
    );
  }

  static ChordExercise _createAugmentedTriad(String key, int root) {
    final midiNotes = augmentedTriad.map((i) => root + i).toList();
    return ChordExercise(
      id: 'chord-augmented-triad-$key',
      name: '$key Augmented',
      type: 'triad',
      key: key,
      quality: 'augmented',
      midiNotes: midiNotes,
      difficulty: _getDifficultyForKey(key) + 1,
    );
  }

  static ChordExercise _createMajorSeventh(String key, int root) {
    final midiNotes = majorSeventh.map((i) => root + i).toList();
    return ChordExercise(
      id: 'chord-major-seventh-$key',
      name: '$key Major 7',
      type: 'seventh',
      key: key,
      quality: 'major',
      midiNotes: midiNotes,
      difficulty: _getDifficultyForKey(key) + 1,
    );
  }

  static ChordExercise _createMinorSeventh(String key, int root) {
    final midiNotes = minorSeventh.map((i) => root + i).toList();
    return ChordExercise(
      id: 'chord-minor-seventh-$key',
      name: '$key Minor 7',
      type: 'seventh',
      key: key,
      quality: 'minor',
      midiNotes: midiNotes,
      difficulty: _getDifficultyForKey(key) + 1,
    );
  }

  static ChordExercise _createDominantSeventh(String key, int root) {
    final midiNotes = dominantSeventh.map((i) => root + i).toList();
    return ChordExercise(
      id: 'chord-dominant-seventh-$key',
      name: '$key Dominant 7',
      type: 'seventh',
      key: key,
      quality: 'dominant',
      midiNotes: midiNotes,
      difficulty: _getDifficultyForKey(key) + 1,
    );
  }

  static int _getDifficultyForKey(String key) {
    const beginnerKeys = ['C', 'G', 'D', 'A', 'E', 'F', 'Bb', 'Eb', 'Ab'];
    const intermediateKeys = ['B', 'F#', 'C#'];

    if (beginnerKeys.contains(key)) return 1;
    if (intermediateKeys.contains(key)) return 2;
    return 3;
  }

  static List<ChordExercise> getChordsByDifficulty(int difficulty) {
    return allChords.where((c) => c.difficulty == difficulty).toList();
  }

  static List<ChordExercise> getChordsByType(String type) {
    return allChords.where((c) => c.type == type).toList();
  }

  static List<ChordExercise> getChordsByQuality(String quality) {
    return allChords.where((c) => c.quality == quality).toList();
  }
}
