import '../../features/lessons/data/models/lesson_model.dart';
import '../../features/lessons/domain/entities/lesson.dart';

/// Intermediate curriculum (RCM Grade 2-4, ABRSM Grade 3-5)
final intermediateLessons = <LessonModel>[
  // ════════════════════════════════════════════════════════════════════════
  // MODULE 1: HARMONIC FUNCTION & PROGRESSIONS
  // ════════════════════════════════════════════════════════════════════════

  LessonModel(
    id: 'inter-01-g-major-chord',
    title: 'G Major Chord & Circle of Fifths',
    description: 'Explore the V chord and harmonic progression fundamentals',
    level: LessonLevel.intermediate,
    path: LessonPath.chords,
    durationMinutes: 8,
    exerciseType: 'chord',
    exerciseId: 'chord-major-triad-G',
    content: LessonContent(
      conceptText:
          'The G Major chord (V in C Major) is the dominant chord.\n\n'
          'In functional harmony:\n'
          '• I chord (C Major): home, stability\n'
          '• V chord (G Major): tension, pulls back to I\n'
          '• This V-I progression is called a "cadence"\n\n'
          'Circle of Fifths progression:\n'
          'Each chord moves up a perfect 5th (or down a perfect 4th)\n'
          'Example: C → G → D → A → E → B → F# → C#\n\n'
          'This movement creates natural harmonic flow in classical music.',
      highlightedKeys: [67, 71, 74],
      keyLabels: {67: 'G', 71: 'B', 74: 'D'},
    ),
  ),

  LessonModel(
    id: 'inter-02-a-minor-chord',
    title: 'A Minor Chord & Relative Minor',
    description: 'Understand relative minor key relationships',
    level: LessonLevel.intermediate,
    path: LessonPath.chords,
    durationMinutes: 8,
    exerciseType: 'chord',
    exerciseId: 'chord-minor-triad-A',
    content: LessonContent(
      conceptText:
          'A Minor is the relative minor of C Major.\n\n'
          'KEY RELATIONSHIP:\n'
          '• Same notes: C Major scale = A Minor scale\n'
          '• A Minor uses all white keys (no accidentals)\n'
          '• This is "relative minor" relationship\n\n'
          'HARMONIC FUNCTION:\n'
          '• vi chord in C Major = A Minor\n'
          '• Creates darker, more introspective sound\n'
          '• Common progression: I - vi - IV - V (very popular)\n\n'
          'EMOTIONAL QUALITY:\n'
          'Minor chords suggest sadness, mystery, introspection',
      highlightedKeys: [69, 72, 76],
      keyLabels: {69: 'A', 72: 'C', 76: 'E'},
    ),
  ),

  // ════════════════════════════════════════════════════════════════════════
  // MODULE 2: SCALE PATTERNS & MINOR SCALES
  // ════════════════════════════════════════════════════════════════════════

  LessonModel(
    id: 'inter-03-g-major-scale',
    title: 'G Major Scale & Sharps',
    description: 'Master scales with one sharp (F#)',
    level: LessonLevel.intermediate,
    path: LessonPath.soloist,
    durationMinutes: 8,
    exerciseType: 'scale',
    exerciseId: 'scale-major-G',
    content: LessonContent(
      conceptText:
          'G Major has ONE sharp: F#\n\n'
          'Notes: G - A - B - C - D - E - F# - G\n\n'
          'WHY THE SHARP?\n'
          'To maintain major scale pattern (W-W-H-W-W-W-H):\n'
          '• Without F#: we\'d get a whole step to G (wrong)\n'
          '• With F#: we get half step to G (correct)\n\n'
          'KEY SIGNATURE:\n'
          'One sharp symbol (♯) placed on the F line\n'
          'This tells you the key is G Major or E Minor\n\n'
          'CIRCLE OF FIFTHS:\n'
          'G is one position clockwise from C\n'
          'Each position adds one sharp',
      highlightedKeys: [67, 69, 71, 72, 74, 76, 78, 79],
      keyLabels: {
        67: 'G',
        69: 'A',
        71: 'B',
        72: 'C',
        74: 'D',
        76: 'E',
        78: 'F#',
        79: 'G',
      },
    ),
  ),

  LessonModel(
    id: 'inter-04-a-minor-natural-scale',
    title: 'A Minor Natural Scale',
    description: 'Learn the natural minor (Aeolian mode)',
    level: LessonLevel.intermediate,
    path: LessonPath.soloist,
    durationMinutes: 8,
    exerciseType: 'scale',
    exerciseId: 'scale-minor-natural-A',
    content: LessonContent(
      conceptText:
          'A Minor Natural (also called "relative minor")\n\n'
          'Notes: A - B - C - D - E - F - G - A\n\n'
          'PATTERN: W-H-W-W-H-W-W (compare to major: W-W-H-W-W-W-H)\n\n'
          'CHARACTERISTICS:\n'
          '• Darker, sadder quality than major\n'
          '• Same notes as C Major (relative relationship)\n'
          '• No accidentals (all white keys)\n\n'
          'THREE TYPES OF MINOR:\n'
          '1. Natural Minor: all white keys in A\n'
          '2. Harmonic Minor: raises 7th (G#) for V-i cadence\n'
          '3. Melodic Minor: raises 6th & 7th ascending\n\n'
          'Natural minor is most commonly played of the three',
      highlightedKeys: [57, 59, 60, 62, 64, 65, 67, 69],
      keyLabels: {
        57: 'A',
        59: 'B',
        60: 'C',
        62: 'D',
        64: 'E',
        65: 'F',
        67: 'G',
        69: 'A',
      },
    ),
  ),

  // ════════════════════════════════════════════════════════════════════════
  // MODULE 3: ADVANCED ARPEGGIOS & CHORD INVERSIONS
  // ════════════════════════════════════════════════════════════════════════

  LessonModel(
    id: 'inter-05-g-major-arpeggio',
    title: 'G Major Arpeggio - Extended',
    description: 'Extended arpeggio patterns across full keyboard',
    level: LessonLevel.intermediate,
    path: LessonPath.soloist,
    durationMinutes: 10,
    exerciseType: 'arpeggio',
    exerciseId: 'arpeggio-major-asc-G',
    content: LessonContent(
      conceptText:
          'Extended G Major arpeggio spans multiple octaves\n\n'
          'BROKEN CHORD ACCOMPANIMENT:\n'
          'Alberti Bass pattern (Classical era):\n'
          'G-D-B-D (repeated, creates flowing accompaniment)\n\n'
          'HAND CROSSING TECHNIQUE:\n'
          'When spanning many octaves:\n'
          '• Right hand starts low\n'
          '• Crosses left hand\n'
          '• Continues to high register\n'
          '• Requires smooth wrist motion\n\n'
          'MUSICAL APPLICATION:\n'
          'Mozart, Beethoven use arpeggios extensively\n'
          'Creates "harp-like" effect in keyboard writing',
      highlightedKeys: [67, 71, 75, 79],
      keyLabels: {67: 'G', 71: 'B', 75: 'D', 79: 'G'},
    ),
  ),

  // ════════════════════════════════════════════════════════════════════════
  // MODULE 4: INTERVALS & VOICE LEADING
  // ════════════════════════════════════════════════════════════════════════

  LessonModel(
    id: 'inter-06-major-and-minor-thirds',
    title: 'Intervals: Major & Minor Thirds',
    description: 'Master interval quality and recognition',
    level: LessonLevel.intermediate,
    path: LessonPath.soloist,
    durationMinutes: 7,
    content: LessonContent(
      conceptText:
          'MAJOR THIRD: 4 semitones (2 whole steps)\n'
          'Example: C to E = 4 semitones = Major 3rd\n'
          'Sound: bright, open, major chord quality\n\n'
          'MINOR THIRD: 3 semitones (1.5 whole steps)\n'
          'Example: C to Eb = 3 semitones = Minor 3rd\n'
          'Sound: dark, introspective, minor chord quality\n\n'
          'CHORD DIFFERENCE:\n'
          'C Major chord: C (root) + E (major 3rd) + G (5th)\n'
          'C Minor chord: C (root) + Eb (minor 3rd) + G (5th)\n'
          'Only difference: the 3rd is major or minor\n\n'
          'INTERVAL QUALITY:\n'
          'Intervals are measured by:\n'
          '1. Distance (number of letter names)\n'
          '2. Quality (major, minor, perfect, diminished, augmented)',
      highlightedKeys: [48, 52, 51],
      keyLabels: {48: 'C', 52: 'E', 51: 'Eb'},
    ),
  ),

  // ════════════════════════════════════════════════════════════════════════
  // MODULE 5: RHYTHM & METER
  // ════════════════════════════════════════════════════════════════════════

  LessonModel(
    id: 'inter-07-compound-meter',
    title: 'Compound Meter (6/8, 9/8, 12/8)',
    description: 'Understand triple subdivisions',
    level: LessonLevel.intermediate,
    path: LessonPath.both,
    durationMinutes: 8,
    content: LessonContent(
      conceptText:
          'SIMPLE vs COMPOUND METER:\n'
          'Simple (2/4, 3/4, 4/4): beat divides by 2\n'
          'Compound (6/8, 9/8, 12/8): beat divides by 3\n\n'
          '6/8 TIME:\n'
          '• 6 eighth notes per measure\n'
          '• Feels like 2 beats (each worth 3 eighth notes)\n'
          '• Typical tempo: ♩. = 60-90 bpm\n'
          '• Common in Baroque, folk music\n\n'
          'COUNTING 6/8:\n'
          '1-2-3-4-5-6 (mechanical)\n'
          'OR: 1-and-a-2-and-a (feels natural)\n\n'
          'MUSICAL EFFECT:\n'
          'Compound meter creates lilting, flowing quality\n'
          'Gives impression of movement and momentum',
    ),
  ),
];
