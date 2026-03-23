import 'package:shared_preferences/shared_preferences.dart';

import '../../domain/entities/lesson.dart';
import '../../domain/repositories/lesson_repository.dart';
import '../models/lesson_model.dart';

class LessonRepositoryImpl implements LessonRepository {
  LessonRepositoryImpl(this._prefs);

  final SharedPreferences _prefs;

  static final List<LessonModel> _catalogue = [
    // --- BEGINNER ---
    const LessonModel(
      id: 'b_01',
      title: 'The Keyboard Layout',
      description: 'Learn the names of all the white and black keys and how they repeat across the piano.',
      level: LessonLevel.beginner,
      path: LessonPath.both,
      durationMinutes: 5,
    ),
    const LessonModel(
      id: 'b_02',
      title: 'Finding Middle C',
      description: 'Locate middle C and understand why it is the anchor point for everything you play.',
      level: LessonLevel.beginner,
      path: LessonPath.both,
      durationMinutes: 5,
    ),
    const LessonModel(
      id: 'b_03',
      title: 'Hand Position & Posture',
      description: 'Learn the correct hand shape, wrist position, and sitting posture to avoid strain.',
      level: LessonLevel.beginner,
      path: LessonPath.both,
      durationMinutes: 5,
    ),
    const LessonModel(
      id: 'b_04',
      title: 'Five-Finger Patterns',
      description: 'Practice the C-D-E-F-G pattern with your right hand — your first real exercise.',
      level: LessonLevel.beginner,
      path: LessonPath.both,
      durationMinutes: 8,
    ),
    const LessonModel(
      id: 'b_05',
      title: 'Reading the Treble Clef',
      description: 'Understand the lines and spaces of the treble clef and read your first notes.',
      level: LessonLevel.beginner,
      path: LessonPath.soloist,
      durationMinutes: 10,
    ),
    const LessonModel(
      id: 'b_06',
      title: 'Your First Chords',
      description: 'Play C major, G major, and F major — the three most common chords in pop music.',
      level: LessonLevel.beginner,
      path: LessonPath.chords,
      durationMinutes: 10,
    ),
    const LessonModel(
      id: 'b_07',
      title: 'Ode to Joy',
      description: 'Play your first complete melody — Beethoven\'s Ode to Joy with the right hand.',
      level: LessonLevel.beginner,
      path: LessonPath.soloist,
      durationMinutes: 10,
    ),
    const LessonModel(
      id: 'b_08',
      title: 'Note Values & Rhythm',
      description: 'Learn quarter, half, and whole notes. Count beats out loud while you play.',
      level: LessonLevel.beginner,
      path: LessonPath.both,
      durationMinutes: 8,
    ),

    // --- INTERMEDIATE ---
    const LessonModel(
      id: 'i_01',
      title: 'Reading the Bass Clef',
      description: 'Learn the bass clef lines and spaces and start reading left-hand notation.',
      level: LessonLevel.intermediate,
      path: LessonPath.soloist,
      durationMinutes: 10,
    ),
    const LessonModel(
      id: 'i_02',
      title: 'Hands Together — Basics',
      description: 'Coordinate both hands playing simple patterns at the same time.',
      level: LessonLevel.intermediate,
      path: LessonPath.both,
      durationMinutes: 12,
    ),
    const LessonModel(
      id: 'i_03',
      title: 'C Major Scale',
      description: 'Play the C major scale with both hands, hands separate then together.',
      level: LessonLevel.intermediate,
      path: LessonPath.both,
      durationMinutes: 10,
    ),
    const LessonModel(
      id: 'i_04',
      title: 'Chord Inversions',
      description: 'Learn root position, 1st inversion, and 2nd inversion for major chords.',
      level: LessonLevel.intermediate,
      path: LessonPath.chords,
      durationMinutes: 12,
    ),
    const LessonModel(
      id: 'i_05',
      title: 'The I–IV–V–I Progression',
      description: 'Master the most common chord progression in Western music in the key of C.',
      level: LessonLevel.intermediate,
      path: LessonPath.chords,
      durationMinutes: 12,
    ),
    const LessonModel(
      id: 'i_06',
      title: 'Waltz Time — 3/4',
      description: 'Feel the waltz groove and play your first piece in three-four time.',
      level: LessonLevel.intermediate,
      path: LessonPath.both,
      durationMinutes: 10,
    ),

    // --- ADVANCED ---
    const LessonModel(
      id: 'a_01',
      title: 'All 12 Major Scales',
      description: 'Practice every major scale across the full keyboard with correct fingering.',
      level: LessonLevel.advanced,
      path: LessonPath.both,
      durationMinutes: 15,
    ),
    const LessonModel(
      id: 'a_02',
      title: 'Harmonic Minor Scales',
      description: 'Learn the harmonic minor scale and hear how it creates tension and drama.',
      level: LessonLevel.advanced,
      path: LessonPath.both,
      durationMinutes: 15,
    ),
    const LessonModel(
      id: 'a_03',
      title: 'Arpeggios in All Keys',
      description: 'Play broken chords (arpeggios) through all inversions in every major key.',
      level: LessonLevel.advanced,
      path: LessonPath.both,
      durationMinutes: 15,
    ),
    const LessonModel(
      id: 'a_04',
      title: 'Hanon Exercise No. 1',
      description: 'The classic finger independence drill. Build speed and evenness across all fingers.',
      level: LessonLevel.advanced,
      path: LessonPath.both,
      durationMinutes: 10,
    ),
    const LessonModel(
      id: 'a_05',
      title: 'Jazz Chord Voicings',
      description: 'Explore extended chords — major 7th, dominant 7th, minor 7th — and how to voice them.',
      level: LessonLevel.advanced,
      path: LessonPath.chords,
      durationMinutes: 15,
    ),
  ];

  @override
  List<Lesson> getLessons() {
    return _catalogue.map((lesson) {
      final stars = _prefs.getInt('lesson_stars_${lesson.id}') ?? 0;
      final completed = _prefs.getBool('lesson_done_${lesson.id}') ?? false;
      return lesson.copyWithProgress(starRating: stars, isCompleted: completed);
    }).toList();
  }

  @override
  Lesson? getLessonById(String id) {
    try {
      final lesson = _catalogue.firstWhere((l) => l.id == id);
      final stars = _prefs.getInt('lesson_stars_$id') ?? 0;
      final completed = _prefs.getBool('lesson_done_$id') ?? false;
      return lesson.copyWithProgress(starRating: stars, isCompleted: completed);
    } catch (_) {
      return null;
    }
  }

  @override
  void saveProgress(String id, {required int starRating, required bool isCompleted}) {
    _prefs.setInt('lesson_stars_$id', starRating);
    _prefs.setBool('lesson_done_$id', isCompleted);
  }
}
