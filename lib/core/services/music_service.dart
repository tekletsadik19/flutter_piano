import 'dart:math';

/// Music theory and note handling service
/// Adapted from piano-trainer chord and note services

const int octaveLength = 12;
const int scaleLength = 8;

// MIDI note mappings
const Map<String, int> noteToMidi = {
  'C': 0, 'C#': 1, 'Db': 1,
  'D': 2, 'D#': 3, 'Eb': 3,
  'E': 4, 'Fb': 4,
  'F': 5, 'E#': 5, 'F#': 6, 'Gb': 6,
  'G': 7, 'G#': 8, 'Ab': 8,
  'A': 9, 'A#': 10, 'Bb': 10,
  'B': 11, 'Cb': 11,
};

const Map<int, String> midiToNote = {
  0: 'C', 1: 'C#', 2: 'D', 3: 'D#', 4: 'E', 5: 'F',
  6: 'F#', 7: 'G', 8: 'G#', 9: 'A', 10: 'A#', 11: 'B',
};

/// Normalize note names by handling enharmonic equivalents
String normalizeNote(String noteName) {
  switch (noteName.toLowerCase()) {
    case 'db':
      return 'c#';
    case 'eb':
      return 'd#';
    case 'gb':
      return 'f#';
    case 'ab':
      return 'g#';
    case 'bb':
      return 'a#';
    case 'cb':
      return 'b';
    case 'e#':
      return 'f';
    case 'b#':
      return 'c';
    case 'fb':
      return 'e';
    default:
      return noteName.toLowerCase();
  }
}

/// Convert MIDI number to note name (0-11)
String midiToNoteName(int midiNumber) {
  int noteWithinOctave = midiNumber % octaveLength;
  return midiToNote[noteWithinOctave] ?? 'C';
}

/// Get octave number from MIDI number
int getOctaveFromMidi(int midiNumber) {
  return (midiNumber ~/ octaveLength) - 1;
}

/// Convert note name and octave to MIDI number
int noteToMidiNumber(String noteName, int octave) {
  int baseNote = noteToMidi[normalizeNote(noteName)] ?? 0;
  return baseNote + ((octave + 1) * octaveLength);
}

/// Get triad chord (root, third, fifth) from root note in a scale
List<int> getTriadChord(List<int> scaleNotes, int rootIndex) {
  final chord = <int>[];

  if (rootIndex < 0 || rootIndex >= scaleNotes.length) {
    return chord;
  }

  // Get root, third (skip 1 note), fifth (skip 2 notes)
  int root = scaleNotes[rootIndex];
  int third = scaleNotes[(rootIndex + 2) % scaleNotes.length];
  int fifth = scaleNotes[(rootIndex + 4) % scaleNotes.length];

  // Adjust octaves to ensure ascending order
  if (third < root) third += octaveLength;
  if (fifth < third) fifth += octaveLength;

  chord.addAll([root, third, fifth]);
  return chord;
}

/// Get seventh chord (root, third, fifth, seventh) from root note in a scale
List<int> getSeventhChord(List<int> scaleNotes, int rootIndex) {
  final chord = <int>[];

  if (rootIndex < 0 || rootIndex >= scaleNotes.length) {
    return chord;
  }

  // Get root, third (skip 1), fifth (skip 3), seventh (skip 5)
  int root = scaleNotes[rootIndex];
  int third = scaleNotes[(rootIndex + 2) % scaleNotes.length];
  int fifth = scaleNotes[(rootIndex + 4) % scaleNotes.length];
  int seventh = scaleNotes[(rootIndex + 6) % scaleNotes.length];

  // Adjust octaves to ensure ascending order
  if (third < root) third += octaveLength;
  if (fifth < third) fifth += octaveLength;
  if (seventh < fifth) seventh += octaveLength;

  chord.addAll([root, third, fifth, seventh]);
  return chord;
}

/// Check if a played note matches an expected note (accounting for octave)
bool noteMatches(int playedMidi, int expectedMidi) {
  // Notes match if they're the same pitch class (ignoring octave)
  return (playedMidi % octaveLength) == (expectedMidi % octaveLength);
}

/// Get the semitone distance between two notes
int semitoneDifference(int midiNumber1, int midiNumber2) {
  return (midiNumber2 - midiNumber1).abs();
}

/// Check if a note is in a given scale
bool noteInScale(int midiNumber, List<int> scaleNotes) {
  int noteClass = midiNumber % octaveLength;
  return scaleNotes.any((note) => (note % octaveLength) == noteClass);
}

/// Generate random note within a range
int getRandomNote(int minMidi, int maxMidi) {
  return minMidi + (Random().nextInt(maxMidi - minMidi + 1));
}

/// Generate random notes for a scale
List<int> getRandomScaleNotes(List<int> availableNotes, int count) {
  final random = Random();
  final selected = <int>[];

  for (int i = 0; i < count && availableNotes.isNotEmpty; i++) {
    selected.add(availableNotes[random.nextInt(availableNotes.length)]);
  }

  return selected;
}
