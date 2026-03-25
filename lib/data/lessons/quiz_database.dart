import '../../features/lessons/domain/entities/quiz.dart';

/// Quiz database containing comprehension tests for all lessons
class QuizDatabase {
  static final Map<String, LessonQuiz> _quizzes = {
    // ═══════════════════════════════════════════════════════════════════════
    // INTERMEDIATE LEVEL QUIZZES
    // ═══════════════════════════════════════════════════════════════════════

    'inter-01-g-major-chord': LessonQuiz(
      lessonId: 'inter-01-g-major-chord',
      title: 'G Major Chord Quiz',
      description: 'Test your understanding of the G Major chord and circle of fifths',
      questions: [
        QuizQuestion(
          id: 'q1',
          lessonId: 'inter-01-g-major-chord',
          question: 'What notes make up a G Major chord?',
          type: QuestionType.multipleChoice,
          options: [
            'G, B, D',
            'G, Bb, D',
            'G, C, D',
            'A, B, D',
          ],
          correctAnswerIndex: 0,
          explanation:
              'G Major is built with the root (G), major 3rd (B), and perfect 5th (D). This forms a major triad.',
          points: 10,
        ),
        QuizQuestion(
          id: 'q2',
          lessonId: 'inter-01-g-major-chord',
          question: 'In C Major, the G Major chord is the _____ chord.',
          type: QuestionType.fillInTheBlank,
          options: [
            'I',
            'IV',
            'V',
            'vi',
          ],
          correctAnswerIndex: 2,
          explanation:
              'G is the 5th scale degree of C Major, making it the V (dominant) chord, not the tonic (I).',
          points: 10,
        ),
        QuizQuestion(
          id: 'q3',
          lessonId: 'inter-01-g-major-chord',
          question: 'The Circle of Fifths shows each chord moving up a perfect 5th.',
          type: QuestionType.trueOrFalse,
          options: ['True', 'False'],
          correctAnswerIndex: 0,
          explanation:
              'Correct! The Circle of Fifths demonstrates the relationship between keys by showing perfect 5th intervals (or 4th intervals in the other direction).',
          points: 10,
        ),
        QuizQuestion(
          id: 'q4',
          lessonId: 'inter-01-g-major-chord',
          question: 'Which progression is called a "cadence"?',
          type: QuestionType.multipleChoice,
          options: [
            'I - IV - V',
            'V - I',
            'I - vi - IV',
            'ii - V - I',
          ],
          correctAnswerIndex: 1,
          explanation:
              'While multiple progressions exist, V-I is specifically called the "authentic cadence" and provides the strongest harmonic closure.',
          points: 10,
        ),
        QuizQuestion(
          id: 'q5',
          lessonId: 'inter-01-g-major-chord',
          question: 'The V chord creates harmonic tension that resolves to the I chord.',
          type: QuestionType.trueOrFalse,
          options: ['True', 'False'],
          correctAnswerIndex: 0,
          explanation:
              'Correct! The dominant (V) chord creates tension through the tritone interval (B-F in C Major), which resolves when moving to the tonic (I).',
          points: 10,
        ),
      ],
      passingScore: 70,
    ),

    'inter-02-a-minor-chord': LessonQuiz(
      lessonId: 'inter-02-a-minor-chord',
      title: 'A Minor Chord Quiz',
      description: 'Test your understanding of relative minor relationships',
      questions: [
        QuizQuestion(
          id: 'q1',
          lessonId: 'inter-02-a-minor-chord',
          question: 'A Minor is the relative minor of which major key?',
          type: QuestionType.multipleChoice,
          options: [
            'G Major',
            'C Major',
            'F Major',
            'D Major',
          ],
          correctAnswerIndex: 1,
          explanation:
              'A Minor and C Major share the same notes (all white keys), making them relative to each other. A is the 6th scale degree of C.',
          points: 10,
        ),
        QuizQuestion(
          id: 'q2',
          lessonId: 'inter-02-a-minor-chord',
          question: 'What notes make up an A Minor chord?',
          type: QuestionType.multipleChoice,
          options: [
            'A, C, E',
            'A, C#, E',
            'A, Bb, E',
            'A, B, E',
          ],
          correctAnswerIndex: 0,
          explanation:
              'A Minor consists of the root (A), minor 3rd (C, not C#), and perfect 5th (E). The minor 3rd creates the dark quality.',
          points: 10,
        ),
        QuizQuestion(
          id: 'q3',
          lessonId: 'inter-02-a-minor-chord',
          question: 'In C Major, the A Minor chord is the _____ chord.',
          type: QuestionType.fillInTheBlank,
          options: [
            'ii',
            'iii',
            'vi',
            'vii°',
          ],
          correctAnswerIndex: 2,
          explanation:
              'A is the 6th scale degree of C Major, making it the vi (relative minor) chord. This is the most important minor chord in major keys.',
          points: 10,
        ),
        QuizQuestion(
          id: 'q4',
          lessonId: 'inter-02-a-minor-chord',
          question: 'The only difference between a C Major and A Minor chord is:',
          type: QuestionType.multipleChoice,
          options: [
            'The root note',
            'The third (major vs. minor)',
            'The fifth',
            'The octave',
          ],
          correctAnswerIndex: 1,
          explanation:
              'The third is the only note that differs: E (major 3rd = 4 semitones) in C Major vs. C (minor 3rd = 3 semitones) in A Minor. This single note determines the major/minor quality.',
          points: 10,
        ),
        QuizQuestion(
          id: 'q5',
          lessonId: 'inter-02-a-minor-chord',
          question: 'The I - vi - IV - V progression is one of the most popular chord progressions in Western music.',
          type: QuestionType.trueOrFalse,
          options: ['True', 'False'],
          correctAnswerIndex: 0,
          explanation:
              'Correct! This progression (C - Am - F - G in C Major) is extremely common in popular music, jazz, and classical compositions.',
          points: 10,
        ),
      ],
      passingScore: 70,
    ),

    'inter-03-g-major-scale': LessonQuiz(
      lessonId: 'inter-03-g-major-scale',
      title: 'G Major Scale Quiz',
      description: 'Test your understanding of scales with sharps',
      questions: [
        QuizQuestion(
          id: 'q1',
          lessonId: 'inter-03-g-major-scale',
          question: 'How many sharps are in the G Major scale?',
          type: QuestionType.multipleChoice,
          options: [
            'One sharp (F#)',
            'Two sharps (F# and C#)',
            'No sharps',
            'Three sharps',
          ],
          correctAnswerIndex: 0,
          explanation:
              'G Major has one sharp (F#) to maintain the major scale pattern (W-W-H-W-W-W-H). F# is necessary to create a half step from F# to G.',
          points: 10,
        ),
        QuizQuestion(
          id: 'q2',
          lessonId: 'inter-03-g-major-scale',
          question: 'What is the correct order of notes in the G Major scale?',
          type: QuestionType.multipleChoice,
          options: [
            'G - A - B - C - D - E - F# - G',
            'G - A - B - C# - D - E - F# - G',
            'G - A - Bb - C - D - E - F - G',
            'G - Ab - B - C - D - Eb - F# - G',
          ],
          correctAnswerIndex: 0,
          explanation:
              'The G Major scale uses all natural notes except F# (which is raised to maintain the half step before the octave).',
          points: 10,
        ),
        QuizQuestion(
          id: 'q3',
          lessonId: 'inter-03-g-major-scale',
          question: 'In the circle of fifths, G Major is one position _____ from C Major.',
          type: QuestionType.fillInTheBlank,
          options: [
            'clockwise',
            'counterclockwise',
            'opposite',
            'adjacent',
          ],
          correctAnswerIndex: 0,
          explanation:
              'Moving clockwise on the circle of fifths adds one sharp with each step. G is one step clockwise from C, adding F#.',
          points: 10,
        ),
        QuizQuestion(
          id: 'q4',
          lessonId: 'inter-03-g-major-scale',
          question: 'Why is F# necessary in the G Major scale?',
          type: QuestionType.multipleChoice,
          options: [
            'To maintain the major scale pattern (W-W-H-W-W-W-H)',
            'Because G Major is related to E Minor',
            'To make the scale sound brighter',
            'To avoid using black keys',
          ],
          correctAnswerIndex: 0,
          explanation:
              'The major scale has a specific interval pattern. Without F#, the interval from F natural to G would be a whole step instead of the required half step.',
          points: 10,
        ),
        QuizQuestion(
          id: 'q5',
          lessonId: 'inter-03-g-major-scale',
          question: 'The key signature for G Major is a sharp placed on the F line.',
          type: QuestionType.trueOrFalse,
          options: ['True', 'False'],
          correctAnswerIndex: 0,
          explanation:
              'Correct! In sheet music, a sharp on the F line indicates G Major (or E Minor as relative minor). This tells you to play F# throughout the piece.',
          points: 10,
        ),
      ],
      passingScore: 70,
    ),

    // ═══════════════════════════════════════════════════════════════════════
    // ADVANCED LEVEL QUIZZES
    // ═══════════════════════════════════════════════════════════════════════

    'adv-01-dominant-seventh': LessonQuiz(
      lessonId: 'adv-01-dominant-seventh',
      title: 'Dominant Seventh Chord Quiz',
      description: 'Test your understanding of functional harmony and cadences',
      questions: [
        QuizQuestion(
          id: 'q1',
          lessonId: 'adv-01-dominant-seventh',
          question: 'What notes make up a G7 chord in C Major?',
          type: QuestionType.multipleChoice,
          options: [
            'G - B - D - F',
            'G - B - D - F#',
            'G - Bb - D - F',
            'G - B - Db - F',
          ],
          correctAnswerIndex: 0,
          explanation:
              'G7 = G Major chord (G-B-D) + minor 7th (F). The F is a half step below the G octave, creating tension.',
          points: 10,
        ),
        QuizQuestion(
          id: 'q2',
          lessonId: 'adv-01-dominant-seventh',
          question: 'The tritone interval in G7 (in C Major) is between which two notes?',
          type: QuestionType.multipleChoice,
          options: [
            'B and F',
            'G and D',
            'D and F',
            'B and D',
          ],
          correctAnswerIndex: 0,
          explanation:
              'The tritone (B to F or F to B) is the most dissonant interval in Western harmony. It creates the tension in V7 that demands resolution to I.',
          points: 10,
        ),
        QuizQuestion(
          id: 'q3',
          lessonId: 'adv-01-dominant-seventh',
          question: 'How does the tritone resolve when V7 moves to I?',
          type: QuestionType.multipleChoice,
          options: [
            'B resolves up to C, F resolves down to E',
            'B resolves down to A, F resolves up to G',
            'Both notes resolve inward to a unison',
            'The tritone remains unresolved',
          ],
          correctAnswerIndex: 0,
          explanation:
              'Both notes resolve by the smallest interval possible: B (leading tone) goes up to C, F (minor 7th) goes down to E. This smooth voice leading is essential.',
          points: 10,
        ),
        QuizQuestion(
          id: 'q4',
          lessonId: 'adv-01-dominant-seventh',
          question: 'Secondary dominants allow chromatic alterations while maintaining:',
          type: QuestionType.fillInTheBlank,
          options: [
            'functional harmony',
            'modal harmony',
            'pentatonic scales',
            'whole tone progressions',
          ],
          correctAnswerIndex: 0,
          explanation:
              'Secondary dominants (like V7/IV or V7/ii) create chromatic alterations but maintain the functional harmony framework. They add color without leaving the key.',
          points: 10,
        ),
        QuizQuestion(
          id: 'q5',
          lessonId: 'adv-01-dominant-seventh',
          question: 'The V7-I progression defines tonality and articulates musical form.',
          type: QuestionType.trueOrFalse,
          options: ['True', 'False'],
          correctAnswerIndex: 0,
          explanation:
              'Correct! The authentic cadence (V7-I) is the strongest harmonic statement in Western music, used to define keys and mark structural points.',
          points: 10,
        ),
      ],
      passingScore: 70,
    ),
  };

  static LessonQuiz? getQuiz(String lessonId) {
    return _quizzes[lessonId];
  }

  static List<LessonQuiz> getAllQuizzes() {
    return _quizzes.values.toList();
  }

  static List<LessonQuiz> getQuizzesByLevel(String level) {
    final prefix = level.toLowerCase().startsWith('int') ? 'inter' : 'adv';
    return _quizzes.values.where((q) => q.lessonId.startsWith(prefix)).toList();
  }
}
