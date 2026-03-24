import '../../features/lessons/data/models/lesson_model.dart';
import '../../features/lessons/domain/entities/lesson.dart';

/// Beginner lesson curriculum using exercise data from scales, chords, and arpeggios
final beginnerLessons = <LessonModel>[
  // Module 1: Introduction to Scales
  LessonModel(
    id: 'beginner-01-c-major-scale',
    title: 'C Major Scale',
    description: 'Learn the most fundamental scale in Western music.',
    level: LessonLevel.beginner,
    path: LessonPath.soloist,
    durationMinutes: 5,
    exerciseType: 'scale',
    exerciseId: 'scale-major-C',
    content: LessonContent(
      conceptText:
          'The C Major scale consists of 8 notes: C, D, E, F, G, A, B, C. '
          'It follows a pattern of whole steps (W) and half steps (H): W-W-H-W-W-W-H. '
          'This is the most basic scale because it has no sharps or flats.',
      highlightedKeys: [48, 50, 52, 53, 55, 57, 59, 60], // C4 through C5
      keyLabels: {
        48: 'C',
        50: 'D',
        52: 'E',
        53: 'F',
        55: 'G',
        57: 'A',
        59: 'B',
        60: 'C',
      },
      youtubeVideoId: 'dxkO9gNpDi0', // Example video ID
    ),
  ),
  LessonModel(
    id: 'beginner-02-g-major-scale',
    title: 'G Major Scale',
    description: 'Learn the second most common scale with one sharp (F#).',
    level: LessonLevel.beginner,
    path: LessonPath.soloist,
    durationMinutes: 5,
    exerciseType: 'scale',
    exerciseId: 'scale-major-G',
    content: LessonContent(
      conceptText:
          'The G Major scale has the same interval pattern as C Major, '
          'but starts on G. It contains one sharp: F#. '
          'This scale is common in many songs and pieces.',
      highlightedKeys: [55, 57, 59, 60, 62, 64, 66, 67], // G4 through G5
      keyLabels: {
        55: 'G',
        57: 'A',
        59: 'B',
        60: 'C',
        62: 'D',
        64: 'E',
        66: 'F#',
        67: 'G',
      },
    ),
  ),
  LessonModel(
    id: 'beginner-03-d-major-scale',
    title: 'D Major Scale',
    description: 'Learn the D Major scale with two sharps.',
    level: LessonLevel.beginner,
    path: LessonPath.soloist,
    durationMinutes: 5,
    exerciseType: 'scale',
    exerciseId: 'scale-major-D',
    content: LessonContent(
      conceptText:
          'D Major contains two sharps: F# and C#. '
          'It\'s a bright, energetic scale often used in classical and folk music.',
      highlightedKeys: [50, 52, 54, 55, 57, 59, 61, 62], // D4 through D5
      keyLabels: {
        50: 'D',
        52: 'E',
        54: 'F#',
        55: 'G',
        57: 'A',
        59: 'B',
        61: 'C#',
        62: 'D',
      },
    ),
  ),

  // Module 2: Introduction to Chords
  LessonModel(
    id: 'beginner-04-c-major-chord',
    title: 'C Major Chord',
    description: 'Learn your first triad: the C Major chord.',
    level: LessonLevel.beginner,
    path: LessonPath.chords,
    durationMinutes: 4,
    exerciseType: 'chord',
    exerciseId: 'chord-major-triad-C',
    content: LessonContent(
      conceptText:
          'A triad is a three-note chord. The C Major chord (C-E-G) consists of:\n'
          '• Root (C)\n'
          '• Major 3rd (E)\n'
          '• Perfect 5th (G)\n\n'
          'These notes are degrees 1, 3, and 5 of the C Major scale.',
      highlightedKeys: [48, 52, 55], // C, E, G
      keyLabels: {
        48: 'C',
        52: 'E',
        55: 'G',
      },
    ),
  ),
  LessonModel(
    id: 'beginner-05-g-major-chord',
    title: 'G Major Chord',
    description: 'Learn the G Major chord (G-B-D).',
    level: LessonLevel.beginner,
    path: LessonPath.chords,
    durationMinutes: 4,
    exerciseType: 'chord',
    exerciseId: 'chord-major-triad-G',
    content: LessonContent(
      conceptText:
          'The G Major chord consists of G, B, and D. '
          'This is one of the most common chords in popular music.',
      highlightedKeys: [55, 59, 62], // G, B, D
      keyLabels: {
        55: 'G',
        59: 'B',
        62: 'D',
      },
    ),
  ),
  LessonModel(
    id: 'beginner-06-a-minor-chord',
    title: 'A Minor Chord',
    description: 'Learn your first minor chord.',
    level: LessonLevel.beginner,
    path: LessonPath.chords,
    durationMinutes: 4,
    exerciseType: 'chord',
    exerciseId: 'chord-minor-triad-A',
    content: LessonContent(
      conceptText:
          'The A Minor chord (A-C-E) is the relative minor of C Major. '
          'It has a sadder, more introspective sound than major chords. '
          'The minor 3rd (C) gives it its characteristic minor quality.',
      highlightedKeys: [57, 60, 64], // A, C, E
      keyLabels: {
        57: 'A',
        60: 'C',
        64: 'E',
      },
    ),
  ),

  // Module 3: Introduction to Arpeggios
  LessonModel(
    id: 'beginner-07-c-major-arpeggio',
    title: 'C Major Arpeggio',
    description: 'Break up the C Major chord into a flowing pattern.',
    level: LessonLevel.beginner,
    path: LessonPath.soloist,
    durationMinutes: 5,
    exerciseType: 'arpeggio',
    exerciseId: 'arpeggio-major-asc-C',
    content: LessonContent(
      conceptText:
          'An arpeggio is a chord played one note at a time in a flowing sequence. '
          'The C Major arpeggio uses the same notes as the C Major chord (C, E, G) '
          'but plays them in succession across multiple octaves.',
      highlightedKeys: [48, 52, 55, 60, 64, 67, 72], // C arpeggio pattern
      keyLabels: {
        48: 'C',
        52: 'E',
        55: 'G',
        60: 'C',
        64: 'E',
        67: 'G',
        72: 'C',
      },
    ),
  ),
  LessonModel(
    id: 'beginner-08-g-major-arpeggio',
    title: 'G Major Arpeggio',
    description: 'Ascend and descend with the G Major arpeggio.',
    level: LessonLevel.beginner,
    path: LessonPath.soloist,
    durationMinutes: 5,
    exerciseType: 'arpeggio',
    exerciseId: 'arpeggio-major-wave-G',
    content: LessonContent(
      conceptText:
          'This wave pattern goes up and then back down, creating a smooth, '
          'musical exercise that strengthens finger dexterity.',
      highlightedKeys: [55, 59, 62, 67, 71, 74, 79], // G arpeggio pattern
      keyLabels: {
        55: 'G',
        59: 'B',
        62: 'D',
        67: 'G',
      },
    ),
  ),

  // Module 4: Natural Minor Scales
  LessonModel(
    id: 'beginner-09-a-minor-scale',
    title: 'A Minor Scale (Natural)',
    description: 'The relative minor of C Major.',
    level: LessonLevel.beginner,
    path: LessonPath.soloist,
    durationMinutes: 5,
    exerciseType: 'scale',
    exerciseId: 'scale-minor-natural-A',
    content: LessonContent(
      conceptText:
          'A Natural Minor scale is the relative minor of C Major. '
          'It uses the same notes as C Major but starts on A: A, B, C, D, E, F, G, A. '
          'It has a darker, more introspective sound.',
      highlightedKeys: [57, 59, 60, 62, 64, 65, 67, 69], // A minor
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
];
