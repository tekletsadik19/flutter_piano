import '../../features/lessons/data/models/lesson_model.dart';
import '../../features/lessons/domain/entities/lesson.dart';

/// Advanced curriculum (RCM Grade 5-8, ABRSM Grade 6-8, Berklee Harmony II)
final advancedLessons = <LessonModel>[
  // ════════════════════════════════════════════════════════════════════════
  // MODULE 1: SEVENTH CHORDS & EXTENDED HARMONY
  // ════════════════════════════════════════════════════════════════════════

  LessonModel(
    id: 'adv-01-dominant-seventh',
    title: 'Dominant Seventh Chord (V7)',
    description: 'Master the most common secondary dominant function',
    level: LessonLevel.advanced,
    path: LessonPath.chords,
    durationMinutes: 10,
    exerciseType: 'chord',
    exerciseId: 'chord-dominant-seventh-G',
    content: LessonContent(
      conceptText:
          'The Dominant Seventh chord (V7) is the most important functional harmony.\n\n'
          'In C Major:\n'
          '• V chord (G Major): G-B-D\n'
          '• V7 chord: G-B-D-F (adds minor 7th above root)\n'
          '• The F (minor 7th) creates tension that resolves to C\n\n'
          'LEADING TONE FUNCTION:\n'
          '• B (3rd of G) resolves up to C\n'
          '• F (7th of G) resolves down to E\n'
          '• Creates strong harmonic pull to tonic\n\n'
          'HISTORICAL IMPORTANCE:\n'
          '• V7-I is the most fundamental cadence\n'
          '• Found in every classical piece\n'
          '• Establishes tonality and provides harmonic closure\n\n'
          'SECONDARY DOMINANTS:\n'
          '• Can build V7 chords to any diatonic harmony\n'
          '• Example: V7/ii, V7/iii, V7/IV (in C Major)',
      highlightedKeys: [67, 71, 74, 77],
      keyLabels: {67: 'G', 71: 'B', 74: 'D', 77: 'F'},
    ),
  ),

  LessonModel(
    id: 'adv-02-major-seventh-chord',
    title: 'Major Seventh Chord (Maj7)',
    description: 'Create sophisticated jazz and classical harmonies',
    level: LessonLevel.advanced,
    path: LessonPath.chords,
    durationMinutes: 10,
    exerciseType: 'chord',
    exerciseId: 'chord-major-seventh-C',
    content: LessonContent(
      conceptText:
          'Major Seventh Chord = Major Triad + Major 7th above root\n\n'
          'In C Major:\n'
          '• C Major chord: C-E-G\n'
          '• CMaj7 chord: C-E-G-B\n'
          '• B is a major 7th (half step below octave)\n\n'
          'CHARACTERISTICS:\n'
          '• Much more sophisticated than dominant 7th\n'
          '• Floating, open quality (not as much tension)\n'
          '• Sound: dreamy, expansive, elegant\n\n'
          'USAGE IN CLASSICAL:\n'
          '• Debussy: Maj7 chords for impressionistic sound\n'
          '• Contemporary composers: sophisticated harmony\n\n'
          'USAGE IN JAZZ:\n'
          '• Primary chord type in jazz standards\n'
          '• Creates smooth voice leading\n'
          '• Example: CMaj7 - Dm7 - G7 - CMaj7',
      highlightedKeys: [60, 64, 67, 71],
      keyLabels: {60: 'C', 64: 'E', 67: 'G', 71: 'B'},
    ),
  ),

  LessonModel(
    id: 'adv-03-minor-seventh-chord',
    title: 'Minor Seventh Chord (m7)',
    description: 'Essential jazz and blues chord type',
    level: LessonLevel.advanced,
    path: LessonPath.chords,
    durationMinutes: 10,
    exerciseType: 'chord',
    exerciseId: 'chord-minor-seventh-A',
    content: LessonContent(
      conceptText:
          'Minor Seventh Chord = Minor Triad + Minor 7th\n\n'
          'In C Major:\n'
          '• A Minor chord: A-C-E\n'
          '• Am7 chord: A-C-E-G\n'
          '• G is a minor 7th (whole step below octave)\n\n'
          'FUNCTIONAL ANALYSIS:\n'
          '• ii chord in C Major with extension: Dm7\n'
          '• vi chord with extension: Am7\n'
          '• Less tension than dominant 7th\n\n'
          'JAZZ CONTEXT:\n'
          '• m7 chords are the primary jazz harmony\n'
          '• Smooth voice leading between m7 chords\n'
          '• Creates the "jazz sound"\n\n'
          'BLUES CONTEXT:\n'
          '• 12-bar blues typically uses m7 chords\n'
          '• Creates bluesy, soulful quality',
      highlightedKeys: [69, 72, 76, 79],
      keyLabels: {69: 'A', 72: 'C', 76: 'E', 79: 'G'},
    ),
  ),

  // ════════════════════════════════════════════════════════════════════════
  // MODULE 2: VOICE LEADING & COUNTERPOINT
  // ════════════════════════════════════════════════════════════════════════

  LessonModel(
    id: 'adv-04-four-part-writing',
    title: 'Four-Part Voice Leading (SATB)',
    description: 'Master voice leading in chorus writing',
    level: LessonLevel.advanced,
    path: LessonPath.chords,
    durationMinutes: 12,
    content: LessonContent(
      conceptText:
          'SATB = Soprano, Alto, Tenor, Bass\n\n'
          'VOICE RANGES:\n'
          '• Soprano: High female voice (C4-A5)\n'
          '• Alto: Lower female voice (G3-E5)\n'
          '• Tenor: High male voice (C3-A4)\n'
          '• Bass: Low male voice (E2-D4)\n\n'
          'VOICE LEADING RULES:\n'
          '1. Smooth motion: keep common tones when possible\n'
          '2. Contrary motion: outer voices move opposite directions\n'
          '3. Avoid parallel 5ths and octaves\n'
          '4. Each voice should sing a singable line\n\n'
          'HARMONIC ANALYSIS:\n'
          '• Bach chorales as teaching model\n'
          '• How composers balance harmony with independent lines\n'
          '• Baroque techniques in modern context',
      highlightedKeys: [],
      keyLabels: {},
    ),
  ),

  LessonModel(
    id: 'adv-05-modulation-techniques',
    title: 'Modulation & Key Changes',
    description: 'Navigate between keys smoothly',
    level: LessonLevel.advanced,
    path: LessonPath.chords,
    durationMinutes: 12,
    content: LessonContent(
      conceptText:
          'MODULATION TYPES:\n\n'
          '1. PIVOT CHORD MODULATION\n'
          'A chord that functions in both keys\n'
          'Example: In C Major, G Major in both C and G keys\n'
          'Smooth transition via shared harmonic function\n\n'
          '2. DIRECT MODULATION\n'
          'Abrupt change to new key\n'
          'No transition chord\n'
          'Creates surprising effect\n\n'
          '3. COMMON TONE MODULATION\n'
          'A single note held across key change\n'
          'Creates continuity amid harmonic shift\n\n'
          '4. SEQUENTIAL MODULATION\n'
          'Repeating harmonic pattern in new key\n'
          'Moves up by step (C Major → D Major → E Major)\n\n'
          'MUSICAL EFFECT:\n'
          'Modulation prevents harmonic stagnation\n'
          'Creates dramatic architectural design\n'
          'Found in sonata form, rondo, theme & variations',
      highlightedKeys: [],
      keyLabels: {},
    ),
  ),

  // ════════════════════════════════════════════════════════════════════════
  // MODULE 3: ADVANCED SCALES & MODES
  // ════════════════════════════════════════════════════════════════════════

  LessonModel(
    id: 'adv-06-modes-and-scales',
    title: 'Modes: Ionian to Locrian',
    description: 'Master all seven modes derived from major scale',
    level: LessonLevel.advanced,
    path: LessonPath.soloist,
    durationMinutes: 14,
    exerciseType: 'scale',
    exerciseId: 'scale-mode-C-ionian',
    content: LessonContent(
      conceptText:
          'SEVEN MODES (using C Major notes: C-D-E-F-G-A-B)\n\n'
          '1. IONIAN (Major): C-D-E-F-G-A-B-C (starts on 1st)\n'
          '2. DORIAN: D-E-F-G-A-B-C-D (starts on 2nd)\n'
          '3. PHRYGIAN: E-F-G-A-B-C-D-E (starts on 3rd)\n'
          '4. LYDIAN: F-G-A-B-C-D-E-F (starts on 4th)\n'
          '5. MIXOLYDIAN: G-A-B-C-D-E-F-G (starts on 5th)\n'
          '6. AEOLIAN (Minor): A-B-C-D-E-F-G-A (starts on 6th)\n'
          '7. LOCRIAN: B-C-D-E-F-G-A-B (starts on 7th)\n\n'
          'EMOTIONAL QUALITIES:\n'
          '• Ionian: bright, major\n'
          '• Dorian: jazzy, minor with raised 6th\n'
          '• Phrygian: dark, exotic (Spanish)\n'
          '• Lydian: floating, major with raised 4th\n'
          '• Mixolydian: bluesy, dominant sound\n'
          '• Aeolian: pure minor\n'
          '• Locrian: darkest, diminished quality\n\n'
          'MODERN USAGE:\n'
          'Jazz, fusion, progressive rock all use modes extensively\n'
          'Creates harmonic color without changing key signature',
      highlightedKeys: [60, 62, 64, 65, 67, 69, 71, 72],
      keyLabels: {
        60: 'C', 62: 'D', 64: 'E', 65: 'F',
        67: 'G', 69: 'A', 71: 'B', 72: 'C'
      },
    ),
  ),

  LessonModel(
    id: 'adv-07-harmonic-and-melodic-minor',
    title: 'Harmonic & Melodic Minor Scales',
    description: 'Advanced minor scale forms with altered degrees',
    level: LessonLevel.advanced,
    path: LessonPath.soloist,
    durationMinutes: 12,
    exerciseType: 'scale',
    exerciseId: 'scale-harmonic-minor-A',
    content: LessonContent(
      conceptText:
          'HARMONIC MINOR FORM\n'
          'Natural Minor + raised 7th degree\n'
          'Example: A natural: A-B-C-D-E-F-G\n'
          'A Harmonic: A-B-C-D-E-F-G#\n'
          '• Creates leading tone (G# → A)\n'
          '• Enables V-i authentic cadence in minor\n'
          '• Larger gap (augmented 2nd) between 6th and 7th\n\n'
          'MELODIC MINOR FORM\n'
          'Natural Minor + raised 6th and 7th (ascending only!)\n'
          'A Melodic ascending: A-B-C-D-E-F#-G#\n'
          'A Melodic descending: reverts to natural minor (A-G-F-E-D-C-B)\n'
          '• Smoother intervallic movement\n'
          '• Avoids awkward augmented 2nd\n'
          '• Used in melodies\n\n'
          'USAGE IN COMPOSITION:\n'
          '• Harmonic minor: for harmonic progressions and cadences\n'
          '• Melodic minor: for scalar lines and passages\n'
          '• Classical composers used both form-dependently',
      highlightedKeys: [57, 59, 60, 62, 64, 65, 67, 69],
      keyLabels: {
        57: 'A', 59: 'B', 60: 'C', 62: 'D',
        64: 'E', 65: 'F', 67: 'G#', 69: 'A'
      },
    ),
  ),

  // ════════════════════════════════════════════════════════════════════════
  // MODULE 4: COMPLEX RHYTHMS & POLYRHYTHMS
  // ════════════════════════════════════════════════════════════════════════

  LessonModel(
    id: 'adv-08-polyrhythm-basics',
    title: 'Polyrhythm: 3 Against 2, 4 Against 3',
    description: 'Execute multiple simultaneous rhythmic patterns',
    level: LessonLevel.advanced,
    path: LessonPath.both,
    durationMinutes: 14,
    content: LessonContent(
      conceptText:
          'POLYRHYTHM DEFINITION\n'
          'Two or more different rhythmic patterns occurring simultaneously\n\n'
          '3 AGAINST 2 (Triplet vs Duplet)\n'
          '• Right hand: three notes per beat\n'
          '• Left hand: two notes per beat\n'
          '• Mathematical relationship: 3:2 ratio\n'
          '• Uncommon in Western classical (common in African music)\n\n'
          '4 AGAINST 3\n'
          '• Right hand: four notes per beat\n'
          '• Left hand: three notes per beat\n'
          '• Ratio: 4:3\n'
          '• More complex, requires independence\n\n'
          'ADVANCED POLYRHYTHMS:\n'
          '• 5 against 4: increasingly complex\n'
          '• 7 against 6: cutting-edge contemporary music\n\n'
          'MUSICAL CONTEXTS:\n'
          '• African drumming: primary organizational principle\n'
          '• Contemporary classical: Messiaen, Xenakis\n'
          '• Jazz fusion: polyrhythmic sophistication\n'
          '• Progressive rock: complex time and rhythm',
      highlightedKeys: [],
      keyLabels: {},
    ),
  ),

  LessonModel(
    id: 'adv-09-metric-modulation',
    title: 'Metric Modulation & Tempo Changes',
    description: 'Execute smooth tempo transitions mathematically',
    level: LessonLevel.advanced,
    path: LessonPath.both,
    durationMinutes: 12,
    content: LessonContent(
      conceptText:
          'METRIC MODULATION CONCEPT\n'
          'A tempo change determined mathematically by note values\n\n'
          'EXAMPLE:\n'
          'At ♩=120 (quarter note = 120 bpm)\n'
          'The triplet eighth notes equal 180 bpm\n'
          'Then establish new tempo where triplet = new quarter note\n'
          'New tempo: 180 bpm (mathematical continuation)\n\n'
          'EFFECT:\n'
          'Appears as tempo change but mathematically continuous\n'
          'Smooth despite apparent acceleration\n\n'
          'COMPOSERS:\n'
          '• Elliott Carter: primary innovator\n'
          '• Messiaen: complex rhythmic structures\n'
          '• Contemporary composers: standard tool\n\n'
          'EXECUTION:\n'
          'Requires absolute rhythmic precision\n'
          'Must maintain strict tempo relationships\n'
          'Extremely challenging to perform',
      highlightedKeys: [],
      keyLabels: {},
    ),
  ),
];
