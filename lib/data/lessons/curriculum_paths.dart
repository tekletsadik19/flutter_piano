import '../../features/lessons/domain/entities/curriculum_path.dart';

/// Pre-designed curriculum paths guiding students through structured learning
final curriculumPaths = <CurriculumPath>[
  // ═══════════════════════════════════════════════════════════════════════
  // BEGINNER PATHWAY
  // ═══════════════════════════════════════════════════════════════════════

  CurriculumPath(
    id: 'path-beginner-fundamentals',
    title: 'Piano Fundamentals',
    description: 'Master the essential foundations of piano playing',
    type: PathType.beginner,
    lessonIds: [
      'b_01', 'b_02', 'b_03', 'b_04', 'b_05',
      'b_06', 'b_07', 'b_08', 'b_09', 'b_10',
    ],
    estimatedHoursDuration: 20,
    targetAudience: 'Complete beginners with no prior musical experience',
    prerequisites: [],
    outcomes: [
      'Understand piano keyboard layout and orientation',
      'Play simple melodies with correct finger positioning',
      'Read music on treble and bass clefs',
      'Understand basic rhythm and time signatures',
      'Develop proper posture and hand position',
      'Build finger independence and dexterity',
    ],
  ),

  // ═══════════════════════════════════════════════════════════════════════
  // INTERMEDIATE PATHWAYS
  // ═══════════════════════════════════════════════════════════════════════

  CurriculumPath(
    id: 'path-intermediate-harmony',
    title: 'Harmonic Function & Chord Mastery',
    description: 'Deep dive into chords, progressions, and harmonic theory',
    type: PathType.intermediate,
    lessonIds: [
      'inter-01-g-major-chord',
      'inter-02-a-minor-chord',
      'adv-01-dominant-seventh',
      'adv-02-major-seventh-chord',
      'adv-03-minor-seventh-chord',
    ],
    estimatedHoursDuration: 15,
    targetAudience: 'Intermediate pianists ready to understand harmonic function',
    prerequisites: ['b_10'],
    outcomes: [
      'Master chord construction and inversions',
      'Understand functional harmony and cadences',
      'Play progressions smoothly with voice leading',
      'Recognize chord types by sound',
      'Apply chords to improvisation and composition',
      'Understand circle of fifths relationships',
    ],
  ),

  CurriculumPath(
    id: 'path-intermediate-scales',
    title: 'Scale System & Technical Foundation',
    description: 'Master all major and minor scales with proper technique',
    type: PathType.intermediate,
    lessonIds: [
      'i_01', // C Major Scale
      'inter-03-g-major-scale',
      'inter-04-a-minor-natural-scale',
      'adv-07-harmonic-and-melodic-minor',
      'a_01', // All 12 Major Scales
    ],
    estimatedHoursDuration: 18,
    targetAudience: 'Pianists building technical foundation and finger independence',
    prerequisites: ['b_10'],
    outcomes: [
      'Play all 12 major scales with proper fingering',
      'Master natural, harmonic, and melodic minor forms',
      'Understand key signatures and circle of fifths',
      'Build finger speed and accuracy',
      'Recognize scale patterns in music',
      'Transpose scales to all keys fluidly',
    ],
  ),

  CurriculumPath(
    id: 'path-intermediate-arpeggios',
    title: 'Arpeggio Technique & Broken Chord Mastery',
    description: 'Master broken chord patterns and extended arpeggios',
    type: PathType.intermediate,
    lessonIds: [
      'inter-05-g-major-arpeggio',
      'practice-c-major-arpeggio',
      'practice-g-major-arpeggio',
    ],
    estimatedHoursDuration: 12,
    targetAudience: 'Pianists developing fluency with broken chord patterns',
    prerequisites: ['inter-03-g-major-scale'],
    outcomes: [
      'Play extended arpeggios across full keyboard',
      'Master hand crossing techniques',
      'Develop Alberti bass and accompaniment patterns',
      'Understand harmonic function in arpeggios',
      'Apply arpeggios to classical and contemporary music',
    ],
  ),

  // ═══════════════════════════════════════════════════════════════════════
  // ADVANCED PATHWAYS
  // ═══════════════════════════════════════════════════════════════════════

  CurriculumPath(
    id: 'path-advanced-extended-harmony',
    title: 'Advanced Harmonic Theory',
    description: 'Master seventh chords, modulation, and voice leading',
    type: PathType.advanced,
    lessonIds: [
      'adv-01-dominant-seventh',
      'adv-02-major-seventh-chord',
      'adv-03-minor-seventh-chord',
      'adv-04-four-part-writing',
      'adv-05-modulation-techniques',
    ],
    estimatedHoursDuration: 20,
    targetAudience: 'Advanced pianists studying composition and jazz harmony',
    prerequisites: ['path-intermediate-harmony'],
    outcomes: [
      'Master all seventh chord types and their functions',
      'Understand voice leading principles in four-part harmony',
      'Execute smooth modulations between keys',
      'Apply secondary dominants and chromatic alterations',
      'Understand jazz and contemporary harmonic practices',
    ],
  ),

  CurriculumPath(
    id: 'path-advanced-modal-exploration',
    title: 'Modes & Advanced Scale Systems',
    description: 'Explore all seven modes and their musical applications',
    type: PathType.advanced,
    lessonIds: [
      'adv-06-modes-and-scales',
      'adv-07-harmonic-and-melodic-minor',
    ],
    estimatedHoursDuration: 14,
    targetAudience: 'Advanced pianists interested in jazz and contemporary music',
    prerequisites: ['a_01'],
    outcomes: [
      'Master all seven modes: Ionian through Locrian',
      'Understand modal interchange and harmonic color',
      'Apply modes to improvisation and composition',
      'Recognize modal characteristics by ear',
      'Understand relationship between modes and chords',
    ],
  ),

  CurriculumPath(
    id: 'path-advanced-rhythm-mastery',
    title: 'Complex Rhythms & Metric Sophistication',
    description: 'Master advanced rhythmic concepts and polyrhythms',
    type: PathType.advanced,
    lessonIds: [
      'inter-07-compound-meter',
      'adv-08-polyrhythm-basics',
      'adv-09-metric-modulation',
    ],
    estimatedHoursDuration: 12,
    targetAudience: 'Advanced pianists studying contemporary classical and jazz',
    prerequisites: ['i_01'],
    outcomes: [
      'Master compound meters and their applications',
      'Execute polyrhythmic patterns with precision',
      'Understand metric modulation mathematically',
      'Apply complex rhythms to contemporary music',
      'Develop rhythmic independence between hands',
    ],
  ),

  // ═══════════════════════════════════════════════════════════════════════
  // SPECIALIST PATHWAYS
  // ═══════════════════════════════════════════════════════════════════════

  CurriculumPath(
    id: 'path-specialist-jazz-piano',
    title: 'Jazz Piano Foundation',
    description: 'Journey from jazz fundamentals to intermediate improvisation',
    type: PathType.specialist,
    lessonIds: [
      'adv-01-dominant-seventh',
      'adv-02-major-seventh-chord',
      'adv-03-minor-seventh-chord',
      'adv-06-modes-and-scales',
    ],
    estimatedHoursDuration: 25,
    targetAudience: 'Pianists transitioning to jazz and improvisation',
    prerequisites: ['path-intermediate-harmony'],
    outcomes: [
      'Understand jazz chord symbols and extensions',
      'Play jazz standards and lead sheets',
      'Develop improvisation skills over changes',
      'Master jazz voicing and comping techniques',
      'Understand jazz history and influential pianists',
    ],
  ),

  CurriculumPath(
    id: 'path-specialist-classical-technique',
    title: 'Classical Performance Technique',
    description: 'Comprehensive technique training for classical repertoire',
    type: PathType.specialist,
    lessonIds: [
      'a_01', // All 12 Major Scales
      'a_02', // Harmonic & Melodic Minor
      'inter-05-g-major-arpeggio',
      'adv-04-four-part-writing',
    ],
    estimatedHoursDuration: 30,
    targetAudience: 'Classical pianists preparing for exams and performances',
    prerequisites: ['path-intermediate-scales'],
    outcomes: [
      'Master RCM and ABRSM examination requirements',
      'Develop virtuosic technical facility',
      'Understand interpretation and phrasing',
      'Prepare for classical music performances',
      'Study major composers and periods',
    ],
  ),

  CurriculumPath(
    id: 'path-specialist-theory-mastery',
    title: 'Complete Music Theory for Piano',
    description: 'Comprehensive music theory integrated with piano technique',
    type: PathType.specialist,
    lessonIds: [
      'inter-01-g-major-chord',
      'inter-03-g-major-scale',
      'inter-06-major-and-minor-thirds',
      'adv-01-dominant-seventh',
      'adv-04-four-part-writing',
      'adv-05-modulation-techniques',
    ],
    estimatedHoursDuration: 28,
    targetAudience: 'Pianists serious about music theory and composition',
    prerequisites: ['path-intermediate-harmony'],
    outcomes: [
      'Master ABRSM and RCM theory curriculum',
      'Understand harmonic analysis of compositions',
      'Apply theory to composition and arrangement',
      'Develop ear training and dictation skills',
      'Prepare for music theory examinations',
    ],
  ),
];

/// Get all available curriculum paths
List<CurriculumPath> getAllPaths() => curriculumPaths;

/// Get paths by type
List<CurriculumPath> getPathsByType(PathType type) =>
    curriculumPaths.where((p) => p.type == type).toList();

/// Get a specific path by ID
CurriculumPath? getPathById(String pathId) {
  try {
    return curriculumPaths.firstWhere((p) => p.id == pathId);
  } catch (e) {
    return null;
  }
}

/// Get recommended next paths based on current progress
List<CurriculumPath> getRecommendedPaths(List<String> completedPathIds) {
  final completed = Set.from(completedPathIds);
  return curriculumPaths
      .where((path) => !completed.contains(path.id))
      .where((path) {
        // Check if prerequisites are met
        return path.prerequisites.isEmpty ||
            path.prerequisites.every((prereq) => completed.contains(prereq));
      })
      .toList();
}
