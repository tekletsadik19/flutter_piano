import '../models/lesson_model.dart';
import '../../domain/entities/lesson.dart';

final additionalLessons = <LessonModel>[
  // Add exercise type and ID to existing lessons that have highlightedKeys

  /// b_04 with C Major triad exercise
  const LessonModel(
    id: 'b_04_with_exercise',
    title: 'Finding C, D & E',
    description:
        'Locate C, D, and E on the keyboard using the 2-black-key group as your landmark.',
    level: LessonLevel.beginner,
    path: LessonPath.soloist,
    durationMinutes: 7,
    exerciseType: 'scale',
    exerciseId: 'scale-major-C',
    content: LessonContent(
      conceptText:
          'Using a group of 2 black keys as your landmark:\n\n'
          '• C = white key immediately to the LEFT of the 2 black keys\n'
          '• D = white key IN BETWEEN the 2 black keys\n'
          '• E = white key immediately to the RIGHT of the 2 black keys\n\n'
          'Practice: close your eyes, open them, find C instantly. '
          'Then play C-D-E-D-C slowly, one key at a time.',
      highlightedKeys: [60, 62, 64], // C4, D4, E4
      keyLabels: {60: 'C', 62: 'D', 64: 'E'},
    ),
  ),

  /// b_06 with C Major scale (5-note)
  const LessonModel(
    id: 'b_06_with_exercise',
    title: 'Finding F & G',
    description:
        'Locate F and G using the 3-black-key group, completing the C-D-E-F-G five-finger set.',
    level: LessonLevel.beginner,
    path: LessonPath.soloist,
    durationMinutes: 7,
    exerciseType: 'scale',
    exerciseId: 'scale-major-C',
    content: LessonContent(
      conceptText:
          'Using a group of 3 black keys as your landmark:\n\n'
          '• F = white key immediately to the LEFT of the 3 black keys\n'
          '• G = second white key from the left (between the 1st and 2nd black keys)\n\n'
          'Now you can play C-D-E-F-G (five notes in a row) with your right hand:\n'
          'Finger 1 on C, finger 2 on D, finger 3 on E, finger 4 on F, finger 5 on G.\n\n'
          'This is called the "C position." Practice going up (1-2-3-4-5) and back down (5-4-3-2-1).',
      highlightedKeys: [60, 62, 64, 65, 67],
      keyLabels: {60: 'C', 62: 'D', 64: 'E', 65: 'F', 67: 'G'},
    ),
  ),

  /// C Major Chord Lesson
  const LessonModel(
    id: 'b_chord_c_major',
    title: 'Your First Chord: C Major',
    description: 'Learn to play a three-note chord.',
    level: LessonLevel.beginner,
    path: LessonPath.chords,
    durationMinutes: 5,
    exerciseType: 'chord',
    exerciseId: 'chord-major-triad-C',
    content: LessonContent(
      conceptText:
          'A chord is three or more notes played at the same time.\n\n'
          'The C Major chord uses three notes:\n'
          '• C (root)\n'
          '• E (the 3rd)\n'
          '• G (the 5th)\n\n'
          'These are degrees 1, 3, and 5 of the C Major scale.\n\n'
          'To play it: press C, E, and G together with your fingers 1, 3, and 5.',
      highlightedKeys: [60, 64, 67], // C, E, G
      keyLabels: {60: 'C', 64: 'E', 67: 'G'},
    ),
  ),

  /// G Major Chord Lesson
  const LessonModel(
    id: 'b_chord_g_major',
    title: 'G Major Chord',
    description: 'Learn the G Major chord.',
    level: LessonLevel.beginner,
    path: LessonPath.chords,
    durationMinutes: 5,
    exerciseType: 'chord',
    exerciseId: 'chord-major-triad-G',
    content: LessonContent(
      conceptText:
          'The G Major chord is built the same way as C Major, but starts on G:\n\n'
          '• G (root)\n'
          '• B (the 3rd)\n'
          '• D (the 5th)\n\n'
          'Find G (to the right of the 3-black-key group), then count up to find B and D.',
      highlightedKeys: [67, 71, 74], // G, B, D
      keyLabels: {67: 'G', 71: 'B', 74: 'D'},
    ),
  ),

  /// A Minor Chord Lesson
  const LessonModel(
    id: 'b_chord_a_minor',
    title: 'A Minor Chord',
    description: 'Learn your first minor chord.',
    level: LessonLevel.beginner,
    path: LessonPath.chords,
    durationMinutes: 5,
    exerciseType: 'chord',
    exerciseId: 'chord-minor-triad-A',
    content: LessonContent(
      conceptText:
          'Minor chords have a sadder, more introspective sound than major chords.\n\n'
          'The A Minor chord:\n'
          '• A (root)\n'
          '• C (the minor 3rd — one half-step lower than the major 3rd)\n'
          '• E (the 5th)\n\n'
          'Compare this to A Major: the only difference is the C is lowered to C.',
      highlightedKeys: [69, 72, 76], // A, C, E
      keyLabels: {69: 'A', 72: 'C', 76: 'E'},
    ),
  ),

  /// G Major Scale Lesson
  const LessonModel(
    id: 'b_scale_g_major',
    title: 'G Major Scale',
    description: 'Learn the scale with one sharp (F#).',
    level: LessonLevel.beginner,
    path: LessonPath.soloist,
    durationMinutes: 7,
    exerciseType: 'scale',
    exerciseId: 'scale-major-G',
    content: LessonContent(
      conceptText:
          'The G Major scale has the same pattern as C Major (W-W-H-W-W-W-H), '
          'but starts on G and includes one sharp: F#.\n\n'
          'The notes are: G, A, B, C, D, E, F#, G\n\n'
          'Play this scale slowly, one note at a time, using fingers 1-2-3-4-5 and back.',
      highlightedKeys: [67, 69, 71, 72, 74, 76, 78, 79], // G through G next octave
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

  /// C Major Arpeggio Lesson
  const LessonModel(
    id: 'b_arpeggio_c_major',
    title: 'C Major Arpeggio',
    description: 'Play the C Major chord broken into a flowing pattern.',
    level: LessonLevel.beginner,
    path: LessonPath.soloist,
    durationMinutes: 6,
    exerciseType: 'arpeggio',
    exerciseId: 'arpeggio-major-asc-C',
    content: LessonContent(
      conceptText:
          'An arpeggio is a chord played one note at a time in a flowing sequence.\n\n'
          'Instead of playing C-E-G all at once, play them separately:\n'
          'C (finger 1) → E (finger 3) → G (finger 5) → C (next octave)\n\n'
          'This creates a beautiful, cascading sound and strengthens your finger dexterity.',
      highlightedKeys: [60, 64, 67, 72], // C major arpeggio pattern
      keyLabels: {60: 'C', 64: 'E', 67: 'G', 72: 'C'},
    ),
  ),
];
