import 'package:shared_preferences/shared_preferences.dart';

import '../../domain/entities/lesson.dart';
import '../../domain/repositories/lesson_repository.dart';
import '../models/lesson_model.dart';

// ---------------------------------------------------------------------------
// Verified Wikimedia diagram URLs
// ---------------------------------------------------------------------------
class _Diagrams {
  static const keyboard =
      'https://upload.wikimedia.org/wikipedia/commons/9/98/Piano_Keyboard_Diagram.svg';
  static const trebleClef =
      'https://upload.wikimedia.org/wikipedia/commons/f/fa/Treble_clef.svg';
  static const grandStaff =
      'https://upload.wikimedia.org/wikipedia/commons/4/4c/Grand_staff.svg';
  static const cMajChord =
      'https://upload.wikimedia.org/wikipedia/commons/4/45/Cmaj_chord.svg';
  static const circleOfFifths =
      'https://upload.wikimedia.org/wikipedia/commons/3/33/Circle_of_fifths_deluxe_4.svg';
  static const musicNotation =
      'https://upload.wikimedia.org/wikipedia/commons/6/62/Music_notation.svg';
}

// ---------------------------------------------------------------------------
// Verified Hoffman Academy YouTube video IDs
// (scraped from app.hoffmanacademy.com/lessons/piano/<slug>/video/)
// ---------------------------------------------------------------------------
class _Videos {
  // Unit 1 — Absolute Beginner (Lessons 1–20)
  static const u1L01FirstSong       = 'AQRagZY760w'; // Lesson 1  – First Song on Piano (Hot Cross Buns)
  static const u1L03MusicalAlphabet = 'zV1x4-1Owsw'; // Lesson 3  – Musical Alphabet
  static const u1L04FindingCde      = '37RRgoLeejI'; // Lesson 4  – Finding C, D & E
  static const u1L05PostureJourney  = 'BmTcXlfT1OE'; // Lesson 5  – Piano Posture & D Journey
  static const u1L06CBoogie        = 'vS89ItM21-c'; // Lesson 6  – C Boogie
  static const u1L07FindingFg       = 'N0PP3-v7KLY'; // Lesson 7  – Finding F & G
  static const u1L08FiveWoodpeckers = 'rQddv4IglVA'; // Lesson 8  – Five Woodpeckers
  static const u1L10FrogMiddle      = 'PqrRUC9DdrY'; // Lesson 10 – Frog in the Middle
  static const u1L11FindingAb       = '6-_v8msSNPw'; // Lesson 11 – Finding A & B
  static const u1L13Chocolate       = 'LvuXIJXNjtQ'; // Lesson 13 – Chocolate
  static const u1L16FingerNumbers   = 'zIO4VMEFybY'; // Lesson 16 – Finger Numbers
  static const u1L18HalfNotes       = 'Yw1uV0vPZkU'; // Lesson 18 – Half Notes
  static const u1L20FrogChords      = 'gvp_inheDSs'; // Lesson 20 – Frog in the Middle: Adding Chords

  // Unit 2 — Late Beginner (Lessons 21–40)
  static const u2L26TrebleStaff     = 'sM3peMr6yPI'; // Lesson 26 – CDEFG on Treble Staff
  static const u2L30BassStaff       = 'KUJudjF-1Ns'; // Lesson 30 – Bass Staff Basics
  static const u2L37V7Chord         = 'T0KbLKqVRuM'; // Lesson 37 – The V7 Chord
  static const u2L38MinorPenta      = 'OA11YIz5_P8'; // Lesson 38 – Minor Pentascales
}

// ---------------------------------------------------------------------------
// Lesson catalogue
// Curriculum alignment:
//   Beginner  (b_01–b_30) ≈ Hoffman Academy Units 1–2 / Alfred 1A–1B / RCM Prep A–Prep B
//   Intermediate (i_01–i_20) ≈ Hoffman Units 3–4 / Alfred Level 2 / RCM Level 1–3 / ABRSM Grade 1–3
//   Advanced  (a_01–a_10) ≈ Alfred Level 3–4 / RCM Level 4–6 / ABRSM Grade 4–6 / Berklee Technique 101
// ---------------------------------------------------------------------------
class LessonRepositoryImpl implements LessonRepository {
  LessonRepositoryImpl(this._prefs);

  final SharedPreferences _prefs;

