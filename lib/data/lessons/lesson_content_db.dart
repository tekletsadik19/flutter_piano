class LessonContentDetail {
  final String lessonId;
  final String title;
  final String description;
  final String theory; // Music theory explanation
  final String technique; // Technical/performance guidance
  final String history; // Historical context
  final String tips; // Practice tips
  final List<String> objectives; // Learning outcomes
  final List<String> keyPoints; // Main takeaways
  final String? reference; // External resource recommendation

  const LessonContentDetail({
    required this.lessonId,
    required this.title,
    required this.description,
    required this.theory,
    required this.technique,
    required this.history,
    required this.tips,
    required this.objectives,
    required this.keyPoints,
    this.reference,
  });
}

class LessonContentDatabase {
  static final Map<String, LessonContentDetail> _contents = {
    'practice-c-major-chord': LessonContentDetail(
      lessonId: 'practice-c-major-chord',
      title: 'Practice: C Major Chord',
      description: 'Master the fundamental C Major triad',
      theory: '''
CHORD STRUCTURE (Tertian Harmony)
The C Major chord is constructed by stacking thirds:
• Root (1st): C (do)
• Major 3rd: E (mi) — 4 semitones from root
• Perfect 5th: G (sol) — 7 semitones from root

In scale degrees (using C Major scale):
• Degree 1 (Tonic): C
• Degree 3 (Mediant): E
• Degree 5 (Dominant): G

HARMONIC FUNCTION
The C Major chord (I) is the tonic chord in C Major:
- Establishes tonality and home key
- Creates harmonic stability
- Most basic functional harmony

INVERSIONS
• Root position: C-E-G (root in bass)
• First inversion: E-G-C (3rd in bass) — notated as C/E or I⁶
• Second inversion: G-C-E (5th in bass) — notated as C/G or I⁶₄
      ''',
      technique: '''
HAND POSITION & FINGER PLACEMENT
• Curved fingers throughout (as if holding tennis ball)
• Wrist neutral, not bent up or down
• Finger 1 (thumb) on C
• Finger 3 (middle) on E
• Finger 5 (pinky) on G
• Keys should be pressed simultaneously for chord attack

VOICE LEADING (Smooth Part Writing)
When moving from one chord to another:
• Keep common tones (notes that appear in both chords)
• Move other notes by smallest interval possible
• Avoid large jumps between parts

TONE PRODUCTION
• Press all three notes with equal force
• Sustain for desired duration (typically 2-4 beats)
• Release cleanly without arpeggios (unless indicated)
• Use consistent dynamics for even sonority
      ''',
      history: '''
ORIGINS OF MAJOR CHORDS
Major triads emerged in Renaissance music (1400s):
• Previously: organum (parallel intervals)
• Shift: tertian harmony (stacked thirds)
• Impact: foundation of Western classical harmony

C MAJOR IN MUSIC HISTORY
- C Major: default key for many composers
- Easiest white-key key (no sharps/flats in scale)
- Used by Bach, Mozart, Beethoven in pedagogical works
- Example: Bach's Prelude in C Major (WTC Book 1)
        - Mozart's C Major sonatas (K.545)
- Romantic composers expanded chord vocabulary with alterations

CULTURAL SIGNIFICANCE
C Major represents:
- Purity and innocence in symbolist music theory
- Brightness and openness in tonal perception
- Common choice for hymns and folk melodies
      ''',
      tips: '''
PRACTICE PROGRESSION
Week 1: Play slowly, focus on even sound and finger placement
Week 2: Increase tempo to ♩=120, repeat 10-20 times daily
Week 3: Practice chord transitions (C→G→C)
Week 4: Add rhythm patterns (whole notes, quarter notes)

DAILY ROUTINE
• Warm-up: Scales in C Major (1 min)
• Isolation: Play each note separately, then together (2 min)
• Repetition: 10 perfect chord plays (2-3 min)
• Application: Use chord in simple progressions (3 min)

TROUBLESHOOTING
- If notes don't sound together: check simultaneous pressing
- If hand tires: check wrist tension (should be relaxed)
- If uneven sound: practice individual fingers first
      ''',
      objectives: [
        'Understand chord construction and harmonic function',
        'Play C Major chord with proper hand position',
        'Maintain consistent tone across all three notes',
        'Recognize C Major in harmonic progressions',
        'Develop finger independence and strength',
      ],
      keyPoints: [
        'Major triad = root + major 3rd + perfect 5th',
        'C Major = C-E-G',
        'I chord is most stable (tonic function)',
        'Use curved fingers and relaxed wrist',
        'Apply consistent daily practice for muscle memory',
      ],
      reference: 'Bastien Piano Basics Level 2 | ABRSM Piano Primer Grade 1',
    ),

    'practice-c-major-scale': LessonContentDetail(
      lessonId: 'practice-c-major-scale',
      title: 'Practice: C Major Scale',
      description: 'Develop scale fluency and finger technique',
      theory: '''
SCALE STRUCTURE
A major scale is built using the interval pattern: W-W-H-W-W-W-H
Where: W = whole step (2 semitones), H = half step (1 semitone)

C MAJOR SCALE
Notes: C - D - E - F - G - A - B - C
Intervals:
  C → D: W (2 semitones)
  D → E: W (2 semitones)
  E → F: H (1 semitone) ← shortest interval
  F → G: W (2 semitones)
  G → A: W (2 semitones)
  A → B: W (2 semitones)
  B → C: H (1 semitone) ← shortest interval

SCALE DEGREES & SOLFÈGE
1. C (do) — Tonic (root/home)
2. D (re) — Supertonic
3. E (mi) — Mediant
4. F (fa) — Subdominant
5. G (sol) — Dominant (5th degree)
6. A (la) — Submediant
7. B (ti) — Leading tone (pulls toward tonic)
8. C (do) — Octave

MODAL BORROWING
Other scales using same pitches as C Major:
• D Dorian: D-E-F-G-A-B-C-D (minor character)
• E Phrygian: E-F-G-A-B-C-D-E (Spanish flavor)
• F Lydian: F-G-A-B-C-D-E-F (raised 4th)
• G Mixolydian: G-A-B-C-D-E-F-G (minor 7th)
• A Aeolian (Natural Minor): A-B-C-D-E-F-G-A
• B Locrian: B-C-D-E-F-G-A-B (diminished quality)
      ''',
      technique: '''
FINGER PATTERNS FOR C MAJOR SCALE
Right Hand (ascending):
• Fingers 1-2-3, cross 1 under 3, 2-3-4-5
• Thumb placement: under hand between 3-4 fingers
• Smooth execution of thumb crossing prevents bumps

Left Hand (ascending):
• Fingers 5-4-3, cross 5 over 1, 2-3-1
• Thumb moves over hand between 2-3 fingers

HAND POSITION
• Wrist height: slightly above hand level
• Palm curve: maintain arch throughout
• Fingers: curved at knuckles, never flat
• Rotation: subtle wrist rotation helps smooth crossings

TECHNIQUE PROGRESSION
Legato: Connected, smooth scale (no gaps between notes)
Staccato: Detached, bouncy scale (short note values)
Mixed articulation: Legato ascending, staccato descending

TEMPO DEVELOPMENT
Week 1: ♩=60 (very slow, focus on accuracy)
Week 2: ♩=90 (moderate tempo)
Week 3: ♩=120 (brisk, concert pace)
Week 4+: ♩=180+ (fluent, confident)
      ''',
      history: '''
SCALE DEVELOPMENT IN MUSIC HISTORY
Ancient/Medieval: Church modes (Gregorian chant)
Renaissance: Shift toward major/minor tonality
Baroque: Temperament standardization (equal temperament)
  - This enabled all keys to be playable
  - Bach's Well-Tempered Clavier: demonstrates all 24 keys
Classical: Major scales as foundational technique
Romantic: Extended scales (harmonic minor, whole-tone, etc.)
Modern: Non-Western scales, microtonality

C MAJOR IN PEDAGOGY
Chosen as starting key because:
- No accidentals (sharps/flats) — no black keys needed
- Most comfortable on white-key keyboard
- Psychological: represents "purity" and "beginning"
- Historical: used by Czerny, Hanon, Burgmüller in etudes
      ''',
      tips: '''
EFFECTIVE SCALE PRACTICE
Daily Routine:
• 5 minutes: C Major scale at ♩=60-90
• 5 minutes: Different articulations (legato, staccato)
• 5 minutes: Scale in thirds, sixths, octaves
• 5 minutes: Scale in keys (I-IV-V chords underneath)

COMMON MISTAKES TO AVOID
1. Uneven finger weight → practice each finger in isolation
2. Wrist tension on crossings → consciously relax before crossing
3. Skipping/blurring notes → slow down to audible tempo
4. Rushing higher notes → maintain steady pulse
5. Forgetting black keys in other keys → stay in C Major initially

MUSICAL APPLICATION
• Transpose to G Major (add one sharp F#)
• Then D Major (add F# and C#)
• Progress through circle of fifths
• Scales ≠ end goal; use scales as technique for pieces
      ''',
      objectives: [
        'Play C Major scale smoothly and evenly',
        'Master correct finger crossings (thumb under, over)',
        'Develop finger independence and flexibility',
        'Understand scale degrees and their functions',
        'Apply scales to improvisation and composition',
      ],
      keyPoints: [
        'C Major pattern: W-W-H-W-W-W-H',
        'Scale degrees: tonic, supertonic, mediant, subdominant, dominant...',
        'Finger patterns must be automatic (muscle memory)',
        'Practice slowly first, then increase tempo',
        'Scales are technique building blocks for repertoire',
      ],
      reference: 'Hanon Virtuoso Pianist | Czerny 100 Progressive Etudes | ABRSM Grade 1-2',
    ),

    'practice-c-major-arpeggio': LessonContentDetail(
      lessonId: 'practice-c-major-arpeggio',
      title: 'Practice: C Major Arpeggio',
      description: 'Develop hand independence and fluent chord playing',
      theory: '''
ARPEGGIO DEFINITION
An arpeggio is a chord played one note at a time, in ascending or descending order.
From Italian "arpeggiare" (to play on the harp) → harp-like flowing effect.

C MAJOR ARPEGGIO CONSTRUCTION
Built from C Major triad (C-E-G) extended across octaves:
• Ascending: C(octave 1) - E - G - C(octave 2) - E - G - C(octave 3)
• Descending: C(octave 3) - G - E - C(octave 2) - G - E - C(octave 1)

HARMONIC FUNCTION
Unlike scalar motion (stepwise intervals):
- Arpeggios outline chord harmony
- Creates flowing accompaniment figures
- Emphasizes chord structure more than scalar relationships

INTERVAL CONTENT
Each step of C Major arpeggio spans:
• C to E: major 3rd (4 semitones)
• E to G: minor 3rd (3 semitones)
• G to C: perfect 4th (5 semitones)
Pattern repeats across register

INVERSION ARPEGGIOS
First Inversion (E-G-C):
- Chord tones start from 3rd degree
- Creates lighter, more flowing effect
Second Inversion (G-C-E):
- Chord tones start from 5th degree
- Less common, creates open sonority
      ''',
      technique: '''
HAND POSITION & POSTURE
• Relaxed wrist and fingers
• Allow wrist rotation during arpeggio run
• Finger arch maintained throughout
• Arm moves with hand to accommodate large intervals

FINGER TECHNIQUE
Ascending (R.H.):
• 1-2-3 (fingers on C-E-G)
• Cross 1 under to reach next C
• Continue 2-3-1-2-3-1...
Descending (R.H.):
• 3-2-1 (fingers on G-E-C)
• Cross 3 over to reach C below
• Continue 2-1-3-2-1-3...

WRIST MOTION
Proper wrist rotation prevents tension and:
- Allows rapid note repetition
- Enables smooth phrase shaping
- Reduces injury risk
- Creates legato between octaves

DYNAMIC CONTROL
• Even volume across all notes
• No louder first note (unless marked)
• Smooth crescendo/diminuendo possible
• Practice with metronome for rhythmic evenness
      ''',
      history: '''
ARPEGGIO IN MUSIC HISTORY
Renaissance/Baroque: Lute and harp technique translated to keyboard
  - Natural to plucked strings
  - Creates "harp-like" effect on piano
Baroque: Bach and Handel use arpeggios in keyboard works
Classical: Alberti bass (broken chord accompaniment)
  - Patterns like C-E-G-E-C-E-G-E under melody
  - Foundation of Classical-era keyboard music
Romantic: Liszt and Chopin: virtuosic rapid arpeggios
  - Technical display and musical expressivity
  - Extended arpeggios (multiple octaves)

PEDAGOGICAL USE
Arpeggios develop:
- Hand dexterity and finger independence
- Chord comprehension (how notes relate)
- Preparation for Alberti bass patterns
- Foundation for Romantic-era piano technique
      ''',
      tips: '''
PROGRESSIVE PRACTICE
Week 1: Single octave arpeggio (C-E-G-C), slow tempo
Week 2: Two octaves, increase tempo to ♩=100
Week 3: Three+ octaves, add rhythmic variations
Week 4: Combine with melody (arpeggio accompaniment)

DAILY ROUTINE
• 3 min: Arpeggio ascending slowly (♩=80)
• 2 min: Arpeggio descending slowly
• 3 min: Ascending + descending combined
• 2 min: Tempo increase (♩=120+)

RHYTHMIC VARIATIONS
Practice arpeggio with different note values:
- Whole notes (sustained)
- Quarter notes (steady pulse)
- Triplets (flowing, lilting quality)
- Sixteenths (rapid, brilliant)

COMMON ERRORS
1. Uneven volume: isolate weak fingers for extra practice
2. Skipping/repeating notes: slow down, check wrist position
3. Tension in hand: consciously relax between octaves
4. Stopping at peak: continue smoothly to lowest notes
      ''',
      objectives: [
        'Play C Major arpeggio across multiple octaves smoothly',
        'Understand how arpeggios outline chord harmony',
        'Master wrist rotation for rapid note changes',
        'Develop hand independence and coordination',
        'Apply arpeggios to Alberti bass patterns and accompaniment',
      ],
      keyPoints: [
        'Arpeggio = broken chord played one note at a time',
        'C Major arpeggio uses notes C-E-G repeated',
        'Wrist rotation prevents tension and enables fluency',
        'Even dynamics across all notes (unless marked otherwise)',
        'Foundation for Classical and Romantic era techniques',
      ],
      reference: 'Czerny 101 Etudes Op.261 | Hanon Virtuoso Pianist | ABRSM Grade 2-3',
    ),
  };

  static LessonContentDetail? getContent(String lessonId) {
    return _contents[lessonId];
  }

  static List<LessonContentDetail> getAllContents() {
    return _contents.values.toList();
  }
}
