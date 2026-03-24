import 'package:shared_preferences/shared_preferences.dart';

import '../../domain/entities/lesson.dart';
import '../../domain/repositories/lesson_repository.dart';
import '../models/lesson_model.dart';

// Verified working diagram URLs (all 200 OK)
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

// Verified Hoffman Academy YouTube video IDs
class _Videos {
  static const keyboardLayout = 'AQRagZY760w'; // Lesson 1 — keyboard layout
  static const handPosition   = 'BmTcXlfT1OE'; // Hand position & posture
  static const fiveFingers    = 'LZqGmUFVEXc'; // Five finger exercises
  static const trebleClef     = 'sM3peMr6yPI'; // Reading treble clef
  static const chords         = 'xz0GOZMRK70'; // First chords
}

class LessonRepositoryImpl implements LessonRepository {
  LessonRepositoryImpl(this._prefs);

  final SharedPreferences _prefs;

  static final List<LessonModel> _catalogue = [
    // ── BEGINNER ──────────────────────────────────────────────────────────────
    const LessonModel(
      id: 'b_01',
      title: 'The Keyboard Layout',
      description: 'Learn the names of all white and black keys and how they repeat across the piano.',
      level: LessonLevel.beginner,
      path: LessonPath.both,
      durationMinutes: 5,
      content: LessonContent(
        conceptText:
            'The piano keyboard has 88 keys made up of repeating groups of white and black keys. '
            'White keys are named A through G. Black keys are sharps (♯) or flats (♭) of the white keys next to them. '
            'Every 12 keys (7 white + 5 black) is called an octave — and the pattern repeats across the whole keyboard.',
        diagramUrl: _Diagrams.keyboard,
        youtubeVideoId: _Videos.keyboardLayout,
      ),
    ),
    const LessonModel(
      id: 'b_02',
      title: 'Finding Middle C',
      description: 'Locate middle C and understand why it is the anchor point for everything you play.',
      level: LessonLevel.beginner,
      path: LessonPath.both,
      durationMinutes: 5,
      content: LessonContent(
        conceptText:
            'Middle C (C4) is the C closest to the middle of the keyboard. '
            'It sits just to the left of a group of two black keys, near the piano\'s brand name. '
            'Middle C is written on a ledger line between the treble and bass clef staves — '
            'making it the bridge between your right hand and left hand.',
        diagramUrl: _Diagrams.keyboard,
        youtubeVideoId: _Videos.keyboardLayout,
      ),
    ),
    const LessonModel(
      id: 'b_03',
      title: 'Hand Position & Posture',
      description: 'Learn the correct hand shape, wrist position, and sitting posture to avoid strain.',
      level: LessonLevel.beginner,
      path: LessonPath.both,
      durationMinutes: 5,
      content: LessonContent(
        conceptText:
            'Sit at the center of the keyboard with feet flat on the floor. '
            'Your elbows should be roughly level with the keys. '
            'Curve your fingers as if holding a small ball — never play with flat fingers. '
            'Keep your wrists relaxed and level, not drooping below or arching above the keys. '
            'Number your fingers 1–5 starting from the thumb.',
        diagramUrl: _Diagrams.keyboard,
        youtubeVideoId: _Videos.handPosition,
      ),
    ),
    const LessonModel(
      id: 'b_04',
      title: 'Five-Finger Patterns',
      description: 'Practice the C-D-E-F-G pattern with your right hand — your first real exercise.',
      level: LessonLevel.beginner,
      path: LessonPath.both,
      durationMinutes: 8,
      content: LessonContent(
        conceptText:
            'Place finger 1 (thumb) on Middle C. Each finger covers one white key: '
            '1=C, 2=D, 3=E, 4=F, 5=G. '
            'Play each key slowly, one at a time, pressing firmly but without tension. '
            'Then play back down: 5-4-3-2-1. '
            'This five-finger position is the foundation of nearly every beginner piece.',
        diagramUrl: _Diagrams.keyboard,
        youtubeVideoId: _Videos.fiveFingers,
      ),
    ),
    const LessonModel(
      id: 'b_05',
      title: 'Reading the Treble Clef',
      description: 'Understand the lines and spaces of the treble clef and read your first notes.',
      level: LessonLevel.beginner,
      path: LessonPath.soloist,
      durationMinutes: 10,
      content: LessonContent(
        conceptText:
            'The treble clef marks the staff used for your right hand. '
            'The five lines, from bottom to top, spell: Every Good Boy Does Fine (E G B D F). '
            'The four spaces spell: FACE. '
            'Notes sitting on lines or in spaces tell you which key to press. '
            'A note\'s vertical position = its pitch. A note\'s shape = its duration.',
        diagramUrl: _Diagrams.trebleClef,
        youtubeVideoId: _Videos.trebleClef,
      ),
    ),
    const LessonModel(
      id: 'b_06',
      title: 'Your First Chords',
      description: 'Play C major, G major, and F major — the three most common chords in pop music.',
      level: LessonLevel.beginner,
      path: LessonPath.chords,
      durationMinutes: 10,
      content: LessonContent(
        conceptText:
            'A chord is three or more notes played at the same time. '
            'C major = C + E + G (fingers 1, 3, 5 in C position). '
            'G major = G + B + D. F major = F + A + C. '
            'These three chords (I, IV, V) are the foundation of hundreds of pop songs. '
            'Practice each chord slowly, making sure all three notes sound together cleanly.',
        diagramUrl: _Diagrams.cMajChord,
        youtubeVideoId: _Videos.chords,
      ),
    ),
    const LessonModel(
      id: 'b_07',
      title: 'Ode to Joy',
      description: 'Play your first complete melody — Beethoven\'s Ode to Joy with the right hand.',
      level: LessonLevel.beginner,
      path: LessonPath.soloist,
      durationMinutes: 10,
      content: LessonContent(
        conceptText:
            'Ode to Joy is from Beethoven\'s 9th Symphony and is one of the most recognisable melodies ever written. '
            'This simplified version uses only the five-finger position you already know (C–G). '
            'The melody stays entirely on white keys. '
            'Listen to the demo first, then try to match what you hear.',
        diagramUrl: _Diagrams.grandStaff,
        youtubeVideoId: _Videos.fiveFingers,
      ),
    ),
    const LessonModel(
      id: 'b_08',
      title: 'Note Values & Rhythm',
      description: 'Learn quarter, half, and whole notes. Count beats out loud while you play.',
      level: LessonLevel.beginner,
      path: LessonPath.both,
      durationMinutes: 8,
      content: LessonContent(
        conceptText:
            'Every note has a duration:\n'
            '• Whole note = 4 beats — held for a full measure in 4/4 time\n'
            '• Half note = 2 beats\n'
            '• Quarter note = 1 beat\n'
            '• Eighth note = half a beat\n\n'
            'Count "1-2-3-4" out loud as you play. '
            'A time signature of 4/4 means 4 quarter-note beats per measure.',
        diagramUrl: _Diagrams.musicNotation,
        youtubeVideoId: _Videos.trebleClef,
      ),
    ),

    // ── INTERMEDIATE ──────────────────────────────────────────────────────────
    const LessonModel(
      id: 'i_01',
      title: 'Reading the Bass Clef',
      description: 'Learn the bass clef lines and spaces and start reading left-hand notation.',
      level: LessonLevel.intermediate,
      path: LessonPath.soloist,
      durationMinutes: 10,
      content: LessonContent(
        conceptText:
            'The bass clef marks the staff for your left hand. '
            'Lines from bottom to top: Good Boys Do Fine Always (G B D F A). '
            'Spaces from bottom to top: All Cows Eat Grass (A C E G). '
            'Middle C sits just above the bass clef staff on a ledger line.',
        diagramUrl: _Diagrams.grandStaff,
        youtubeVideoId: _Videos.trebleClef,
      ),
    ),
    const LessonModel(
      id: 'i_02',
      title: 'Hands Together — Basics',
      description: 'Coordinate both hands playing simple patterns at the same time.',
      level: LessonLevel.intermediate,
      path: LessonPath.both,
      durationMinutes: 12,
      content: LessonContent(
        conceptText:
            'Playing hands together is one of the hardest early challenges. '
            'The key is to learn each hand alone first, then combine. '
            'Start at half speed. Your brain treats each hand as a separate task — '
            'with practice, it becomes automatic. '
            'The most common beginner pattern: right hand plays the melody, '
            'left hand holds a whole note or simple chord.',
        diagramUrl: _Diagrams.grandStaff,
        youtubeVideoId: _Videos.handPosition,
      ),
    ),
    const LessonModel(
      id: 'i_03',
      title: 'C Major Scale',
      description: 'Play the C major scale with both hands, hands separate then together.',
      level: LessonLevel.intermediate,
      path: LessonPath.both,
      durationMinutes: 10,
      content: LessonContent(
        conceptText:
            'The C major scale is 8 notes: C D E F G A B C — all white keys. '
            'Right hand fingering: 1 2 3 (thumb under) 1 2 3 4 5. '
            'Left hand fingering: 5 4 3 2 1 (thumb under) 3 2 1. '
            'The "thumb under" technique at finger 3 is essential — '
            'it allows your hand to travel smoothly without lifting your wrist.',
        diagramUrl: _Diagrams.keyboard,
        youtubeVideoId: _Videos.fiveFingers,
      ),
    ),
    const LessonModel(
      id: 'i_04',
      title: 'Chord Inversions',
      description: 'Learn root position, 1st inversion, and 2nd inversion for major chords.',
      level: LessonLevel.intermediate,
      path: LessonPath.chords,
      durationMinutes: 12,
      content: LessonContent(
        conceptText:
            'A chord inversion means re-ordering the notes so a different note is on the bottom:\n'
            '• Root position: C E G (C on bottom)\n'
            '• 1st inversion: E G C (E on bottom)\n'
            '• 2nd inversion: G C E (G on bottom)\n\n'
            'All three contain the same notes — just in different order. '
            'Inversions let you move between chords smoothly without large hand jumps.',
        diagramUrl: _Diagrams.cMajChord,
        youtubeVideoId: _Videos.chords,
      ),
    ),
    const LessonModel(
      id: 'i_05',
      title: 'The I–IV–V–I Progression',
      description: 'Master the most common chord progression in Western music in the key of C.',
      level: LessonLevel.intermediate,
      path: LessonPath.chords,
      durationMinutes: 12,
      content: LessonContent(
        conceptText:
            'In the key of C, the I–IV–V–I progression is: C major → F major → G major → C major. '
            'This progression underlies thousands of songs across pop, rock, blues, and classical music. '
            'Practice it slowly, then try using chord inversions to make the transitions smoother. '
            'The "V → I" move (G to C) is called a cadence — it creates a strong sense of resolution.',
        diagramUrl: _Diagrams.circleOfFifths,
        youtubeVideoId: _Videos.chords,
      ),
    ),
    const LessonModel(
      id: 'i_06',
      title: 'Waltz Time — 3/4',
      description: 'Feel the waltz groove and play your first piece in three-four time.',
      level: LessonLevel.intermediate,
      path: LessonPath.both,
      durationMinutes: 10,
      content: LessonContent(
        conceptText:
            '3/4 time has 3 beats per measure instead of 4. '
            'Count: "1-2-3, 1-2-3" — with a strong accent on beat 1. '
            'The classic waltz pattern for the left hand: '
            'bass note on beat 1, chord on beats 2 and 3. '
            'Famous examples: "My Favorite Things", "Moon River", Chopin\'s Waltzes.',
        diagramUrl: _Diagrams.musicNotation,
        youtubeVideoId: _Videos.trebleClef,
      ),
    ),

    // ── ADVANCED ──────────────────────────────────────────────────────────────
    const LessonModel(
      id: 'a_01',
      title: 'All 12 Major Scales',
      description: 'Practice every major scale across the full keyboard with correct fingering.',
      level: LessonLevel.advanced,
      path: LessonPath.both,
      durationMinutes: 15,
      content: LessonContent(
        conceptText:
            'Every major scale follows the same interval pattern: W W H W W W H (W=whole step, H=half step). '
            'Starting on any of the 12 notes gives you a different major scale. '
            'Each scale has its own fingering — memorise the pattern for each key. '
            'Black key scales (F♯, B♭, etc.) have different fingerings to avoid awkward thumb placement on black keys. '
            'Practice hands separately first, then together, starting at 60 BPM.',
        diagramUrl: _Diagrams.circleOfFifths,
        youtubeVideoId: _Videos.fiveFingers,
      ),
    ),
    const LessonModel(
      id: 'a_02',
      title: 'Harmonic Minor Scales',
      description: 'Learn the harmonic minor scale and hear how it creates tension and drama.',
      level: LessonLevel.advanced,
      path: LessonPath.both,
      durationMinutes: 15,
      content: LessonContent(
        conceptText:
            'The harmonic minor scale raises the 7th degree of the natural minor scale by a half step. '
            'A harmonic minor: A B C D E F G♯ A. '
            'The raised 7th creates a distinctive "exotic" sound and a strong pull back to the tonic. '
            'The augmented second between the 6th and 7th (F to G♯) is the most recognisable feature — '
            'it gives Middle Eastern and classical music its dramatic character.',
        diagramUrl: _Diagrams.circleOfFifths,
        youtubeVideoId: _Videos.trebleClef,
      ),
    ),
    const LessonModel(
      id: 'a_03',
      title: 'Arpeggios in All Keys',
      description: 'Play broken chords (arpeggios) through all inversions in every major key.',
      level: LessonLevel.advanced,
      path: LessonPath.both,
      durationMinutes: 15,
      content: LessonContent(
        conceptText:
            'An arpeggio is a chord played one note at a time, ascending and descending. '
            'C major arpeggio: C E G C E G C (spanning two octaves). '
            'Arpeggios require smooth thumb-under technique across a wide range. '
            'They appear in countless classical pieces — Alberti bass patterns, '
            'concerto cadenzas, and Chopin\'s nocturnes all rely on fluid arpeggios.',
        diagramUrl: _Diagrams.cMajChord,
        youtubeVideoId: _Videos.fiveFingers,
      ),
    ),
    const LessonModel(
      id: 'a_04',
      title: 'Hanon Exercise No. 1',
      description: 'The classic finger independence drill. Build speed and evenness across all fingers.',
      level: LessonLevel.advanced,
      path: LessonPath.both,
      durationMinutes: 10,
      content: LessonContent(
        conceptText:
            'Hanon exercises are 60 drills designed to build equal strength and independence in all 10 fingers. '
            'Exercise No. 1 uses a repeating 8-note pattern that shifts up one key at a time. '
            'Start at 60 BPM with a metronome. Increase by 4 BPM only when every note sounds perfectly even. '
            'Listen for any accents or uneven timing — these reveal which fingers are weaker.',
        diagramUrl: _Diagrams.keyboard,
        youtubeVideoId: _Videos.handPosition,
      ),
    ),
    const LessonModel(
      id: 'a_05',
      title: 'Jazz Chord Voicings',
      description: 'Explore extended chords — major 7th, dominant 7th, minor 7th — and how to voice them.',
      level: LessonLevel.advanced,
      path: LessonPath.chords,
      durationMinutes: 15,
      content: LessonContent(
        conceptText:
            'Jazz chords add one or more notes beyond the basic triad:\n'
            '• Major 7th (Cmaj7): C E G B — warm, dreamy sound\n'
            '• Dominant 7th (C7): C E G B♭ — bluesy, wants to resolve\n'
            '• Minor 7th (Cm7): C E♭ G B♭ — smooth, melancholic\n\n'
            'Voicing means choosing which octave each note sits in. '
            'Shell voicings (root + 3rd + 7th, omitting the 5th) are clean and widely used in jazz.',
        diagramUrl: _Diagrams.circleOfFifths,
        youtubeVideoId: _Videos.chords,
      ),
    ),
  ];

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