  static final List<LessonModel> _catalogue = [

    // ════════════════════════════════════════════════════════════════════════
    // BEGINNER  (30 lessons  ·  0 – ~6 months)
    // ════════════════════════════════════════════════════════════════════════

    // ── b_01 ─────────────────────────────────────────────────────────────
    const LessonModel(
      id: 'b_01',
      title: 'Your First Sound',
      description:
          'Sit at the piano, make your very first sounds, and explore high and low notes.',
      level: LessonLevel.beginner,
      path: LessonPath.both,
      durationMinutes: 5,
      content: LessonContent(
        conceptText:
            'Welcome to the piano! Before learning any notes, just explore.\n\n'
            '• Press keys near the left side of the keyboard — these are low notes.\n'
            '• Press keys near the right side — these are high notes.\n'
            '• The piano has 88 keys in total.\n\n'
            'Play "Hot Cross Buns" using only three black keys in the middle of the keyboard. '
            'Find a group of THREE black keys. Use the middle, then left, then left-most key of that group.',
        diagramUrl: _Diagrams.keyboard,
        youtubeVideoId: _Videos.u1L01FirstSong,
      ),
    ),

    // ── b_02 ─────────────────────────────────────────────────────────────
    const LessonModel(
      id: 'b_02',
      title: 'Black Key Groups',
      description:
          'Recognise the pattern of 2-black and 3-black key groups that repeat all across the keyboard.',
      level: LessonLevel.beginner,
      path: LessonPath.both,
      durationMinutes: 5,
      content: LessonContent(
        conceptText:
            'Look at the black keys. They always come in groups:\n\n'
            '• Groups of TWO black keys\n'
            '• Groups of THREE black keys\n\n'
            'This 2-3 pattern repeats from the bottom to the top of the piano. '
            'It is the map you use to find every white key. '
            'The white key just to the LEFT of any group of 2 black keys is always C.',
        diagramUrl: _Diagrams.keyboard,
        youtubeVideoId: _Videos.u1L01FirstSong,
      ),
    ),

    // ── b_03 ─────────────────────────────────────────────────────────────
    const LessonModel(
      id: 'b_03',
      title: 'The Musical Alphabet',
      description:
          'Learn that white keys are named A through G, and that this 7-letter alphabet repeats.',
      level: LessonLevel.beginner,
      path: LessonPath.both,
      durationMinutes: 5,
      content: LessonContent(
        conceptText:
            'Each white key has a letter name: A B C D E F G.\n\n'
            'After G, the alphabet starts over at A — there is no H in music.\n\n'
            'The note C is always immediately to the LEFT of a group of 2 black keys.\n'
            'The note F is always immediately to the LEFT of a group of 3 black keys.\n\n'
            'Try finding every C on the keyboard — there are 8 of them!',
        diagramUrl: _Diagrams.keyboard,
        youtubeVideoId: _Videos.u1L03MusicalAlphabet,
      ),
    ),

    // ── b_04 ─────────────────────────────────────────────────────────────
    const LessonModel(
      id: 'b_04',
      title: 'Finding C, D & E',
      description:
          'Locate C, D, and E on the keyboard using the 2-black-key group as your landmark.',
      level: LessonLevel.beginner,
      path: LessonPath.both,
      durationMinutes: 7,
      content: LessonContent(
        conceptText:
            'Using a group of 2 black keys as your landmark:\n\n'
            '• C = white key immediately to the LEFT of the 2 black keys\n'
            '• D = white key IN BETWEEN the 2 black keys\n'
            '• E = white key immediately to the RIGHT of the 2 black keys\n\n'
            'Practice: close your eyes, open them, find C instantly. '
            'Then play C-D-E-D-C slowly, one key at a time.',
        diagramUrl: _Diagrams.keyboard,
        youtubeVideoId: _Videos.u1L04FindingCde,
        highlightedKeys: [60, 62, 64], // C4, D4, E4
        keyLabels: {60: 'C', 62: 'D', 64: 'E'},
      ),
    ),

    // ── b_05 ─────────────────────────────────────────────────────────────
    const LessonModel(
      id: 'b_05',
      title: 'Posture & Hand Shape',
      description:
          'Learn correct sitting posture, bench height, and the curved-finger hand position.',
      level: LessonLevel.beginner,
      path: LessonPath.both,
      durationMinutes: 5,
      content: LessonContent(
        conceptText:
            'Good posture prevents injury and makes playing easier:\n\n'
            '• Sit on the front half of the bench — not the back.\n'
            '• Feet flat on the floor (or on a footrest for children).\n'
            '• Elbows roughly level with the keys.\n'
            '• Curve your fingers as if holding a tennis ball — never play with flat fingers.\n'
            '• Wrists relaxed and level — not drooping below or arching above the keys.\n'
            '• Shoulders down and relaxed.\n\n'
            'Number your fingers 1–5: thumb = 1, pinky = 5. '
            'This numbering is the same for both hands.',
        diagramUrl: _Diagrams.keyboard,
        youtubeVideoId: _Videos.u1L05PostureJourney,
      ),
    ),

    // ── b_06 ─────────────────────────────────────────────────────────────
    const LessonModel(
      id: 'b_06',
      title: 'Finding F & G',
      description:
          'Locate F and G using the 3-black-key group, completing the C-D-E-F-G five-finger set.',
      level: LessonLevel.beginner,
      path: LessonPath.both,
      durationMinutes: 7,
      content: LessonContent(
        conceptText:
            'Using a group of 3 black keys as your landmark:\n\n'
            '• F = white key immediately to the LEFT of the 3 black keys\n'
            '• G = second white key from the left (between the 1st and 2nd black keys)\n\n'
            'Now you can play C-D-E-F-G (five notes in a row) with your right hand:\n'
            'Finger 1 on C, finger 2 on D, finger 3 on E, finger 4 on F, finger 5 on G.\n\n'
            'This is called the "C position." Practice going up (1-2-3-4-5) and back down (5-4-3-2-1).',
        diagramUrl: _Diagrams.keyboard,
        youtubeVideoId: _Videos.u1L07FindingFg,
        highlightedKeys: [60, 62, 64, 65, 67],
        keyLabels: {60: 'C', 62: 'D', 64: 'E', 65: 'F', 67: 'G'},
      ),
    ),

    // ── b_07 ─────────────────────────────────────────────────────────────
    const LessonModel(
      id: 'b_07',
      title: 'Finger Numbers',
      description:
          'Master the 1–5 finger numbering system for both hands — the universal language of piano fingering.',
      level: LessonLevel.beginner,
      path: LessonPath.both,
      durationMinutes: 5,
      content: LessonContent(
        conceptText:
            'Both hands use the same numbering system:\n\n'
            '• Finger 1 = Thumb\n'
            '• Finger 2 = Index finger\n'
            '• Finger 3 = Middle finger\n'
            '• Finger 4 = Ring finger\n'
            '• Finger 5 = Little finger (pinky)\n\n'
            'When you see a number above or below a note in sheet music, '
            'it tells you which finger to use. '
            'Practice: hold up your right hand, say "1-2-3-4-5" while wiggling each finger.',
        diagramUrl: _Diagrams.keyboard,
        youtubeVideoId: _Videos.u1L16FingerNumbers,
      ),
    ),

    // ── b_08 ─────────────────────────────────────────────────────────────
    const LessonModel(
      id: 'b_08',
      title: 'Five Woodpeckers — Right Hand Melody',
      description:
          'Play your first right-hand melody using C-D-E in C position.',
      level: LessonLevel.beginner,
      path: LessonPath.soloist,
      durationMinutes: 8,
      content: LessonContent(
        conceptText:
            '"Five Woodpeckers" is a simple melody that uses only C, D, and E.\n\n'
            'Place your right hand in C position (finger 1 on C4, fingers 2–5 on D-E-F-G).\n\n'
            'The melody taps on E (finger 3) repeatedly, then moves to D (finger 2) and C (finger 1). '
            'Like a woodpecker tapping on a tree!\n\n'
            'Focus on:\n'
            '• Keeping curved fingers\n'
            '• Playing each note clearly\n'
            '• Counting "1-2-3-4" steadily',
        diagramUrl: _Diagrams.keyboard,
        youtubeVideoId: _Videos.u1L08FiveWoodpeckers,
        highlightedKeys: [60, 62, 64],
        keyLabels: {60: 'C', 62: 'D', 64: 'E'},
      ),
    ),

    // ── b_09 ─────────────────────────────────────────────────────────────
    const LessonModel(
      id: 'b_09',
      title: 'Finding A & B',
      description:
          'Complete the musical alphabet on the keyboard by locating A and B.',
      level: LessonLevel.beginner,
      path: LessonPath.both,
      durationMinutes: 7,
      content: LessonContent(
        conceptText:
            'Using the 3-black-key group:\n\n'
            '• A = third white key from the left of the 3 black keys (between 2nd and 3rd black key)\n'
            '• B = white key immediately to the RIGHT of all 3 black keys\n\n'
            'Now you know all 7 white-key names: C D E F G A B.\n\n'
            'Challenge: starting from any C, name every white key going right until you reach the next C. '
            'C D E F G A B — then C again. That is one octave.',
        diagramUrl: _Diagrams.keyboard,
        youtubeVideoId: _Videos.u1L11FindingAb,
        highlightedKeys: [57, 59],
        keyLabels: {57: 'A', 59: 'B'},
      ),
    ),

    // ── b_10 ─────────────────────────────────────────────────────────────
    const LessonModel(
      id: 'b_10',
      title: 'Quarter Notes & the Beat',
      description:
          'Understand quarter notes and learn to keep a steady beat — the foundation of all rhythm.',
      level: LessonLevel.beginner,
      path: LessonPath.both,
      durationMinutes: 8,
      content: LessonContent(
        conceptText:
            'A quarter note (♩) lasts for ONE beat.\n\n'
            'In 4/4 time there are 4 beats per measure:\n'
            '"1 - 2 - 3 - 4 | 1 - 2 - 3 - 4"\n\n'
            'The beat is the steady pulse of music — like a clock ticking or a heart beating. '
            'Every other rhythm value is measured against the beat.\n\n'
            'Practice: tap your foot steadily and clap on each beat while counting out loud. '
            'Then play single notes on a piano key, one per beat.',
        diagramUrl: _Diagrams.musicNotation,
        youtubeVideoId: _Videos.u1L18HalfNotes,
      ),
    ),

    // ── b_11 ─────────────────────────────────────────────────────────────
    const LessonModel(
      id: 'b_11',
      title: 'Half Notes & Whole Notes',
      description:
          'Add half notes (2 beats) and whole notes (4 beats) to your rhythmic vocabulary.',
      level: LessonLevel.beginner,
      path: LessonPath.both,
      durationMinutes: 8,
      content: LessonContent(
        conceptText:
            'Three essential note values:\n\n'
            '• Quarter note (♩) = 1 beat — filled note head with a stem\n'
            '• Half note (𝅗𝅥) = 2 beats — open note head with a stem\n'
            '• Whole note (𝅝) = 4 beats — open note head, no stem\n\n'
            'Memory trick: a whole note = 2 half notes = 4 quarter notes.\n\n'
            'Clap this rhythm and count: quarter, quarter, half | quarter, quarter, WHOLE\n'
            '"1 - 2 - 3-4 | 1 - 2 - 3-4-5-6-7-8"',
        diagramUrl: _Diagrams.musicNotation,
        youtubeVideoId: _Videos.u1L18HalfNotes,
      ),
    ),

    // ── b_12 ─────────────────────────────────────────────────────────────
    const LessonModel(
      id: 'b_12',
      title: 'Frog in the Middle',
      description:
          'Play your first complete hands-separate piece using C, D, and E.',
      level: LessonLevel.beginner,
      path: LessonPath.soloist,
      durationMinutes: 10,
      content: LessonContent(
        conceptText:
            '"Frog in the Middle" is one of the first full pieces in the Hoffman Academy method.\n\n'
            'It uses:\n'
            '• Notes C, D, and E in the right hand (fingers 1, 2, 3)\n'
            '• A mix of quarter notes and half notes\n'
            '• 4/4 time signature\n\n'
            'Steps to learn any new piece:\n'
            '1. Clap and count the rhythm first\n'
            '2. Name the notes\n'
            '3. Play slowly, hands separate\n'
            '4. Only combine hands when each hand is comfortable alone',
        diagramUrl: _Diagrams.grandStaff,
        youtubeVideoId: _Videos.u1L10FrogMiddle,
        highlightedKeys: [60, 62, 64],
        keyLabels: {60: 'C', 62: 'D', 64: 'E'},
      ),
    ),

    // ── b_13 ─────────────────────────────────────────────────────────────
    const LessonModel(
      id: 'b_13',
      title: 'The Treble Clef Staff',
      description:
          'Decode the treble clef — the right-hand staff — and read your first written notes.',
      level: LessonLevel.beginner,
      path: LessonPath.soloist,
      durationMinutes: 10,
      content: LessonContent(
        conceptText:
            'Music is written on a STAFF: five lines with four spaces between them.\n\n'
            'The TREBLE CLEF (𝄞) marks the staff for your right hand (higher notes).\n\n'
            'Lines from bottom to top: E G B D F\n'
            '→ Mnemonic: "Every Good Boy Does Fine"\n\n'
            'Spaces from bottom to top: F A C E\n'
            '→ Mnemonic: "FACE in the space"\n\n'
            'The higher a note sits on the staff, the higher it sounds on the piano.\n'
            'A note\'s shape tells you how long to hold it.',
        diagramUrl: _Diagrams.trebleClef,
        youtubeVideoId: _Videos.u2L26TrebleStaff,
      ),
    ),

    // ── b_14 ─────────────────────────────────────────────────────────────
    const LessonModel(
      id: 'b_14',
      title: 'Reading CDEFG on the Staff',
      description:
          'Match the five notes of C position to their positions on the treble clef staff.',
      level: LessonLevel.beginner,
      path: LessonPath.soloist,
      durationMinutes: 10,
      content: LessonContent(
        conceptText:
            'Middle C (C4) sits on a SHORT line below the treble staff called a LEDGER LINE.\n\n'
            'Going up from Middle C on the treble staff:\n'
            '• C4 = ledger line below staff\n'
            '• D4 = just below the first staff line\n'
            '• E4 = first line (bottom line) of staff\n'
            '• F4 = first space (between lines 1 and 2)\n'
            '• G4 = second line of staff\n\n'
            'Practice: point to each note on the staff diagram and say its name before playing.',
        diagramUrl: _Diagrams.trebleClef,
        youtubeVideoId: _Videos.u2L26TrebleStaff,
        highlightedKeys: [60, 62, 64, 65, 67],
        keyLabels: {60: 'C', 62: 'D', 64: 'E', 65: 'F', 67: 'G'},
      ),
    ),

    // ── b_15 ─────────────────────────────────────────────────────────────
    const LessonModel(
      id: 'b_15',
      title: 'Chocolate — First Complete Song',
      description:
          'Play "Chocolate", a full piece using notes C through G with quarter and half notes.',
      level: LessonLevel.beginner,
      path: LessonPath.soloist,
      durationMinutes: 10,
      content: LessonContent(
        conceptText:
            '"Chocolate" is one of the most loved beginner pieces from Hoffman Academy.\n\n'
            'What you will practice:\n'
            '• Reading notes on the treble staff\n'
            '• Mixing quarter notes and half notes in 4/4 time\n'
            '• Playing a full melody smoothly from start to finish\n\n'
            'Learning strategy:\n'
            '1. Identify all the notes by name before you play\n'
            '2. Clap the rhythm while counting beats\n'
            '3. Play slowly (about 50 BPM) until every note is correct\n'
            '4. Gradually increase your speed',
        diagramUrl: _Diagrams.grandStaff,
        youtubeVideoId: _Videos.u1L13Chocolate,
      ),
    ),

    // ── b_16 ─────────────────────────────────────────────────────────────
    const LessonModel(
      id: 'b_16',
      title: 'The Bass Clef Staff',
      description:
          'Learn the bass clef — the left-hand staff — and read its lines and spaces.',
      level: LessonLevel.beginner,
      path: LessonPath.soloist,
      durationMinutes: 10,
      content: LessonContent(
        conceptText:
            'The BASS CLEF (𝄢) marks the staff for your left hand (lower notes).\n\n'
            'Lines from bottom to top: G B D F A\n'
            '→ Mnemonic: "Good Boys Do Fine Always"\n\n'
            'Spaces from bottom to top: A C E G\n'
            '→ Mnemonic: "All Cows Eat Grass"\n\n'
            'Middle C (C4) sits just ABOVE the top of the bass staff on a ledger line.\n\n'
            'The GRAND STAFF combines treble and bass staves with a brace — '
            'treble on top for the right hand, bass on the bottom for the left hand.',
        diagramUrl: _Diagrams.grandStaff,
        youtubeVideoId: _Videos.u2L30BassStaff,
      ),
    ),

    // ── b_17 ─────────────────────────────────────────────────────────────
    const LessonModel(
      id: 'b_17',
      title: 'Left Hand C Position',
      description:
          'Place your left hand in C position and play your first left-hand melody.',
      level: LessonLevel.beginner,
      path: LessonPath.soloist,
      durationMinutes: 10,
      content: LessonContent(
        conceptText:
            'Left hand C position: place finger 5 (pinky) on C3, finger 4 on D3, '
            'finger 3 on E3, finger 2 on F3, finger 1 (thumb) on G3.\n\n'
            'Notice it is the MIRROR IMAGE of the right hand — the thumb is in the middle, '
            'not at the outside.\n\n'
            'Left hand C notes on the bass staff:\n'
            '• C3 = second space from top of bass staff\n'
            '• D3 = second line from top\n'
            '• E3 = top space\n'
            '• F3 = top line\n'
            '• G3 = ledger line just above bass staff\n\n'
            'Play C-D-E-F-G up and back down with your left hand.',
        diagramUrl: _Diagrams.grandStaff,
        youtubeVideoId: _Videos.u2L30BassStaff,
        highlightedKeys: [48, 50, 52, 53, 55],
        keyLabels: {48: 'C', 50: 'D', 52: 'E', 53: 'F', 55: 'G'},
      ),
    ),

    // ── b_18 ─────────────────────────────────────────────────────────────
    const LessonModel(
      id: 'b_18',
      title: 'Dynamics — Loud & Soft',
      description:
          'Add expression by learning forte (loud) and piano (soft) dynamic markings.',
      level: LessonLevel.beginner,
      path: LessonPath.both,
      durationMinutes: 7,
      content: LessonContent(
        conceptText:
            'DYNAMICS tell you how loud or soft to play. The main symbols come from Italian:\n\n'
            '• p = piano = SOFT\n'
            '• mp = mezzo-piano = medium soft\n'
            '• mf = mezzo-forte = medium loud\n'
            '• f = forte = LOUD\n\n'
            'A crescendo (<) means gradually get louder.\n'
            'A decrescendo or diminuendo (>) means gradually get softer.\n\n'
            'Dynamics bring music to life. The same melody played loudly versus softly '
            'creates completely different emotions.',
        diagramUrl: _Diagrams.musicNotation,
        youtubeVideoId: _Videos.u1L08FiveWoodpeckers,
      ),
    ),

    // ── b_19 ─────────────────────────────────────────────────────────────
    const LessonModel(
      id: 'b_19',
      title: 'The I Chord (Tonic)',
      description:
          'Play your first chord — the C major triad — and understand why it sounds "home".',
      level: LessonLevel.beginner,
      path: LessonPath.chords,
      durationMinutes: 8,
      content: LessonContent(
        conceptText:
            'A CHORD is three or more notes played at the same time.\n\n'
            'C major chord = C + E + G played together.\n'
            'In C position: press fingers 1, 3, and 5 at the same time.\n\n'
            'This chord is called the TONIC or the I chord (Roman numeral 1) in the key of C. '
            'It sounds stable and finished — like arriving home.\n\n'
            'Practice: left hand plays the C major chord while right hand plays the melody. '
            'Hold the chord for 4 beats while counting.',
        diagramUrl: _Diagrams.cMajChord,
        youtubeVideoId: _Videos.u1L20FrogChords,
        highlightedKeys: [48, 52, 55],
        keyLabels: {48: 'C', 52: 'E', 55: 'G'},
      ),
    ),

    // ── b_20 ─────────────────────────────────────────────────────────────
    const LessonModel(
      id: 'b_20',
      title: 'The V7 Chord (Dominant)',
      description:
          'Add the G7 chord to your toolkit and feel the tension-and-release between V7 and I.',
      level: LessonLevel.beginner,
      path: LessonPath.chords,
      durationMinutes: 8,
      content: LessonContent(
        conceptText:
            'The V7 chord in the key of C is G7 = G + B + D + F.\n\n'
            'A beginner-friendly left-hand V7 voicing uses just two notes: B and F '
            '(fingers 2 and 5 in C position).\n\n'
            'G7 creates TENSION — it wants to resolve back to C major. '
            'This push-pull between V7 (tension) and I (resolution) is the most powerful '
            'force in Western music. You hear it at the end of almost every song.\n\n'
            'Practice: alternate I → V7 → I slowly, listening to the tension and release.',
        diagramUrl: _Diagrams.cMajChord,
        youtubeVideoId: _Videos.u2L37V7Chord,
        highlightedKeys: [47, 50, 53, 55],
        keyLabels: {55: 'G', 59: 'B', 50: 'D', 53: 'F'},
      ),
    ),

    // ── b_21 ─────────────────────────────────────────────────────────────
    const LessonModel(
      id: 'b_21',
      title: 'Stepping & Skipping',
      description:
          'Recognise melodic steps (2nds) and skips (3rds) by sight and by ear.',
      level: LessonLevel.beginner,
      path: LessonPath.soloist,
      durationMinutes: 8,
      content: LessonContent(
        conceptText:
            'Notes on the staff move in two basic ways:\n\n'
            '• STEP (2nd interval): a note moves to the very next line or space. '
            'On the keyboard, a step moves one white key.\n'
            '• SKIP (3rd interval): a note jumps over one line or space. '
            'On the keyboard, a skip moves two white keys.\n\n'
            'Pattern: line → line = skip; line → space = step.\n\n'
            'Being able to recognise steps and skips instantly makes sight-reading much faster '
            'because you read the SHAPE of the music, not just individual note names.',
        diagramUrl: _Diagrams.grandStaff,
        youtubeVideoId: _Videos.u2L26TrebleStaff,
      ),
    ),

    // ── b_22 ─────────────────────────────────────────────────────────────
    const LessonModel(
      id: 'b_22',
      title: 'Time Signatures: 4/4 and 3/4',
      description:
          'Understand what time signatures mean and feel the difference between 4-beat and 3-beat patterns.',
      level: LessonLevel.beginner,
      path: LessonPath.both,
      durationMinutes: 8,
      content: LessonContent(
        conceptText:
            'A TIME SIGNATURE appears at the start of a piece as two stacked numbers:\n\n'
            '• The TOP number = how many beats per measure\n'
            '• The BOTTOM number = what kind of note gets one beat (4 = quarter note)\n\n'
            '4/4 = four quarter-note beats per measure ("1-2-3-4")\n'
            '3/4 = three quarter-note beats per measure ("1-2-3")\n\n'
            '3/4 is WALTZ time — accent beat 1, lighter on beats 2 and 3. '
            'Famous 3/4 pieces: Happy Birthday, Edelweiss, Für Elise.',
        diagramUrl: _Diagrams.musicNotation,
        youtubeVideoId: _Videos.u1L18HalfNotes,
      ),
    ),

    // ── b_23 ─────────────────────────────────────────────────────────────
    const LessonModel(
      id: 'b_23',
      title: 'Sharps & Flats',
      description:
          'Learn what sharps and flats are and find them on the keyboard.',
      level: LessonLevel.beginner,
      path: LessonPath.both,
      durationMinutes: 8,
      content: LessonContent(
        conceptText:
            'The black keys have names too!\n\n'
            '• A SHARP (♯) raises a note by one half step (one key to the right).\n'
            '• A FLAT (♭) lowers a note by one half step (one key to the left).\n\n'
            'The black key between C and D is called C♯ (C-sharp) OR D♭ (D-flat).\n'
            'The same key can have two names — this is called ENHARMONIC equivalence.\n\n'
            'A NATURAL sign (♮) cancels a sharp or flat.\n\n'
            'Half step = the smallest musical distance (one key, black or white, to the next).\n'
            'Whole step = two half steps.',
        diagramUrl: _Diagrams.keyboard,
        youtubeVideoId: _Videos.u1L03MusicalAlphabet,
      ),
    ),

    // ── b_24 ─────────────────────────────────────────────────────────────
    const LessonModel(
      id: 'b_24',
      title: 'The D Major Pentascale',
      description:
          'Shift your hand position to D and practice a five-finger pattern with your first sharp.',
      level: LessonLevel.beginner,
      path: LessonPath.both,
      durationMinutes: 10,
      content: LessonContent(
        conceptText:
            'Moving your hand off C position opens up a whole new world of sounds.\n\n'
            'D Major pentascale: D E F♯ G A\n'
            '→ Place finger 1 on D4. The F♯ is the black key between F and G.\n\n'
            'Why does D major have F♯?\n'
            'Every major pentascale follows the same interval pattern:\n'
            'whole - whole - half - whole (W W H W)\n'
            'Starting on D, this pattern naturally lands on F♯ instead of F.\n\n'
            'Practice: play D-E-F♯-G-A up and down with the right hand.',
        diagramUrl: _Diagrams.keyboard,
        youtubeVideoId: _Videos.u1L13Chocolate,
        highlightedKeys: [62, 64, 66, 67, 69],
        keyLabels: {62: 'D', 64: 'E', 66: 'F#', 67: 'G', 69: 'A'},
      ),
    ),

    // ── b_25 ─────────────────────────────────────────────────────────────
    const LessonModel(
      id: 'b_25',
      title: 'G Major Pentascale',
      description:
          'Learn the G major five-finger position — one of the most used keys in music.',
      level: LessonLevel.beginner,
      path: LessonPath.both,
      durationMinutes: 10,
      content: LessonContent(
        conceptText:
            'G Major pentascale: G A B C D\n'
            '→ Place finger 1 on G3 (left hand) or G4 (right hand).\n'
            '→ All white keys — no sharps in this five-note range!\n\n'
            'G major is one of the most important keys in music. '
            'It is used in folk songs, pop, rock, and countless classical pieces.\n\n'
            'Songs you can play in G major with just these five notes:\n'
            '• "Mary Had a Little Lamb"\n'
            '• "Joy to the World"\n'
            '• Many folk melodies',
        diagramUrl: _Diagrams.keyboard,
        youtubeVideoId: _Videos.u1L20FrogChords,
        highlightedKeys: [55, 57, 59, 60, 62],
        keyLabels: {55: 'G', 57: 'A', 59: 'B', 60: 'C', 62: 'D'},
      ),
    ),

    // ── b_26 ─────────────────────────────────────────────────────────────
    const LessonModel(
      id: 'b_26',
      title: 'Minor Pentascales',
      description:
          'Hear the difference between major (happy) and minor (sad) by changing one note.',
      level: LessonLevel.beginner,
      path: LessonPath.both,
      durationMinutes: 10,
      content: LessonContent(
        conceptText:
            'To turn a major pentascale into a minor pentascale, '
            'lower the THIRD note by one half step.\n\n'
            'C Major pentascale: C D E F G\n'
            'C Minor pentascale: C D E♭ F G  (E drops to E♭)\n\n'
            'That one change — E to E♭ — transforms the sound from bright to melancholic.\n\n'
            'Famous minor-key pieces:\n'
            '• "Greensleeves" (A minor)\n'
            '• Beethoven\'s "Für Elise" opening theme (A minor)\n'
            '• "Scarborough Fair"',
        diagramUrl: _Diagrams.keyboard,
        youtubeVideoId: _Videos.u2L38MinorPenta,
        highlightedKeys: [60, 62, 63, 65, 67],
        keyLabels: {60: 'C', 62: 'D', 63: 'Eb', 65: 'F', 67: 'G'},
      ),
    ),

    // ── b_27 ─────────────────────────────────────────────────────────────
    const LessonModel(
      id: 'b_27',
      title: 'Ode to Joy',
      description:
          'Play Beethoven\'s Ode to Joy — your first piece by a major classical composer.',
      level: LessonLevel.beginner,
      path: LessonPath.soloist,
      durationMinutes: 10,
      content: LessonContent(
        conceptText:
            'Ode to Joy is from the final movement of Beethoven\'s 9th Symphony (1824). '
            'It is one of the most famous melodies ever written — '
            'and it fits perfectly in C position!\n\n'
            'The simplified version uses:\n'
            '• Right hand: notes E, F, G (the top three notes of C position)\n'
            '• Rhythm: mostly quarter notes with some half notes\n'
            '• Time signature: 4/4\n\n'
            'Beethoven wrote this symphony while completely deaf. '
            'He never heard it performed — a remarkable achievement in music history.',
        diagramUrl: _Diagrams.grandStaff,
        youtubeVideoId: _Videos.u1L08FiveWoodpeckers,
        highlightedKeys: [64, 65, 67],
        keyLabels: {64: 'E', 65: 'F', 67: 'G'},
      ),
    ),

    // ── b_28 ─────────────────────────────────────────────────────────────
    const LessonModel(
      id: 'b_28',
      title: 'Phrasing & Legato',
      description:
          'Learn to play phrases smoothly and connect notes with legato technique.',
      level: LessonLevel.beginner,
      path: LessonPath.both,
      durationMinutes: 10,
      content: LessonContent(
        conceptText:
            'In music, a PHRASE is a musical idea — like a sentence in speech. '
            'Melodies are built from phrases, usually 2 or 4 measures long.\n\n'
            'LEGATO means smooth and connected — hold each note until the next one begins, '
            'with no gap between them. A curved line (slur) over notes means legato.\n\n'
            'STACCATO means short and detached — play the note and release quickly. '
            'Shown by a dot above or below the note head.\n\n'
            'Legato creates warmth and singing tone. Staccato creates energy and bounce. '
            'Great musicians mix both to tell a musical story.',
        diagramUrl: _Diagrams.musicNotation,
        youtubeVideoId: _Videos.u1L13Chocolate,
      ),
    ),

    // ── b_29 ─────────────────────────────────────────────────────────────
    const LessonModel(
      id: 'b_29',
      title: 'Eighth Notes',
      description:
          'Double the speed of your rhythms by learning eighth notes — two per beat.',
      level: LessonLevel.beginner,
      path: LessonPath.both,
      durationMinutes: 8,
      content: LessonContent(
        conceptText:
            'An EIGHTH NOTE (♪) lasts for HALF a beat — two fit in the space of one quarter note.\n\n'
            'To count eighth notes, add "and" between the beats:\n'
            '"1-and-2-and-3-and-4-and"\n\n'
            'Eighth notes are written with a flag on their stem, '
            'or connected in pairs with a beam.\n\n'
            'Clap this rhythm: quarter, two-eighths, quarter, two-eighths\n'
            '"1 | 2-and | 3 | 4-and"\n\n'
            'Songs with lots of eighth notes: "Jingle Bells", "When the Saints Go Marching In"',
        diagramUrl: _Diagrams.musicNotation,
        youtubeVideoId: _Videos.u1L18HalfNotes,
      ),
    ),

    // ── b_30 ─────────────────────────────────────────────────────────────
    const LessonModel(
      id: 'b_30',
      title: 'Hands Together — C Position',
      description:
          'Combine both hands in C position for the first time, playing a simple accompaniment.',
      level: LessonLevel.beginner,
      path: LessonPath.both,
      durationMinutes: 12,
      content: LessonContent(
        conceptText:
            'Playing hands together is one of the biggest milestones for a beginner.\n\n'
            'The key is to learn each hand ALONE first — really well — before combining.\n\n'
            'A classic beginner texture:\n'
            '• RIGHT HAND: plays the melody (Ode to Joy or similar)\n'
            '• LEFT HAND: holds a whole-note C chord (C + E + G) for 4 beats\n\n'
            'Start at a very slow tempo (40–50 BPM). Your brain is creating new motor pathways '
            'that take time to form. Slow, correct repetition is more valuable than fast, '
            'sloppy repetition.',
        diagramUrl: _Diagrams.grandStaff,
        youtubeVideoId: _Videos.u1L20FrogChords,
        highlightedKeys: [48, 52, 55, 64, 65, 67],
        keyLabels: {48: 'C', 52: 'E', 55: 'G'},
      ),
    ),

    // ════════════════════════════════════════════════════════════════════════
    // INTERMEDIATE  (20 lessons  ·  ~6 months – ~2 years)
    // ════════════════════════════════════════════════════════════════════════

    // ── i_01 ─────────────────────────────────────────────────────────────
    const LessonModel(
      id: 'i_01',
      title: 'C Major Scale — Full Octave',
      description:
          'Play the C major scale across one full octave with correct thumb-under technique.',
      level: LessonLevel.intermediate,
      path: LessonPath.both,
      durationMinutes: 12,
      content: LessonContent(
        conceptText:
            'A SCALE is a sequence of notes in alphabetical order from one note to the same '
            'note an octave higher: C D E F G A B C.\n\n'
            'Right hand fingering: 1 2 3 | (thumb under) 1 2 3 4 5\n'
            'Left hand fingering: 5 4 3 2 1 | (thumb under) 3 2 1\n\n'
            'The THUMB UNDER technique is crucial: as finger 3 plays E (right hand), '
            'silently tuck the thumb under so it is ready on F. '
            'The wrist should stay level and still — no rocking.\n\n'
            'Start at 60 BPM hands separate. When each hand is fluent, combine at 50 BPM.',
        diagramUrl: _Diagrams.keyboard,
        youtubeVideoId: _Videos.u1L06CBoogie,
        highlightedKeys: [60, 62, 64, 65, 67, 69, 71, 72],
        keyLabels: {60: 'C', 62: 'D', 64: 'E', 65: 'F', 67: 'G', 69: 'A', 71: 'B', 72: 'C'},
      ),
    ),

    // ── i_02 ─────────────────────────────────────────────────────────────
    const LessonModel(
      id: 'i_02',
      title: 'G Major Scale',
      description:
          'Learn the G major scale — the first scale with a key signature sharp (F♯).',
      level: LessonLevel.intermediate,
      path: LessonPath.both,
      durationMinutes: 12,
      content: LessonContent(
        conceptText:
            'G major scale: G A B C D E F♯ G\n\n'
            'The F♯ is what makes G major sound "major" — without it the scale would be different.\n\n'
            'Right hand fingering: 1 2 3 | (thumb under) 1 2 3 4 5\n'
            'Left hand fingering: 5 4 3 2 1 | (thumb under) 3 2 1\n\n'
            'KEY SIGNATURE: In written music, a single sharp (F♯) at the start of every staff '
            'means "every F in this piece is played as F♯." '
            'You don\'t have to write the ♯ next to every note.\n\n'
            'Songs in G major: "Twinkle Twinkle", "Morning Has Broken", "Country Roads"',
        diagramUrl: _Diagrams.keyboard,
        youtubeVideoId: _Videos.u1L20FrogChords,
        highlightedKeys: [55, 57, 59, 60, 62, 64, 66, 67],
        keyLabels: {55: 'G', 57: 'A', 59: 'B', 60: 'C', 62: 'D', 64: 'E', 66: 'F#', 67: 'G'},
      ),
    ),

    // ── i_03 ─────────────────────────────────────────────────────────────
    const LessonModel(
      id: 'i_03',
      title: 'F Major Scale',
      description:
          'Learn the F major scale — the first scale with a key signature flat (B♭).',
      level: LessonLevel.intermediate,
      path: LessonPath.both,
      durationMinutes: 12,
      content: LessonContent(
        conceptText:
            'F major scale: F G A B♭ C D E F\n\n'
            'The B♭ is the characteristic note of F major.\n\n'
            'Right hand fingering: 1 2 3 4 | (thumb under) 1 2 3 4\n'
            '(Note: 4th finger on B♭, not 3rd like most scales — this avoids the thumb on a black key)\n\n'
            'Left hand fingering: 5 4 3 2 1 | (thumb under) 3 2 1\n\n'
            'KEY SIGNATURE: one flat (B♭) at the start of the staff.\n\n'
            'Songs in F major: "Happy Birthday", "Oh When the Saints", "This Old Man"',
        diagramUrl: _Diagrams.keyboard,
        youtubeVideoId: _Videos.u1L07FindingFg,
        highlightedKeys: [53, 55, 57, 58, 60, 62, 64, 65],
        keyLabels: {53: 'F', 55: 'G', 57: 'A', 58: 'Bb', 60: 'C', 62: 'D', 64: 'E', 65: 'F'},
      ),
    ),

    // ── i_04 ─────────────────────────────────────────────────────────────
    const LessonModel(
      id: 'i_04',
      title: 'Hands Together — Scale Practice',
      description:
          'Play C major scale hands together and build two-hand coordination.',
      level: LessonLevel.intermediate,
      path: LessonPath.both,
      durationMinutes: 12,
      content: LessonContent(
        conceptText:
            'Hands together scale practice is a cornerstone of piano technique.\n\n'
            'C major, hands together (contrary motion first): '
            'both thumbs start on middle C, right hand goes UP while left hand goes DOWN. '
            'They mirror each other — same finger numbers, opposite directions. '
            'This is easier than parallel motion because both thumb crossings happen simultaneously.\n\n'
            'Parallel motion (both hands go in the same direction) is harder because '
            'thumb crossings happen at different moments.\n\n'
            'Practice with a METRONOME. Start at 52 BPM (one note per click). '
            'Only increase the tempo when every note is even and clean.',
        diagramUrl: _Diagrams.keyboard,
        youtubeVideoId: _Videos.u1L06CBoogie,
      ),
    ),

    // ── i_05 ─────────────────────────────────────────────────────────────
    const LessonModel(
      id: 'i_05',
      title: 'A Natural Minor Scale',
      description:
          'Discover the natural minor scale and how it creates a darker, sadder sound.',
      level: LessonLevel.intermediate,
      path: LessonPath.both,
      durationMinutes: 12,
      content: LessonContent(
        conceptText:
            'A natural minor scale: A B C D E F G A — all white keys!\n\n'
            'Compare with C major (also all white keys): the minor scale starts on A '
            'and its interval pattern is different: W H W W H W W.\n\n'
            'A minor is the RELATIVE MINOR of C major — they share the same key signature (no sharps or flats).\n\n'
            'Right hand fingering: 1 2 3 | (thumb under) 1 2 3 4 5\n'
            'Left hand fingering: 5 4 3 2 1 | (thumb under) 3 2 1\n\n'
            'Famous pieces in A minor: Für Elise, Toccata & Fugue in D minor (sounds similar), '
            'House of the Rising Sun.',
        diagramUrl: _Diagrams.keyboard,
        youtubeVideoId: _Videos.u2L38MinorPenta,
        highlightedKeys: [57, 59, 60, 62, 64, 65, 67, 69],
        keyLabels: {57: 'A', 59: 'B', 60: 'C', 62: 'D', 64: 'E', 65: 'F', 67: 'G', 69: 'A'},
      ),
    ),

    // ── i_06 ─────────────────────────────────────────────────────────────
    const LessonModel(
      id: 'i_06',
      title: 'Chord Inversions',
      description:
          'Rearrange chord notes to create first and second inversions for smoother voice leading.',
      level: LessonLevel.intermediate,
      path: LessonPath.chords,
      durationMinutes: 12,
      content: LessonContent(
        conceptText:
            'When you rearrange the notes of a chord so a different note is on the bottom, '
            'that is an INVERSION.\n\n'
            'C major chord: C E G\n'
            '• Root position: C on bottom → C E G\n'
            '• 1st inversion: E on bottom → E G C\n'
            '• 2nd inversion: G on bottom → G C E\n\n'
            'All three contain the same three notes — just in different order.\n\n'
            'WHY inversions matter: when you move from C major to F major, '
            'using inversions lets you move with the smallest possible hand movement '
            'instead of jumping. This is called SMOOTH VOICE LEADING.',
        diagramUrl: _Diagrams.cMajChord,
        youtubeVideoId: _Videos.u2L37V7Chord,
        highlightedKeys: [60, 64, 67],
        keyLabels: {60: 'C', 64: 'E', 67: 'G'},
      ),
    ),

    // ── i_07 ─────────────────────────────────────────────────────────────
    const LessonModel(
      id: 'i_07',
      title: 'The I–IV–V Progression',
      description:
          'Master the three primary chords in C major and play the progression found in hundreds of songs.',
      level: LessonLevel.intermediate,
      path: LessonPath.chords,
      durationMinutes: 15,
      content: LessonContent(
        conceptText:
            'In the key of C major, the three primary chords are:\n\n'
            '• I chord (Tonic): C major = C E G\n'
            '• IV chord (Subdominant): F major = F A C\n'
            '• V chord (Dominant): G major = G B D\n\n'
            'The I-IV-V-I progression is the foundation of blues, folk, pop, rock, and gospel.\n\n'
            'Smooth voice leading version (left hand):\n'
            '  C major root: C E G\n'
            '  F major 2nd inversion: C F A (barely move!)\n'
            '  G major 1st inversion: B D G\n'
            '  C major root: C E G\n\n'
            'Songs using I-IV-V: "La Bamba", "Twist and Shout", "Wild Thing", "Johnny B. Goode"',
        diagramUrl: _Diagrams.circleOfFifths,
        youtubeVideoId: _Videos.u2L37V7Chord,
        highlightedKeys: [48, 52, 55],
        keyLabels: {48: 'C', 52: 'E', 55: 'G'},
      ),
    ),

    // ── i_08 ─────────────────────────────────────────────────────────────
    const LessonModel(
      id: 'i_08',
      title: 'The Damper Pedal',
      description:
          'Use the right pedal to sustain notes and create a rich, connected sound.',
      level: LessonLevel.intermediate,
      path: LessonPath.both,
      durationMinutes: 10,
      content: LessonContent(
        conceptText:
            'The DAMPER PEDAL (rightmost pedal) lifts all the dampers off the strings, '
            'letting them vibrate freely — creating a sustained, resonant sound.\n\n'
            'Syncopated (legato) pedaling technique:\n'
            '1. Play the note or chord\n'
            '2. THEN press the pedal (a split-second after the note)\n'
            '3. Release the pedal just BEFORE you change harmony\n'
            '4. Press it again immediately after the new harmony sounds\n\n'
            'This keeps the sound smooth without muddying different harmonies together.\n\n'
            'A pedal marking in sheet music looks like: Ped. ... *',
        diagramUrl: _Diagrams.keyboard,
        youtubeVideoId: _Videos.u2L30BassStaff,
      ),
    ),

    // ── i_09 ─────────────────────────────────────────────────────────────
    const LessonModel(
      id: 'i_09',
      title: 'Dotted Notes & Ties',
      description:
          'Add dotted quarter notes and tied notes to play more complex rhythmic patterns.',
      level: LessonLevel.intermediate,
      path: LessonPath.both,
      durationMinutes: 10,
      content: LessonContent(
        conceptText:
            'A DOT after a note increases its value by half:\n'
            '• Dotted half note = 2 + 1 = 3 beats\n'
            '• Dotted quarter note = 1 + ½ = 1½ beats\n\n'
            'A TIE is a curved line connecting two notes of the SAME pitch — '
            'hold the first note for the combined value (do NOT re-strike the second note).\n\n'
            'Example: tie a quarter note to a half note → hold for 3 beats.\n\n'
            'Dotted quarter + eighth note is one of the most common rhythmic patterns in music. '
            'You hear it constantly in marches, folk songs, and hymns.',
        diagramUrl: _Diagrams.musicNotation,
        youtubeVideoId: _Videos.u1L18HalfNotes,
      ),
    ),

    // ── i_10 ─────────────────────────────────────────────────────────────
    const LessonModel(
      id: 'i_10',
      title: 'D Major & E Major Scales',
      description:
          'Expand your scale knowledge to D and E major, adding two and four sharps.',
      level: LessonLevel.intermediate,
      path: LessonPath.both,
      durationMinutes: 12,
      content: LessonContent(
        conceptText:
            'D major scale: D E F♯ G A B C♯ D (2 sharps: F♯ C♯)\n'
            'E major scale: E F♯ G♯ A B C♯ D♯ E (4 sharps: F♯ C♯ G♯ D♯)\n\n'
            'Notice: each time you move up a fifth and add a new scale, '
            'you gain one more sharp. This is the CIRCLE OF FIFTHS pattern.\n\n'
            'Right hand fingering for both: 1 2 3 | thumb under | 1 2 3 4 5\n\n'
            'For scales with black keys, the thumb usually avoids the black keys — '
            'this is why the fingering sometimes changes.',
        diagramUrl: _Diagrams.circleOfFifths,
        youtubeVideoId: _Videos.u1L04FindingCde,
        highlightedKeys: [62, 64, 66, 67, 69, 71, 73, 74],
        keyLabels: {62: 'D', 64: 'E', 66: 'F#', 67: 'G', 69: 'A', 71: 'B', 73: 'C#', 74: 'D'},
      ),
    ),

    // ── i_11 ─────────────────────────────────────────────────────────────
    const LessonModel(
      id: 'i_11',
      title: 'Alberti Bass Pattern',
      description:
          'Learn the classic left-hand accompaniment pattern used throughout the Classical era.',
      level: LessonLevel.intermediate,
      path: LessonPath.both,
      durationMinutes: 12,
      content: LessonContent(
        conceptText:
            'The ALBERTI BASS is a broken-chord left-hand pattern common in Classical-era music.\n\n'
            'Instead of playing a chord all at once, you play the notes in this order:\n'
            'BOTTOM - TOP - MIDDLE - TOP (repeating)\n\n'
            'For C major: C - G - E - G | C - G - E - G\n\n'
            'This pattern creates a flowing, rhythmic accompaniment without crowding the melody.\n'
            'It appears in hundreds of pieces:\n'
            '• Mozart Sonata in C major (K. 545)\n'
            '• Beethoven Sonata "Pathétique"\n'
            '• Clementi Sonatinas\n\n'
            'Practice: right hand holds a chord shape while left hand plays the pattern.',
        diagramUrl: _Diagrams.cMajChord,
        youtubeVideoId: _Videos.u2L37V7Chord,
        highlightedKeys: [48, 52, 55],
        keyLabels: {48: 'C', 52: 'E', 55: 'G'},
      ),
    ),

    // ── i_12 ─────────────────────────────────────────────────────────────
    const LessonModel(
      id: 'i_12',
      title: 'Sight Reading Basics',
      description:
          'Develop the ability to play music from notation at first glance.',
      level: LessonLevel.intermediate,
      path: LessonPath.soloist,
      durationMinutes: 10,
      content: LessonContent(
        conceptText:
            'SIGHT READING is the skill of playing music you have never seen before. '
            'It is among the most valuable skills a pianist can develop.\n\n'
            'The 5 steps before you play:\n'
            '1. Check the TIME SIGNATURE — how many beats per measure?\n'
            '2. Check the KEY SIGNATURE — which notes are sharp or flat?\n'
            '3. Scan for the HIGHEST and LOWEST notes to know the range.\n'
            '4. Find any tricky RHYTHMS and clap them first.\n'
            '5. Set a slow TEMPO where you can play without stopping.\n\n'
            'The golden rule: NEVER stop to fix a mistake. Keep going. '
            'Stopping is harder to undo than a small error.',
        diagramUrl: _Diagrams.grandStaff,
        youtubeVideoId: _Videos.u2L26TrebleStaff,
      ),
    ),

    // ── i_13 ─────────────────────────────────────────────────────────────
    const LessonModel(
      id: 'i_13',
      title: 'Intervals: 2nds through Octaves',
      description:
          'Name and hear all seven diatonic intervals — the building blocks of melody and harmony.',
      level: LessonLevel.intermediate,
      path: LessonPath.soloist,
      durationMinutes: 10,
      content: LessonContent(
        conceptText:
            'An INTERVAL is the distance between two notes.\n\n'
            '• 2nd (step): C to D — "Happy Birthday" opening\n'
            '• 3rd (skip): C to E — "Oh When the Saints" opening\n'
            '• 4th: C to F — "Here Comes the Bride" opening\n'
            '• 5th: C to G — "Star Wars" theme opening\n'
            '• 6th: C to A — "My Bonnie" opening\n'
            '• 7th: C to B — dissonant, creates tension\n'
            '• Octave: C to C — "Somewhere Over the Rainbow" opening\n\n'
            'Recognising intervals by ear (ear training) is how musicians '
            'transcribe music, improvise, and tune by ear.',
        diagramUrl: _Diagrams.grandStaff,
        youtubeVideoId: _Videos.u2L26TrebleStaff,
      ),
    ),

    // ── i_14 ─────────────────────────────────────────────────────────────
    const LessonModel(
      id: 'i_14',
      title: 'Seventh Chords',
      description:
          'Build dominant 7th, major 7th, and minor 7th chords — the gateway to jazz and advanced harmony.',
      level: LessonLevel.intermediate,
      path: LessonPath.chords,
      durationMinutes: 12,
      content: LessonContent(
        conceptText:
            'A SEVENTH CHORD adds a 4th note (a 7th interval above the root) to a triad.\n\n'
            '• Dominant 7th (G7): G B D F — tense, wants to resolve to C\n'
            '• Major 7th (Cmaj7): C E G B — warm, sophisticated sound\n'
            '• Minor 7th (Am7): A C E G — smooth, melancholic\n\n'
            'Dominant 7th chords are the most important for understanding chord progressions. '
            'The ii-V-I progression (Dm7 → G7 → Cmaj7) is the backbone of jazz.\n\n'
            'Rock and pop use dominant 7ths constantly: "Lady Madonna", "Higher Ground".',
        diagramUrl: _Diagrams.cMajChord,
        youtubeVideoId: _Videos.u2L37V7Chord,
        highlightedKeys: [55, 59, 62, 65],
        keyLabels: {55: 'G', 59: 'B', 62: 'D', 65: 'F'},
      ),
    ),

    // ── i_15 ─────────────────────────────────────────────────────────────
    const LessonModel(
      id: 'i_15',
      title: 'Waltz Accompaniment in 3/4',
      description:
          'Master the "bass note + chord + chord" waltz left-hand pattern.',
      level: LessonLevel.intermediate,
      path: LessonPath.both,
      durationMinutes: 10,
      content: LessonContent(
        conceptText:
            'The waltz pattern is the most classic left-hand accompaniment:\n\n'
            'Beat 1: single bass note (root of the chord) — strong accent\n'
            'Beat 2: chord (usually two upper voices) — light\n'
            'Beat 3: same chord — light\n\n'
            'In C major: C (beat 1) | E+G (beat 2) | E+G (beat 3)\n\n'
            'Practice exercise: right hand plays a simple melody, '
            'left hand plays the waltz pattern on C, F, and G chords.\n\n'
            'Famous waltz-time pieces to work toward:\n'
            '• Chopin Waltz in A minor (Op. Posth.)\n'
            '• The Anniversary Song\n'
            '• Für Elise (the main theme is in 3/4)',
        diagramUrl: _Diagrams.musicNotation,
        youtubeVideoId: _Videos.u2L38MinorPenta,
      ),
    ),

    // ── i_16 ─────────────────────────────────────────────────────────────
    const LessonModel(
      id: 'i_16',
      title: 'Harmonic Minor Scale',
      description:
          'Learn the harmonic minor scale with its raised 7th and dramatic augmented-second sound.',
      level: LessonLevel.intermediate,
      path: LessonPath.both,
      durationMinutes: 12,
      content: LessonContent(
        conceptText:
            'The HARMONIC MINOR scale raises the 7th degree of the natural minor scale.\n\n'
            'A harmonic minor: A B C D E F G♯ A\n'
            '(Natural A minor was: A B C D E F G A — G♯ is the raised 7th)\n\n'
            'The G♯ creates a characteristic augmented 2nd interval (F to G♯) — '
            'that distinctive exotic sound of Middle-Eastern music.\n\n'
            'The raised 7th also creates a stronger V chord (E major instead of E minor), '
            'which gives a more powerful pull back to the tonic A minor chord.\n\n'
            'Famous harmonic minor pieces: Chopin Nocturne in C♯ minor, '
            'Beethoven Moonlight Sonata, "Hava Nagila"',
        diagramUrl: _Diagrams.circleOfFifths,
        youtubeVideoId: _Videos.u2L38MinorPenta,
        highlightedKeys: [57, 59, 60, 62, 64, 65, 68, 69],
        keyLabels: {57: 'A', 59: 'B', 60: 'C', 62: 'D', 64: 'E', 65: 'F', 68: 'G#', 69: 'A'},
      ),
    ),

    // ── i_17 ─────────────────────────────────────────────────────────────
    const LessonModel(
      id: 'i_17',
      title: 'Broken Chords & Arpeggios',
      description:
          'Play chords as flowing arpeggios — the technique behind Chopin, Mozart, and countless pop songs.',
      level: LessonLevel.intermediate,
      path: LessonPath.both,
      durationMinutes: 12,
      content: LessonContent(
        conceptText:
            'An ARPEGGIO plays chord notes one at a time, rolling up or down.\n\n'
            'C major arpeggio (two octaves): C - E - G - C - E - G - C\n'
            'Right hand fingering: 1 - 2 - 3 | (thumb under) 1 - 2 - 3 | (thumb under) 1\n\n'
            'BROKEN CHORDS play in smaller patterns — not necessarily the full range.\n'
            'The left-hand Alberti bass is a type of broken chord.\n\n'
            'Smooth arpeggios require:\n'
            '• Relaxed wrist rotation (not a stiff forearm)\n'
            '• Thumb silently tucked under during the pattern\n'
            '• Even volume on all notes\n\n'
            'These appear extensively in: Schubert\'s "Wanderer Fantasy", '
            'Chopin Nocturnes, and modern pop ballads.',
        diagramUrl: _Diagrams.cMajChord,
        youtubeVideoId: _Videos.u1L06CBoogie,
      ),
    ),

    // ── i_18 ─────────────────────────────────────────────────────────────
    const LessonModel(
      id: 'i_18',
      title: 'The Circle of Fifths',
      description:
          'Understand the circle of fifths — the master map of all keys in music.',
      level: LessonLevel.intermediate,
      path: LessonPath.both,
      durationMinutes: 10,
      content: LessonContent(
        conceptText:
            'The CIRCLE OF FIFTHS arranges all 12 major (and minor) keys in a circle:\n\n'
            '• Moving clockwise = up a fifth = add one sharp\n'
            '  C → G → D → A → E → B → F♯\n'
            '• Moving counter-clockwise = up a fourth = add one flat\n'
            '  C → F → B♭ → E♭ → A♭ → D♭ → G♭\n\n'
            'The circle of fifths tells you:\n'
            '1. How many sharps or flats are in any key signature\n'
            '2. Which keys are closely related (neighbors on the circle)\n'
            '3. Which chord progressions sound natural (V resolves to I because '
            'they are neighbors on the circle)\n\n'
            'Memorize it — every music theory question becomes easier.',
        diagramUrl: _Diagrams.circleOfFifths,
        youtubeVideoId: _Videos.u2L37V7Chord,
      ),
    ),

    // ── i_19 ─────────────────────────────────────────────────────────────
    const LessonModel(
      id: 'i_19',
      title: 'Für Elise — Simplified',
      description:
          'Learn the opening theme of Beethoven\'s Für Elise — the most recognizable piano piece in the world.',
      level: LessonLevel.intermediate,
      path: LessonPath.soloist,
      durationMinutes: 15,
      content: LessonContent(
        conceptText:
            'Für Elise (WoO 59) was composed by Beethoven around 1810 and published after his death.\n\n'
            'The opening theme (A section) uses:\n'
            '• Alternating E-D♯ with E-D♯-E-B-D-C (right hand)\n'
            '• Broken chord left-hand accompaniment: A-E-A (fingers 5-2-1)\n'
            '• Time signature: 3/8 (3 eighth notes per bar)\n'
            '• Key: A minor\n\n'
            'The ABRSM difficulty is approximately Grade 5. The simplified version focuses '
            'only on the A section (the famous opening). Full piece difficulty: RCM Level 7.\n\n'
            'The D♯ in measure 1 is the most important detail — it MUST be a sharp, not a D natural.',
        diagramUrl: _Diagrams.grandStaff,
        youtubeVideoId: _Videos.u2L38MinorPenta,
        highlightedKeys: [64, 63, 62, 59, 57],
        keyLabels: {64: 'E', 63: 'D#', 62: 'D', 59: 'B', 57: 'A'},
      ),
    ),

    // ── i_20 ─────────────────────────────────────────────────────────────
    const LessonModel(
      id: 'i_20',
      title: 'Tempo, Articulation & Musical Terms',
      description:
          'Read Italian musical terms for tempo, articulation, and character found in classical scores.',
      level: LessonLevel.intermediate,
      path: LessonPath.both,
      durationMinutes: 10,
      content: LessonContent(
        conceptText:
            'Classical scores use Italian terms to describe how to play.\n\n'
            'TEMPO (speed):\n'
            '• Grave = very slow, solemn\n'
            '• Largo = very slow, broad\n'
            '• Adagio = slow\n'
            '• Andante = walking pace\n'
            '• Moderato = moderate\n'
            '• Allegretto = moderately fast\n'
            '• Allegro = fast\n'
            '• Vivace = lively\n'
            '• Presto = very fast\n\n'
            'ARTICULATION:\n'
            '• Legato = smooth and connected\n'
            '• Staccato = short and detached\n'
            '• Tenuto (—) = hold full value\n'
            '• Accent (>) = emphasise this note\n\n'
            'EXPRESSION: dolce = sweetly · cantabile = singing · con brio = with spirit',
        diagramUrl: _Diagrams.musicNotation,
        youtubeVideoId: _Videos.u1L13Chocolate,
      ),
    ),

    // ════════════════════════════════════════════════════════════════════════
    // ADVANCED  (10 lessons  ·  ~2+ years)
    // ════════════════════════════════════════════════════════════════════════

    // ── a_01 ─────────────────────────────────────────────────────────────
    const LessonModel(
      id: 'a_01',
      title: 'All 12 Major Scales',
      description:
          'Master every major scale with correct fingering, hands together, across two octaves.',
      level: LessonLevel.advanced,
      path: LessonPath.both,
      durationMinutes: 15,
      content: LessonContent(
        conceptText:
            'Every major scale uses the interval pattern: W W H W W W H.\n\n'
            'Standard fingerings for major scales:\n'
            '• C, G, D, A, E major → RH: 1 2 3 | 1 2 3 4 5\n'
            '• F major → RH: 1 2 3 4 | 1 2 3 4 (4th finger on B♭)\n'
            '• B♭ major → RH: 2 1 2 3 1 2 3 4 (start on 2nd finger)\n'
            '• B, F♯, C♯ major → begin on 2nd or 3rd finger\n\n'
            'Black-key scales (B♭, E♭, A♭, D♭, G♭) use different fingerings '
            'because the thumb must avoid landing on black keys when possible.\n\n'
            'Practice regimen (RCM Level 5 / ABRSM Grade 5 standard):\n'
            'Hands separate → hands together → two octaves → increase BPM by 4 each week.',
        diagramUrl: _Diagrams.circleOfFifths,
        youtubeVideoId: _Videos.u1L06CBoogie,
      ),
    ),

    // ── a_02 ─────────────────────────────────────────────────────────────
    const LessonModel(
      id: 'a_02',
      title: 'Harmonic & Melodic Minor Scales',
      description:
          'Learn all three forms of the minor scale and understand when each is used.',
      level: LessonLevel.advanced,
      path: LessonPath.both,
      durationMinutes: 15,
      content: LessonContent(
        conceptText:
            'Three forms of A minor:\n\n'
            '1. NATURAL minor: A B C D E F G A (all white)\n'
            '2. HARMONIC minor: A B C D E F G♯ A (raised 7th going up and down)\n'
            '3. MELODIC minor: going UP: A B C D E F♯ G♯ A (raised 6th and 7th)\n'
            '                   going DOWN: A G F E D C B A (same as natural minor)\n\n'
            'Why do they exist?\n'
            '• Harmonic: creates a strong V–I cadence (dominant pull)\n'
            '• Melodic: avoids the awkward augmented 2nd in the harmonic minor '
            '  when singing or playing melodies\n\n'
            'Classical composers used all three forms within a single piece.',
        diagramUrl: _Diagrams.circleOfFifths,
        youtubeVideoId: _Videos.u2L38MinorPenta,
        highlightedKeys: [57, 59, 60, 62, 64, 66, 68, 69],
        keyLabels: {57: 'A', 59: 'B', 60: 'C', 62: 'D', 64: 'E', 66: 'F#', 68: 'G#', 69: 'A'},
      ),
    ),

    // ── a_03 ─────────────────────────────────────────────────────────────
    const LessonModel(
      id: 'a_03',
      title: 'Arpeggios in All Keys',
      description:
          'Play two-octave arpeggios through all major and minor keys with smooth thumb crossings.',
      level: LessonLevel.advanced,
      path: LessonPath.both,
      durationMinutes: 15,
      content: LessonContent(
        conceptText:
            'An arpeggio spans the 1st, 3rd, and 5th degrees of a scale, played one at a time.\n\n'
            'C major arpeggio, 2 octaves: C - E - G - C - E - G - C\n'
            'RH fingering: 1 2 3 | 1 2 3 | 1 (two thumb-unders)\n\n'
            'Keys to smooth arpeggios:\n'
            '• Wrist rotation: let the wrist rotate slightly outward as the thumb crosses\n'
            '• Pre-position: silently place the thumb before it needs to play\n'
            '• Even tone: the thumb (weakest at playing softly) often sounds too loud — '
            '  consciously keep thumb notes equal in volume\n\n'
            'Practice all 12 major + 3 forms of minor arpeggios. '
            'ABRSM Grade 5 requires hands together, 2 octaves.',
        diagramUrl: _Diagrams.cMajChord,
        youtubeVideoId: _Videos.u1L06CBoogie,
      ),
    ),

    // ── a_04 ─────────────────────────────────────────────────────────────
    const LessonModel(
      id: 'a_04',
      title: 'Hanon Exercises 1–5',
      description:
          'Build equal finger strength and independence with Hanon\'s foundational technical drills.',
      level: LessonLevel.advanced,
      path: LessonPath.both,
      durationMinutes: 15,
      content: LessonContent(
        conceptText:
            'Charles-Louis Hanon (1819–1900) wrote "The Virtuoso Pianist in 60 Exercises" — '
            'the most widely-used piano technique book ever published.\n\n'
            'Exercises 1–5 each use a repeating 8-note pattern that:\n'
            '• Shifts up by one half step each repetition (from C to C, full keyboard range)\n'
            '• Uses different note combinations to target weak fingers (4 and 5)\n'
            '• Is played both hands together, in parallel motion\n\n'
            'Practice method (conservatory standard):\n'
            '1. Start at 60 BPM — listen for absolute evenness\n'
            '2. Increase by 4 BPM only when the previous tempo is perfectly even\n'
            '3. Target tempo: 108–120 BPM for exercises 1–20\n\n'
            'Warning: mindless fast practice reinforces bad habits. '
            'SLOW, attentive repetition builds real technique.',
        diagramUrl: _Diagrams.keyboard,
        youtubeVideoId: _Videos.u1L05PostureJourney,
      ),
    ),

    // ── a_05 ─────────────────────────────────────────────────────────────
    const LessonModel(
      id: 'a_05',
      title: 'Ornamentation: Trills, Turns & Mordents',
      description:
          'Master baroque and classical ornaments that bring period music to life.',
      level: LessonLevel.advanced,
      path: LessonPath.both,
      durationMinutes: 12,
      content: LessonContent(
        conceptText:
            'Ornaments are decorations added to notes, originating in Baroque and Classical music.\n\n'
            '• TRILL (~): rapidly alternate between the written note and the note one step above. '
            '  Start on the upper note in Baroque; start on the main note in Classical/Romantic.\n'
            '• TURN (∞-like symbol): a 4-note figure going up-main-down-main.\n'
            '• MORDENT (M): rapidly alternate written note with the note BELOW, then back.\n'
            '• APPOGGIATURA (small note before main): lean on the small note, '
            '  resolve to the main note — gives a sighing, expressive effect.\n\n'
            'Practice trills by alternating two fingers at increasing speed:\n'
            'Start 3-4, then 4-5, then 2-3 — the weaker combinations first.',
        diagramUrl: _Diagrams.musicNotation,
        youtubeVideoId: _Videos.u1L13Chocolate,
      ),
    ),

    // ── a_06 ─────────────────────────────────────────────────────────────
    const LessonModel(
      id: 'a_06',
      title: 'Jazz Chord Voicings',
      description:
          'Voice major 7th, dominant 7th, and minor 7th chords for jazz and contemporary styles.',
      level: LessonLevel.advanced,
      path: LessonPath.chords,
      durationMinutes: 15,
      content: LessonContent(
        conceptText:
            'Jazz harmony builds on 7th chords. The most common voicings:\n\n'
            '• Cmaj7: C E G B — warm, dreamy (1 + 3 + 5 + 7)\n'
            '• C7 (dominant): C E G B♭ — bluesy, tense (1 + 3 + 5 + ♭7)\n'
            '• Cm7: C E♭ G B♭ — smooth, melancholic\n'
            '• Cdim7: C E♭ G♭ B♭♭ (=A) — dark, symmetrical\n\n'
            'SHELL VOICINGS (economical left hand):\n'
            'Root + 7th in left hand, 3rd + color tone (9th, 11th, 13th) in right hand.\n'
            'Example: Cmaj9 shell: left hand C + B, right hand E + D\n\n'
            'The ii-V-I progression in jazz:\n'
            'Dm7 → G7 → Cmaj7 (or C6)',
        diagramUrl: _Diagrams.circleOfFifths,
        youtubeVideoId: _Videos.u2L37V7Chord,
        highlightedKeys: [60, 64, 67, 71],
        keyLabels: {60: 'C', 64: 'E', 67: 'G', 71: 'B'},
      ),
    ),

    // ── a_07 ─────────────────────────────────────────────────────────────
    const LessonModel(
      id: 'a_07',
      title: 'Polyrhythm: 2 Against 3',
      description:
          'Develop rhythmic independence by playing two beats in one hand against three in the other.',
      level: LessonLevel.advanced,
      path: LessonPath.both,
      durationMinutes: 15,
      content: LessonContent(
        conceptText:
            'POLYRHYTHM means two different rhythms played simultaneously.\n\n'
            '2-against-3 (hemiola) is the most important:\n'
            '• Left hand: 3 equal beats in a bar\n'
            '• Right hand: 2 equal beats in the same bar\n\n'
            'Counting method — use 6 as the common denominator:\n'
            'Count: 1 - 2 - 3 - 4 - 5 - 6 (six equal subdivisions)\n'
            'LH plays on: 1 - 3 - 5\n'
            'RH plays on: 1 - 4\n\n'
            'Mnemonic: "Nice cup of TEA" = 3 notes (cup-of-tea = 2 notes happening over 3)\n\n'
            'This pattern appears throughout Chopin, Brahms, Ravel, '
            'and nearly all Latin music (clave rhythm).',
        diagramUrl: _Diagrams.musicNotation,
        youtubeVideoId: _Videos.u1L18HalfNotes,
      ),
    ),

    // ── a_08 ─────────────────────────────────────────────────────────────
    const LessonModel(
      id: 'a_08',
      title: 'Advanced Pedaling Techniques',
      description:
          'Master half-pedaling, flutter pedaling, and the sostenuto pedal.',
      level: LessonLevel.advanced,
      path: LessonPath.both,
      durationMinutes: 12,
      content: LessonContent(
        conceptText:
            'Beyond basic damper pedal technique:\n\n'
            '• HALF PEDAL: depress the pedal only halfway — this partially dampens, '
            '  keeping some resonance while clearing muddiness. Useful in fast passages.\n\n'
            '• FLUTTER PEDAL (vibrato pedal): rapidly pump the pedal to create a shimmer effect. '
            '  Used in some 20th-century pieces.\n\n'
            '• SOSTENUTO PEDAL (middle pedal on grands): sustains only the notes depressed '
            '  at the moment you press it, letting subsequent notes be played dry. '
            '  Crucial for Ravel\'s "Bolero" transcriptions, some Debussy, Barber Sonata.\n\n'
            '• UNA CORDA (soft pedal, leftmost): shifts the action on a grand piano so '
            '  hammers strike fewer strings — changes tone color, not just volume.',
        diagramUrl: _Diagrams.keyboard,
        youtubeVideoId: _Videos.u2L30BassStaff,
      ),
    ),

    // ── a_09 ─────────────────────────────────────────────────────────────
    const LessonModel(
      id: 'a_09',
      title: 'Moonlight Sonata — 1st Movement',
      description:
          'Study Beethoven\'s Sonata Op. 27 No. 2 — learning how to sustain triplet arpeggios while singing a melody.',
      level: LessonLevel.advanced,
      path: LessonPath.soloist,
      durationMinutes: 20,
      content: LessonContent(
        conceptText:
            'The Moonlight Sonata (1801) is one of Beethoven\'s most beloved pieces. '
            'Despite its slow tempo, it is technically demanding.\n\n'
            'Key challenges of the 1st movement:\n'
            '• Continuous triplet arpeggios in the right hand (like a rocking boat)\n'
            '• Melody in the TOP voice of the right hand — must sing above the arpeggios\n'
            '• Left hand long bass notes + mid-voice chords\n'
            '• Pedaling: one pedal per harmony (not per beat)\n\n'
            'ABRSM: approximately Grade 8. RCM: Level 8–9.\n\n'
            'Practice strategy:\n'
            '1. Learn left hand alone thoroughly\n'
            '2. Practice RH — highlight the top melody note in each arpeggio group\n'
            '3. Combine — let the melody "float" above the arpeggios',
        diagramUrl: _Diagrams.grandStaff,
        youtubeVideoId: _Videos.u2L38MinorPenta,
      ),
    ),

    // ── a_10 ─────────────────────────────────────────────────────────────
    const LessonModel(
      id: 'a_10',
      title: 'Improvisation & Composition Basics',
      description:
          'Use scales, chord progressions, and musical intuition to create your own music.',
      level: LessonLevel.advanced,
      path: LessonPath.both,
      durationMinutes: 15,
      content: LessonContent(
        conceptText:
            'Improvisation is the art of composing and performing simultaneously.\n\n'
            '12-bar blues form (C blues):\n'
            '| C7 | C7 | C7 | C7 |\n'
            '| F7 | F7 | C7 | C7 |\n'
            '| G7 | F7 | C7 | G7 |\n\n'
            'C blues scale: C E♭ F F♯ G B♭ C\n'
            'These 6 notes work over the entire 12-bar form.\n\n'
            'Composition techniques from the conservatory:\n'
            '• Motif development: take a short idea (3–4 notes) and repeat/transform it\n'
            '• Question & answer: 4-bar "question" phrase → 4-bar "answer" phrase\n'
            '• Sequence: repeat a pattern starting on different scale degrees\n\n'
            'Start simple. Great composers — Bach, Mozart, Beethoven — all began by imitating '
            'and then gradually developing their own voice.',
        diagramUrl: _Diagrams.circleOfFifths,
        youtubeVideoId: _Videos.u2L37V7Chord,
      ),
    ),

    // ════════════════════════════════════════════════════════════════════════
    // GUIDED PRACTICE LESSONS (linked to exercise data)
    // ════════════════════════════════════════════════════════════════════════

    // ── Chord lessons with guided practice ────────────────────────────────
    const LessonModel(
      id: 'practice-c-major-chord',
      title: 'Practice: C Major Chord',
      description: 'Play the C-E-G chord with guided feedback.',
      level: LessonLevel.beginner,
      path: LessonPath.chords,
      durationMinutes: 4,
      exerciseType: 'chord',
      exerciseId: 'chord-major-triad-C',
      content: LessonContent(
        conceptText:
            'The C Major chord uses three notes:\n'
            '• C (root)\n'
            '• E (major third)\n'
            '• G (perfect fifth)\n\n'
            'Play each note in order as shown in the practice guide.',
        highlightedKeys: [60, 64, 67],
        keyLabels: {60: 'C', 64: 'E', 67: 'G'},
      ),
    ),

    const LessonModel(
      id: 'practice-g-major-chord',
      title: 'Practice: G Major Chord',
      description: 'Play the G-B-D chord with guided feedback.',
      level: LessonLevel.beginner,
      path: LessonPath.chords,
      durationMinutes: 4,
      exerciseType: 'chord',
      exerciseId: 'chord-major-triad-G',
      content: LessonContent(
        conceptText:
            'The G Major chord contains:\n'
            '• G (root)\n'
            '• B (major third)\n'
            '• D (perfect fifth)\n\n'
            'Play each note in order following the guides.',
        highlightedKeys: [67, 71, 74],
        keyLabels: {67: 'G', 71: 'B', 74: 'D'},
      ),
    ),

    const LessonModel(
      id: 'practice-a-minor-chord',
      title: 'Practice: A Minor Chord',
      description: 'Play the A-C-E chord with guided feedback.',
      level: LessonLevel.beginner,
      path: LessonPath.chords,
      durationMinutes: 4,
      exerciseType: 'chord',
      exerciseId: 'chord-minor-triad-A',
      content: LessonContent(
        conceptText:
            'The A Minor chord (the relative minor of C Major):\n'
            '• A (root)\n'
            '• C (minor third — flatted)\n'
            '• E (perfect fifth)\n\n'
            'Play each note as indicated by the practice guide.',
        highlightedKeys: [69, 72, 76],
        keyLabels: {69: 'A', 72: 'C', 76: 'E'},
      ),
    ),

    // ── Scale lessons with guided practice ────────────────────────────────
    const LessonModel(
      id: 'practice-c-major-scale',
      title: 'Practice: C Major Scale',
      description: 'Play all 8 notes of the C Major scale.',
      level: LessonLevel.beginner,
      path: LessonPath.soloist,
      durationMinutes: 5,
      exerciseType: 'scale',
      exerciseId: 'scale-major-C',
      content: LessonContent(
        conceptText:
            'The C Major scale (no sharps or flats):\n'
            'C - D - E - F - G - A - B - C\n\n'
            'Play each note from left to right, then back down. '
            'Start slow and build speed with repetition.',
        highlightedKeys: [48, 50, 52, 53, 55, 57, 59, 60],
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
      ),
    ),

    const LessonModel(
      id: 'practice-g-major-scale',
      title: 'Practice: G Major Scale',
      description: 'Play all 8 notes of the G Major scale (with F#).',
      level: LessonLevel.beginner,
      path: LessonPath.soloist,
      durationMinutes: 5,
      exerciseType: 'scale',
      exerciseId: 'scale-major-G',
      content: LessonContent(
        conceptText:
            'The G Major scale (one sharp: F#):\n'
            'G - A - B - C - D - E - F# - G\n\n'
            'Remember: the F in this scale is F#, not natural F.',
        highlightedKeys: [55, 57, 59, 60, 62, 64, 66, 67],
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

    const LessonModel(
      id: 'practice-d-major-scale',
      title: 'Practice: D Major Scale',
      description: 'Play the D Major scale (with F# and C#).',
      level: LessonLevel.beginner,
      path: LessonPath.soloist,
      durationMinutes: 5,
      exerciseType: 'scale',
      exerciseId: 'scale-major-D',
      content: LessonContent(
        conceptText:
            'The D Major scale (two sharps: F# and C#):\n'
            'D - E - F# - G - A - B - C# - D\n\n'
            'This scale is bright and often used in folk and classical music.',
        highlightedKeys: [50, 52, 54, 55, 57, 59, 61, 62],
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

    // ── Arpeggio lessons with guided practice ────────────────────────────
    const LessonModel(
      id: 'practice-c-major-arpeggio',
      title: 'Practice: C Major Arpeggio',
      description: 'Play the C Major chord as a flowing arpeggio.',
      level: LessonLevel.beginner,
      path: LessonPath.soloist,
      durationMinutes: 5,
      exerciseType: 'arpeggio',
      exerciseId: 'arpeggio-major-asc-C',
      content: LessonContent(
        conceptText:
            'An arpeggio breaks up a chord into separate flowing notes.\n\n'
            'C Major arpeggio: C - E - G - C (next octave)\n\n'
            'This creates a cascading, musical sound and develops finger technique.',
        highlightedKeys: [48, 52, 55, 60],
        keyLabels: {48: 'C', 52: 'E', 55: 'G', 60: 'C'},
      ),
    ),

    const LessonModel(
      id: 'practice-g-major-arpeggio',
      title: 'Practice: G Major Arpeggio',
      description: 'Play the G Major chord as an arpeggio.',
      level: LessonLevel.beginner,
      path: LessonPath.soloist,
      durationMinutes: 5,
      exerciseType: 'arpeggio',
      exerciseId: 'arpeggio-major-asc-G',
      content: LessonContent(
        conceptText:
            'G Major arpeggio: G - B - D - G (next octave)\n\n'
            'Focus on smooth, even spacing between each note.',
        highlightedKeys: [55, 59, 62, 67],
        keyLabels: {55: 'G', 59: 'B', 62: 'D', 67: 'G'},
      ),
    ),
  ];

  // ─────────────────────────────────────────────────────────────────────────
  // Public API
  // ─────────────────────────────────────────────────────────────────────────

  @override
  List<Lesson> getLessons() => _catalogue.map(_withProgress).toList();

  @override
  Lesson? getLessonById(String id) {
    try {
      return _withProgress(_catalogue.firstWhere((l) => l.id == id));
    } catch (_) {
      return null;
    }
  }

  @override
  void saveProgress(String id,
      {required int starRating, required bool isCompleted}) {
    _prefs.setInt('lesson_stars_$id', starRating);
    _prefs.setBool('lesson_done_$id', isCompleted);
  }

  LessonModel _withProgress(LessonModel lesson) {
    final stars = _prefs.getInt('lesson_stars_${lesson.id}') ?? 0;
    final done = _prefs.getBool('lesson_done_${lesson.id}') ?? false;
    return lesson.copyWithProgress(starRating: stars, isCompleted: done);
  }
}
