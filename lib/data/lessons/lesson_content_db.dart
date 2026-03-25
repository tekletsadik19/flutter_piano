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

    'inter-01-g-major-chord': LessonContentDetail(
      lessonId: 'inter-01-g-major-chord',
      title: 'G Major Chord & Circle of Fifths',
      description: 'Explore the V chord and harmonic progression fundamentals',
      theory: '''
G MAJOR CHORD (V in C Major)
Notes: G - B - D
Structure: Root + Major 3rd (4 semitones) + Perfect 5th (7 semitones)

HARMONIC FUNCTION IN C MAJOR
I (C Major): Tonic - home, stability, resolution
IV (F Major): Subdominant - preparation
V (G Major): Dominant - tension, leading back to I
vi (A Minor): Relative minor - softer quality

CADENCES (Harmonic Endings)
Perfect Cadence (V-I): Strong resolution, sense of completion
• G Major → C Major
• Most conclusive ending in classical music
• Example: end of movement or piece

Plagal Cadence (IV-I): Softer, more gentle resolution
Deceptive Cadence (V-vi): Unexpected resolution to minor

CIRCLE OF FIFTHS
Visualization of all 12 major keys and their relationships
C → G → D → A → E → B → F# (or Gb) → Db → Ab → Eb → Bb → F → C

Each step adds one sharp (clockwise) or one flat (counter-clockwise)
This circle explains key relationships and modulation paths
      ''',
      technique: '''
V-I CADENCE TECHNIQUE
Playing the progression from V to I:
• Position hand for G Major chord (fingers 1-3-5 on G-B-D)
• Play with clear attack, slight emphasis
• Move smoothly to C Major chord
• Release G Major before pressing C Major (clean change)

HARMONIC MOVEMENT
Smooth voice leading: minimize hand movement
• G Major to C Major: move each finger minimal distance
  - G stays as G (upper C)
  - B moves down to C (one key)
  - D moves down to E (one key)

DYNAMIC SHAPING
Cadential phrases typically:
• Build slightly into V chord (tension)
• Relax into I chord (resolution)
• Creates natural musical phrasing
      ''',
      history: '''
DOMINANT FUNCTION IN MUSIC HISTORY
Baroque (Bach, Handel): V-I fundamental to harmonic structure
Classical (Mozart, Beethoven): perfected the perfect cadence
Romantic (Chopin, Brahms): expanded cadential possibilities
Modern: dodecaphonic and atonal composers eliminated this function

CIRCLE OF FIFTHS PEDAGOGY
Invented by Johann David Heinichen (1728)
Became standard teaching tool for understanding key relationships
Essential for understanding modulation (changing keys)
Foundation of music theory education worldwide
      ''',
      tips: '''
PRACTICE V-I PROGRESSION
Week 1: Play each chord separately, then together slowly
Week 2: Add cadential rhythm (whole notes)
Week 3: Play multiple times in succession
Week 4: Combine with melody on top

TRANSPOSITION EXERCISE
After mastering in C Major, transpose to:
• G Major (add F#)
• D Major (add F# and C#)
• A Major (add F#, C#, and G#)
• F Major (add Bb)

This reinforces the circle of fifths pattern
      ''',
      objectives: [
        'Understand V-I perfect cadence and its function',
        'Play smooth voice leading from V to I',
        'Recognize the circle of fifths and key relationships',
        'Apply dominant function to harmonic progressions',
        'Transpose cadences to different keys',
      ],
      keyPoints: [
        'G Major (V) creates tension; C Major (I) resolves it',
        'Perfect cadence is strongest, most conclusive ending',
        'Circle of fifths explains all 12 key relationships',
        'Voice leading: minimize finger movement between chords',
        'Cadences are building blocks of harmonic form',
      ],
      reference: 'Kostka/Payne Tonal Harmony | ABRSM Theory Grade 4-5',
    ),

    'inter-03-g-major-scale': LessonContentDetail(
      lessonId: 'inter-03-g-major-scale',
      title: 'G Major Scale & Sharps',
      description: 'Master scales with one sharp (F#)',
      theory: '''
G MAJOR SCALE WITH ONE SHARP (F#)
Notes: G - A - B - C - D - E - F# - G
Pattern: W-W-H-W-W-W-H (same as all major scales)

WHY F# IS NECESSARY
To maintain the major scale pattern:
• Natural F (white key): creates whole step to G (incorrect)
• F# (black key): creates half step to G (correct)
• This maintains the W-W-H-W-W-W-H pattern

KEY SIGNATURE
One sharp symbol (♯) placed on F line in treble clef
Indicates G Major (or E Minor in relative minor)
Replaces writing F# for every F throughout piece

CIRCLE OF FIFTHS
C Major: no sharps
G Major: 1 sharp (F#)
D Major: 2 sharps (F#, C#)
A Major: 3 sharps (F#, C#, G#)
Pattern: each key adds one more sharp going clockwise
      ''',
      technique: '''
FINGER PATTERN FOR G MAJOR SCALE
Right Hand Ascending:
• 1-2-3 (G-A-B), cross 1 under 3, 2-3-4-5 (C-D-E-F#-G)
Note: F# is played with finger 4 (different from C Major where F is finger 4)

READING F# IN SCALE
Must identify F# quickly:
• Count position: F is on line, F# is on line (raised)
• Muscle memory: F# is one key right of F
• Speed reading: practice saying "F-sharp" as you play

TECHNIQUE PROGRESSION
Week 1: Play slowly (♩=60), focus on clean F# transition
Week 2: Increase tempo to ♩=90, maintain evenness
Week 3: Practice staccato and legato articulations
Week 4: Add scale work in chords and thirds
      ''',
      history: '''
G MAJOR IN MUSIC HISTORY
Popular key for Baroque composers:
• Georg Friedrich Händel: many sonatas in G Major
• Johann Sebastian Bach: WTC Book 2, Prelude in G Major
• Antonio Vivaldi: Four Seasons, several movements in G Major

Classical composers loved G Major:
• Joseph Haydn: nicknamed "Haydn's favorite key"
• Wolfgang Amadeus Mozart: Piano Concerto No. 17 in G Major
• Ludwig van Beethoven: Symphony No. 2 in D Major modulates to G

CULTURAL SIGNIFICANCE
G Major: considered bright, brilliant, festive
Associated with trumpet and clarinet (natural harmonics in G)
Romantic composers used it for pastoral, cheerful scenes
      ''',
      tips: '''
DAILY G MAJOR ROUTINE
• 2 minutes: G Major scale slowly, focus on F#
• 2 minutes: Different articulations (legato, staccato, mixed)
• 2 minutes: Scale in thirds and sixths
• 2 minutes: G Major chord progression (I-IV-V-I)

COMMON MISTAKES
1. Playing F natural instead of F# - check key signature!
2. Uneven finger weight on F# - practice in isolation
3. Tension on cross-over - relax before crossing thumb
4. Skipping G at octave - maintain steady pulse

TRANSPOSITION TIP
Once comfortable with G Major:
Transpose to D Major (2 sharps) then A Major (3 sharps)
This reinforces understanding of sharps in circle of fifths
      ''',
      objectives: [
        'Play G Major scale with proper finger technique',
        'Master F# identification and execution',
        'Understand how sharps maintain major scale pattern',
        'Read key signatures with sharps correctly',
        'Apply G Major to harmonic progressions and pieces',
      ],
      keyPoints: [
        'One sharp (F#) is the key signature for G Major',
        'F# maintains half step between 7th and 8th scale degrees',
        'Circle of fifths shows sharp progression (each key adds one)',
        'G Major finger pattern differs slightly from C Major',
        'This is foundation for understanding all sharp keys',
      ],
      reference: 'Bastien Piano Basics Level 3 | ABRSM Piano Grade 2-3',
    ),
    'inter-02-a-minor-chord': LessonContentDetail(
      lessonId: 'inter-02-a-minor-chord',
      title: 'A Minor Chord & Relative Minor',
      description: 'Understand relative minor key relationships',
      theory: '''
RELATIVE MINOR KEY RELATIONSHIP
A Minor is the relative minor of C Major:
• Same notes: C Major scale = A Minor scale
• Both use all white keys (no accidentals)
• This parallel relationship occurs because A Minor starts on scale degree 6 of C Major

HARMONIC FUNCTION
In C Major:
• I = C Major (1-3-5)
• vi = A Minor (6-3-5 from C, or 1-3-5 from A)
• The vi chord is the relative minor

CHARACTERISTICS OF MINOR
Minor chords use:
• Root (1st)
• Minor 3rd (3 semitones from root, not 4)
• Perfect 5th (7 semitones from root)

Example: A Minor = A (root) + C (minor 3rd) + E (perfect 5th)

EMOTIONAL QUALITIES
• Major intervals and chords = bright, happy, resolved
• Minor intervals and chords = dark, sad, introspective
• The difference lies entirely in the 3rd being major or minor
      ''',
      technique: '''
HAND POSITION FOR A MINOR CHORD
• Left hand starting position (if playing in treble):
  - Thumb (1) on A
  - Middle finger (3) on C
  - Pinky (5) on E
• Comfortable spread across white keys only
• Wrist should remain neutral

TRANSITIONS FROM C MAJOR TO A MINOR
• C Major: C-E-G
• A Minor: A-C-E
• Note: E and C are common tones
• Smoothest voice leading: keep E and C stationary, move C to A
• This demonstrates smooth voice leading principle

TONE PRODUCTION FOR MINOR CHORDS
• Use same finger pressure as major chords
• Attack should be deliberate but not harsh
• Sustain creates the minor character
• Lighter touch can emphasize the introspective quality
      ''',
      history: '''
RELATIVE MAJOR/MINOR IN CLASSICAL FORMS
Composers frequently modulated to relative major/minor:
• Sonata form: themes in relative major (for lighter sections)
• Rondo: returns to minor after relative major section
• Minuet & Trio: trio often in relative major

BACH'S EXPLORATION OF KEY RELATIONS
J.S. Bach: Well-Tempered Clavier pairs major and minor
• C Major Prelude followed by C Minor Prelude
• Demonstrates both emotional character and technical complexity

ROMANTIC ERA DEVELOPMENT
19th century composers expanded minor chord usage:
• Chopin: nocturnes in minor keys with emotional depth
• Beethoven: minor key symphonies (Symphony No. 5 in C Minor)
• Movement from minor to major = triumph/resolution (common trope)

CULTURAL ASSOCIATIONS
Different cultures interpret minor differently:
• Western: sadness, melancholy
• Hebrew: expression of mourning
• Greek modal traditions: different affective associations
      ''',
      tips: '''
PRACTICE APPROACH FOR RELATIVE KEY RELATIONSHIPS
1. Play C Major scale, then A Minor scale separately (emphasize A as root)
2. Play C Major chord, then A Minor chord
3. Practice transitions between them (use common tones)
4. Recognize that C Major pieces often borrow A Minor chords

LISTENING FOR MINOR
• Listen to: Beethoven Piano Sonata No. 8 "Pathétique" (A♭ Minor section)
• Listen to: Chopin Nocturne Op. 9 No. 1 (E♭ Major with C Minor passages)
• Notice: emotional shift when minor is introduced

PROGRESSION PRACTICE
The most popular progression in Western music:
• I - vi - IV - V (in C Major = C Major - A Minor - F Major - G Major)
• Practice this progression slowly, listening to chord qualities
• Transpose to other keys (G Major - E Minor - C Major - D Major)

TRANSPOSITION STRATEGY
Once comfortable with A Minor:
• Try E Minor (relative to G Major)
• Then B Minor (relative to D Major)
• Pattern recognition: (minor chord root) is always 3 semitones below major chord root
      ''',
      objectives: [
        'Understand relative minor key relationships',
        'Build and play A Minor chord in root position',
        'Recognize vi chord function in major keys',
        'Compare major and minor chord construction',
        'Apply smooth voice leading between major and relative minor chords',
      ],
      keyPoints: [
        'A Minor is the relative minor of C Major (same notes, different root)',
        'Minor chords differ from major only in the 3rd (minor 3rd = 3 semitones)',
        'The vi chord in C Major is A Minor (built on scale degree 6)',
        'Relative key pairs: C-Am, G-Em, D-Bm, F-Dm, Bb-Gm, Eb-Cm',
        'Composers use relative minor for contrast and emotional variety',
      ],
      reference: 'ABRSM Piano Grade 2-3 | Berklee Harmony Essentials',
    ),
    'inter-04-a-minor-natural-scale': LessonContentDetail(
      lessonId: 'inter-04-a-minor-natural-scale',
      title: 'A Minor Natural Scale',
      description: 'Learn the natural minor (Aeolian mode)',
      theory: '''
THREE TYPES OF MINOR SCALES
1. NATURAL MINOR (Aeolian Mode)
   - All white keys in A: A-B-C-D-E-F-G-A
   - Pattern: W-H-W-W-H-W-W
   - Used in: melodic lines, slow movements

2. HARMONIC MINOR
   - Raises 7th degree: A-B-C-D-E-F-G#-A
   - Creates leading tone (G# resolves to A)
   - Used in: harmonic progressions, authentic cadences (v-i)

3. MELODIC MINOR
   - Raises 6th and 7th ascending: A-B-C-D-E-F#-G#-A
   - Descending: reverts to natural minor
   - Used in: melodic lines, smoother intervallic movement

NATURAL MINOR CHARACTERISTICS
• Same notes as relative major (C Major = A Natural Minor)
• Darker quality than major
• Lacks leading tone (half step below tonic) = less "pull" to resolution
• More somber, introspective character
      ''',
      technique: '''
FINGER PATTERN FOR A NATURAL MINOR SCALE
Right hand ascending:
• Thumb (1) on A
• 2 on B
• 3 on C
• 4 on D
• 5 on E
• 1 on F (thumb under)
• 2 on G
• 3 on A (octave)

DESCENDING PATTERN
• 3 on A
• 2 on G
• 1 on F (thumb over)
• 5 on E
• 4 on D
• 3 on C
• 2 on B
• 1 on A (lower octave)

KEY TECHNICAL POINTS
• Thumb under at F (same as C Major scale)
• Smooth wrist rotation during crossing
• All white keys = easier than scales with accidentals
• Slower wrist motion for natural minor improves control
      ''',
      history: '''
HISTORICAL DEVELOPMENT OF MINOR SCALES
Pre-classical era: Composers experimented with different minor forms
• Josquin des Prez: explored natural minor in vocal music
• Renaissance: distinction between "mollis" (soft) and "duris" (hard) genera

BACH'S STANDARDIZATION
J.S. Bach's Well-Tempered Clavier codified minor scale usage:
• Book 1: C Minor Prelude uses natural minor primarily
• Book 2: Additional exploration of harmonic and melodic variants

CLASSICAL PERIOD
Mozart and Beethoven developed the harmonic minor as standard:
• Natural minor: primarily in slow movements
• Harmonic minor: cadences and dramatic moments
• Melodic minor: scalar passages and melodic development

MODERN MUSIC
• Jazz: natural minor used in modal contexts
• Blues: natural minor (pentatonic variation) foundational
• Folk traditions: natural minor common in many cultures
      ''',
      tips: '''
PRACTICE PROGRESSION FOR A MINOR SCALE
Week 1: Right hand only, slow tempo, focus on thumb crossings
Week 2: Add left hand, opposite fingering, same slow tempo
Week 3: Increase tempo gradually, practice both hands together
Week 4: Play with rhythmic variations (straight, dotted, triplets)

COMPARING THE THREE MINORS
1. Play A Natural Minor slowly
2. Play A Harmonic Minor (add G# at top)
3. Play A Melodic Minor ascending (F# and G# ascending only)
4. Notice emotional differences and intervallic changes

IDENTIFYING NATURAL MINOR
• Listen to: Chopin Prelude Op. 28 No. 2 (E Minor, uses natural minor)
• Listen to: Rachmaninoff Prelude in C# Minor (harmonic minor for contrast)
• Analyze sheet music: identify accidentals (natural minor = no accidentals)

TRANSPOSITION PATHWAY
Once comfortable with A Natural Minor:
• Practice E Natural Minor (relative to G Major)
• Then B Natural Minor (relative to D Major)
• Pattern: each new relative minor is a whole step lower

MISTAKE PREVENTION
Common errors:
1. Adding accidentals unnecessarily (remember: all white keys!)
2. Confusing natural with harmonic minor (G-natural vs G#)
3. Uneven tempo on thumb crossings (practice slowly first)
4. Forgetting which type of minor (listen to identify)
      ''',
      objectives: [
        'Play A Natural Minor scale with proper fingering',
        'Distinguish natural minor from harmonic and melodic minor',
        'Understand Aeolian mode structure and intervallic pattern',
        'Recognize natural minor in musical contexts',
        'Compare emotional qualities of natural vs other minor forms',
      ],
      keyPoints: [
        'Natural Minor = Aeolian mode = all white keys in A minor',
        'Pattern: W-H-W-W-H-W-W (compare to major: W-W-H-W-W-W-H)',
        'Three minor types serve different purposes: natural (melody), harmonic (harmony), melodic (smooth lines)',
        'Natural minor lacks leading tone, so it has less tension than harmonic minor',
        'Relative minor to C Major = A Minor (same notes, different starting point)',
      ],
      reference: 'ABRSM Piano Grade 2-3 | Music Theory Essentials | RCM Harmony',
    ),
    'inter-05-g-major-arpeggio': LessonContentDetail(
      lessonId: 'inter-05-g-major-arpeggio',
      title: 'G Major Arpeggio - Extended',
      description: 'Extended arpeggio patterns across full keyboard',
      theory: '''
ARPEGGIO VS CHORD
Chord: notes played simultaneously
Arpeggio: chord notes played in sequence (broken chord)

HARMONIC BASIS
G Major arpeggio = broken G Major chord (G-B-D)
Pattern: G - D - B - D (Alberti bass)
Or: Root - 5th - 3rd - 5th

EXTENDED ARPEGGIOS
When spanning octaves, maintain harmonic integrity:
• G - D - B - D - G - D - B - D (ascending pattern)
• Add octave doublings: G - B - D - G (for full sonority)
• Each note is harmonically functional within the G Major chord

VOICE LEADING IN ARPEGGIOS
• Notes must belong to the same harmony
• Creates harp-like flowing effect
• Foundation for Romantic era pianistic writing
      ''',
      technique: '''
HAND CROSSING TECHNIQUE
Essential for extended arpeggios:

1. RIGHT HAND STARTS LOW
   - Thumb on G (bottom note)
   - 5 on B
   - 3 on D (upper note initially)
   - 1 ready to cross under

2. CROSSING MOTION
   - Thumb slides under hand to reach higher D
   - Hand rotates smoothly at wrist
   - Elbow slightly out to accommodate crossing
   - No tension or jerky movements

3. ALTERNATING HANDS
   - Left hand takes lower register
   - Right hand takes middle-upper register
   - Smooth handoff between hands
   - Maintain consistent tempo across transition

FINGER FLEXIBILITY
• Curved fingers throughout for agility
• Wrist flexible for arpeggiation
• Rotation from forearm, not tension from fingers
• Rapid finger articulation for smooth passage
      ''',
      history: '''
ARPEGGIO STYLE IN CLASSICAL MUSIC
Alberti Bass (1720s):
• Formalized broken chord accompaniment
• Pattern: Root - 5th - 3rd - 5th (repeated)
• Named after Domenico Alberti
• Found in: Mozart, Beethoven early works

CLASSICAL COMPOSERS
• Mozart Sonata K.545: famous C Major Alberti bass opening
• Beethoven: extended arpeggios in bagatelles
• Clement: virtuosic arpeggio passages

ROMANTIC EXPANSION
19th century: arpeggios became virtuosic showpieces:
• Liszt: extended hand-crossing passages
• Chopin: arpeggiated accompaniments in nocturnes
• Brahms: complex polyphonic arpeggios

MODERN CONTEXT
• Jazz: arpeggio improvisations
• Contemporary: extended techniques
• Teaching: fundamental to pianistic control
      ''',
      tips: '''
PROGRESSION FOR EXTENDED ARPEGGIOS
1. Single hand (right) slow tempo, all fingers curved
2. Add left hand at octave below, maintain alignment
3. Increase tempo gradually
4. Add hand crossing slowly, then accelerate
5. Practice transitions between different harmonies

PRACTICE STRATEGY
• Break into small segments (one octave at a time)
• Practice hand crossing separately
• Use slow-motion practice: deliberately slow hand movement
• Record yourself to check for unevenness

COMMON ISSUES
1. Tension during crossing: relax before the crossing motion
2. Uneven tempo: practice with metronome
3. Fingers not curved: mirror hand position with other hand
4. Loss of alignment between hands: mark resting points

MUSICAL APPLICATION
• Listen to: Chopin Nocturne Op. 9 No. 1 (extended right-hand arpeggios)
• Listen to: Liszt "La Campanella" (virtuosic hand-crossing arpeggio)
• Analyze: find Alberti bass patterns in classical sonatas
      ''',
      objectives: [
        'Execute extended G Major arpeggios smoothly across octaves',
        'Develop hand crossing technique with control',
        'Understand harmonic basis of broken chord accompaniments',
        'Apply arpeggio patterns to melodic contexts',
        'Build finger agility and wrist flexibility',
      ],
      keyPoints: [
        'Extended arpeggios maintain chord integrity across multiple octaves',
        'Alberti bass pattern (Root-5th-3rd-5th) is Classical-era foundation',
        'Hand crossing requires smooth wrist rotation and proper elbow positioning',
        'Arpeggio style evolved from Classical to Romantic virtuosity',
        'Consistent tempo and curved fingers essential for fluidity',
      ],
      reference: 'ABRSM Piano Grade 3-4 | Czerny Studies for Technical Development',
    ),
    'inter-06-major-and-minor-thirds': LessonContentDetail(
      lessonId: 'inter-06-major-and-minor-thirds',
      title: 'Intervals: Major & Minor Thirds',
      description: 'Master interval quality and recognition',
      theory: '''
INTERVAL BASICS
Intervals measured by:
1. Distance: number of letter names (2nd, 3rd, 4th, etc.)
2. Quality: major, minor, perfect, diminished, augmented

MAJOR THIRD
• Size: 4 semitones (2 whole steps)
• Examples: C to E, G to B, F to A
• Sound: bright, open, consonant
• In scale: from root to major 3rd scale degree

MINOR THIRD
• Size: 3 semitones (1.5 whole steps)
• Examples: C to Eb, G to Bb, F to Ab
• Sound: dark, introspective, still consonant
• In scale: from root to flatted 3rd

CHORD QUALITY DIFFERENCE
C Major = C (root) + E (major 3rd, +4 semitones) + G (perfect 5th)
C Minor = C (root) + Eb (minor 3rd, +3 semitones) + G (perfect 5th)

Only the 3rd changes—entire chord quality transformed!

INTERVAL ARITHMETIC
All thirds derive from two templates:
• Major 3rd = perfect 4th below = 4 semitones
• Minor 3rd = tritone away = 3 semitones
• Augmented 3rd = 5 semitones (enharmonic to perfect 4th)
      ''',
      technique: '''
RECOGNIZING INTERVALS BY SIGHT
1. Count letter names (including start note)
   - C to E = C(1) D(2) E(3) = a 3rd

2. Count semitones from lower note
   - Major 3rd = 4 semitones
   - Minor 3rd = 3 semitones

PLAYING INTERVALS ON PIANO
Major 3rd:
• Thumb on C, finger 3 on E
• Two white keys with one key between (C-D-E)

Minor 3rd:
• Thumb on C, finger 3 on Eb
• White key to black key (or white-white-white with flat)

LISTENING FOR QUALITY
Major 3rd: play C-E, then C Major chord—the 3rd establishes major quality
Minor 3rd: play C-Eb, then C Minor chord—the 3rd establishes minor quality

FINGER PLACEMENT EXERCISES
• Play all major 3rds on white keys: C-E, D-F#, E-G#, F-A, G-B, A-C#, B-D#
• Play all minor 3rds: C-Eb, D-F, E-G, F-Ab, G-Bb, A-C, B-D
      ''',
      history: '''
INTERVAL CLASSIFICATION IN MUSIC THEORY
Medieval to Renaissance: Perfect intervals (unison, 4th, 5th, octave) were consonant
• Major and minor 3rds considered dissonant!

15th Century Shift (Fauxbourdon):
• Musicians began treating 3rds and 6ths as consonant
• Enabled richer harmonies and tertian (third-based) harmony

TERTIAN HARMONY FOUNDATION
Development of major and minor chords from 3rds:
• 16th century: consolidation of three-note chords
• Major and minor triads became fundamental harmonic units
• All subsequent harmony built on this framework

BAROQUE & CLASSICAL PERIODS
• Figured bass notation: composers labeled intervals
• Study of intervals: essential harmonic theory
• Major and minor 3rds: basis of all chord quality distinction

MODERN MUSIC
• Jazz: extended intervals and alterations (9ths, 11ths, 13ths)
• Blues: microtonal inflections of major 3rds
• Composition: interval quality determines harmonic color
      ''',
      tips: '''
LISTENING FOR INTERVAL QUALITY
Songs with major 3rds opening:
• "Twinkle Twinkle Little Star" (C up to E)
• "When the Saints Go Marching In" (starts on major 3rd)

Songs with minor 3rds:
• "Greensleeves" (starts E down to C# = minor 3rd inverted)
• "Summertime" (opening interval is minor 3rd)

SINGING INTERVALS
1. Sing C-E to internalize major 3rd quality
2. Sing C-Eb to internalize minor 3rd quality
3. Alternate between them
4. Sing the intervals in different octaves

BUILDING CHORD RECOGNITION
Once comfortable with major and minor 3rds:
1. Play C Major: hear how major 3rd defines quality
2. Play C Minor: hear how minor 3rd defines quality
3. Play C Major 7: add the major 3rd on top
4. Play C Minor 7: add the minor 3rd on top

TRANSPOSITION PRACTICE
Identify the 3rd in any major key:
• G Major: G up to B (major 3rd = major chord)
• D Major: D up to F# (major 3rd = major chord)
• A Major: A up to C# (major 3rd = major chord)

For minor chords:
• G Minor: G up to Bb (minor 3rd)
• D Minor: D up to F (minor 3rd)
• A Minor: A up to C (minor 3rd)
      ''',
      objectives: [
        'Identify major and minor 3rds by sight and sound',
        'Understand how the 3rd determines chord quality',
        'Build interval recognition across keyboard',
        'Apply interval knowledge to chord construction',
        'Hear interval quality in musical context',
      ],
      keyPoints: [
        'Major 3rd = 4 semitones (C to E); Minor 3rd = 3 semitones (C to Eb)',
        'The 3rd is the only note difference between major and minor chords',
        'Major 3rd sound: bright and stable; Minor 3rd sound: dark and introspective',
        'Tertian harmony (chord building on thirds) is the foundation of Western harmony',
        'Interval quality determines harmonic color and emotional effect',
      ],
      reference: 'ABRSM Music Theory Grade 3-4 | Berklee Harmony Essentials',
    ),
    'inter-07-compound-meter': LessonContentDetail(
      lessonId: 'inter-07-compound-meter',
      title: 'Compound Meter (6/8, 9/8, 12/8)',
      description: 'Understand triple subdivisions',
      theory: '''
SIMPLE VS COMPOUND METER
Simple Meter:
• Beat unit divides by 2
• Examples: 2/4 (beats divide in half), 3/4, 4/4
• Time signature numerator = number of beats

Compound Meter:
• Beat unit divides by 3
• Examples: 6/8 (beats divide in thirds), 9/8, 12/8
• Time signature: numerator relates to subdivisions, not beats
• Denominator indicates subdividing note value

6/8 TIME EXPLANATION
Literal: 6 eighth notes per measure
Musical feeling: 2 beats (each worth 3 eighth notes)
• Measure contains: dotted quarter (♩.) = 3 eighths
• Two dotted quarters per measure

Counting:
• Mechanical: 1-2-3-4-5-6 (emphasize 1 and 4)
• Musical: ONE-and-a TWO-and-a (emphasize ONE and TWO)

9/8 TIME
• 9 eighth notes per measure
• Musical feel: 3 beats (each worth 3 eighths)
• Like 3/4, but with triple subdivision

12/8 TIME
• 12 eighth notes per measure
• Musical feel: 4 beats (each worth 3 eighths)
• Like 4/4, but with triple subdivision
      ''',
      technique: '''
CONDUCTING COMPOUND METERS
6/8 Conducting Pattern:
• Beat 1: Down (starting on beat 1)
• Beat 2: Up (on beat 4 of the measure)
• Two main beats, with three subdivisions each

9/8 Conducting Pattern:
• Beat 1: Down
• Beat 2: Out (to the right)
• Beat 3: Up
• Three main beats, each with subdivisions

12/8 Conducting Pattern:
• Beat 1: Down
• Beat 2: Right
• Beat 3: Left
• Beat 4: Up
• Four main beats

FEELING THE PULSE
In compound meter:
• Main beats are longer (dotted note values)
• Practice tapping the dotted quarter beat
• Listen for the lilt and swing of triple subdivision

PLAYING IN COMPOUND METER
• Maintain consistent tempo of the main beat (dotted quarter)
• Allow eighths to flow naturally under that beat
• Avoid rushing the sixteenth notes or subdivisions
      ''',
      history: '''
ORIGINS OF COMPOUND METER
Medieval Music: triple meter considered "perfect" (divine)
• Baroque composers used compound meter frequently
• Minuet and Trio forms often in compound meter

BAROQUE PERIOD
J.S. Bach:
• Gigue movements typically 6/8 or 12/8
• Creates flowing, dance-like character
• Found in: suites, partitas, dance movements

CLASSICAL & ROMANTIC
• Mozart: 6/8 in fast movements, pastoral movements
• Chopin: 6/8 in various mazurkas and nocturnes
• Brahms: 6/8 frequently in symphonic movements

MODERN USAGE
• Folk music: 6/8 extremely common (jigs, reels, hornpipes)
• Jazz: swing feel relates to compound subdivision
• Contemporary: metric flexibility and shifting meters
      ''',
      tips: '''
PRACTICE APPROACH FOR 6/8
1. Tap two steady beats (ONE and TWO)
2. Count subdivisions under those beats (1-2-3, 1-2-3)
3. Clap rhythm patterns while counting
4. Play pieces slowly, emphasizing the two main beats
5. Gradually internalize the dotted-quarter pulse

LISTENING FOR COMPOUND METER
6/8 Examples:
• Beethoven "Pastoral" Symphony, 2nd movement
• Traditional folk jigs and reels
• Fauré "Pavane" (certain sections)
• Brahms Hungarian Dance No. 5 (sections)

COMMON MISCONCEPTIONS
1. 6/8 is not fast duple meter—feel it as 2 slow beats
2. Eighth notes don't get the beat—the dotted quarter does
3. Don't subdivide constantly—feel the main beat

TRANSPOSITION & ANALYSIS
In sheet music:
• 6/8 is felt as two beats, not six
• Emphasis falls on beats 1 and 4
• This affects phrasing and breath points
• Play 3/4 piece, then same melody in 6/8—hear difference

CONDUCTING WHILE LISTENING
1. Listen to 6/8 piece (e.g., Baroque gigue)
2. Conduct the two-beat pattern
3. Feel the triple subdivisions beneath
4. Notice how this creates lilting, flowing effect
      ''',
      objectives: [
        'Understand compound meter structure and mathematical basis',
        'Distinguish between simple and compound meter by sound',
        'Conduct and feel 6/8, 9/8, and 12/8 correctly',
        'Play pieces in compound meter with proper pulse',
        'Recognize compound meter in score and by ear',
      ],
      keyPoints: [
        '6/8 = 2 beats of 3 eighths each; 9/8 = 3 beats; 12/8 = 4 beats',
        'Compound meter beat unit is a dotted note (not a regular beat)',
        'Feel the main beats, not the individual eighth notes',
        'Lilting, flowing quality comes from triple subdivision',
        'Baroque composers favored compound meter for dance and movement',
      ],
      reference: 'ABRSM Music Theory Grade 3-4 | Carse & Forsyth "The Orchestra"',
    ),
    'adv-01-dominant-seventh': LessonContentDetail(
      lessonId: 'adv-01-dominant-seventh',
      title: 'Dominant Seventh Chord (V7)',
      description: 'Master the most common secondary dominant function',
      theory: '''
THE DOMINANT SEVENTH FUNCTION
The V7 chord is built on the 5th scale degree with an added minor 7th:
In C Major:
• V chord (G Major): G-B-D (stable dominant)
• V7 chord: G-B-D-F (tense, must resolve)

THE TRITONE INTERVAL
V7 contains the most important interval in harmony:
• B to F (or F to B) = tritone (augmented 4th/diminished 5th)
• Interval size: 6 semitones (diabolus in musica—"devil in music")
• Most dissonant interval in Western harmony
• Creates tension demanding resolution

RESOLUTION OF V7
• B (leading tone) resolves up 1 semitone to C
• F (minor 7th) resolves down 1 semitone to E
• This resolution creates the strongest cadence: V7-I

HISTORICAL IMPORTANCE
Functional harmony (music after 1650) depends on V-I:
• Defines key areas
• Articulates form and structure
• Creates dramatic tension and release

SECONDARY DOMINANTS
V7 can precede any major or minor chord:
• V7/ii: A7 (in C Major) → D minor
• V7/iii: B7 → E minor
• V7/IV: C7 → F Major
Creates chromatic alteration while maintaining function
      ''',
      technique: '''
PLAYING V7 IN C MAJOR (G7)
Notes: G-B-D-F
Fingering (right hand):
• Thumb on G
• 2 on B
• 3 on D
• 5 on F
All four notes pressed simultaneously

VOICE LEADING INTO V7
• Approach from previous chord smoothly
• Keep common tones between chords
• Voice the 7th (F) in inner voices when possible
• Leading tone (B) should resolve upward

RESOLVING V7 TO I (G7 → C)
• B must resolve to C (up)
• F must resolve to E (down)
• Other voices can remain stationary
• This creates the proper voice leading for authentic cadence

PLAYING V7 IN ALL KEYS
After mastering G7 in C Major:
• D7 in G Major (D-F#-A-C)
• A7 in E Major (A-C#-E-G)
• E7 in B Major (E-G#-B-D)
• Pattern remains same—transpose to new key
      ''',
      history: '''
ORIGINS OF FUNCTIONAL HARMONY (1600-1650)
Renaissance to Baroque transition:
• Monteverdi: early use of V chord for harmonic function
• Gradual standardization of V-I as primary cadence
• Replaced older modal and organum traditions

BAROQUE CONSOLIDATION (1650-1750)
J.S. Bach systematized V7 function:
• Every major tonal work uses V7-I
• Figured bass notation: clarifies V7 function
• Example: Well-Tempered Clavier uses V7 extensively

CLASSICAL DEVELOPMENT (1750-1820)
Mozart and Beethoven refined V7:
• More sophisticated secondary dominants
• Complex voice leading in symphonic contexts
• V7 became fundamental building block

ROMANTIC EXPANSION (1820-1920)
Composers extended V7 function:
• More secondary dominants
• Chromatic voice leading
• Extended/altered seventh chords
      ''',
      tips: '''
RECOGNIZING V7 IN SHEET MUSIC
• Look for G7 chord symbol in key of C Major
• Or Roman numeral: V7
• Or figured bass: 7 (with G in bass)
• Note: will often include accidental (B and F written naturally)

LISTENING FOR V7
Classical composers:
• Beethoven Sonata No. 8 "Pathétique" (V7 cadences throughout)
• Mozart Symphony No. 40 in G Minor (V7 in minor keys)
• Haydn: V7 creates dramatic tension in developments

JAZZ CONTEXT
V7 is fundamental to jazz:
• Dominant-tonic movement: G7 → CMaj7
• Repeated secondary dominants: D7-G7-CMaj7
• Essential to bebop harmony

PRACTICE PROGRESSION
Week 1: Play G7 slowly in all inversions
Week 2: Practice G7 → C resolution (authentic cadence)
Week 3: Add secondary dominants (V7/ii, V7/IV)
Week 4: Transpose V7 to all major keys

IMPROVISATION TIP
In any major key:
1. Build V7 chord on the 5th scale degree
2. Play it, then resolve to tonic
3. Repeat in different inversions
4. Use as harmonic anchor for improvisation
      ''',
      objectives: [
        'Construct dominant seventh chords in all major keys',
        'Understand the tritone and its resolution',
        'Play authentic cadences (V7-I) with correct voice leading',
        'Recognize secondary dominants (V7/ii, V7/IV, etc.)',
        'Apply V7 function in harmonic progressions and analysis',
      ],
      keyPoints: [
        'V7 = V triad + minor 7th = strongest tension in Western harmony',
        'Tritone (B-F in C Major) requires resolution (B→C, F→E)',
        'Authentic cadence (V7-I) defines key and articulates form',
        'Secondary dominants allow chromatic alterations within diatonic context',
        'V7 is foundation of jazz, blues, and all functional harmony',
      ],
      reference: 'ABRSM Music Theory Grade 5-6 | Berklee Harmony II',
    ),
    'adv-02-major-seventh-chord': LessonContentDetail(
      lessonId: 'adv-02-major-seventh-chord',
      title: 'Major Seventh Chord (Maj7)',
      description: 'Create sophisticated jazz and classical harmonies',
      theory: '''
MAJOR SEVENTH CHORD CONSTRUCTION
Maj7 = Major Triad + Major 7th (half step below octave)

In C Major:
• C Major chord: C-E-G
• CMaj7 chord: C-E-G-B
• Major 7th = 11 semitones from root
• Difference from dominant 7th: B natural (not Bb)

THE MAJOR 7TH INTERVAL
• Major 7th = very consonant (unlike tritone in V7)
• Creates floating, open, sophisticated sound
• Contrast: V7 creates tension; Maj7 creates release

VOICE LEADING IN MAJ7
B in CMaj7 sits just below the C octave:
• Creates a "bell-like" or "floating" quality
• Suggests resolution upward (to next octave C)
• No tension like V7
• Smooth transitions to other chords

HARMONIC FUNCTION
CMaj7 = I chord with extension
• More sophisticated than I
• Suggests resolution but not urgently
• Creates ambiguous harmonic effect
• Modern, contemporary sound
      ''',
      technique: '''
PLAYING CMAJ7
Notes: C-E-G-B
Fingering options:
• Closed position: C(thumb)-E(2)-G(3)-B(5)
• Open position: C(1)-E(2)-G(3)-B(5) in wider voicing
• Both create the major 7th quality

VOICING PREFERENCES
Close voicing (compact):
• Tighter, more cohesive sound
• Traditional approach

Open voicing (spread):
• Creates more space and resonance
• Jazz preference for lighter sound
• B sits in higher register

TRANSITION INTO AND OUT OF MAJ7
• From I to IMaj7: simple addition
• From IMaj7 to IV: smooth (G is common tone)
• From IMaj7 to vi: smooth (E is common tone)
• Always seek common tones for voice leading

CMAJ7 IN ALL INVERSIONS
• Root position: C-E-G-B
• First inversion: E-G-B-C (upper structure triad over E)
• Second inversion: G-B-C-E (creates suspended sound)
• Third inversion: B-C-E-G (maj7 in bass—unusual)
      ''',
      history: '''
ORIGINS IN IMPRESSIONISM
Debussy and Ravel pioneered maj7 harmonies:
• Debussy "Prelude à l'après-midi d'un faune": maj7 chords for floating quality
• Escape from functional harmony toward color and timbre
• Maj7 = harmonic innovation of late 19th century

JAZZ INTEGRATION (1920s-1940s)
Jazz composers adopted maj7 systematically:
• George Gershwin: "I Got Rhythm" changes with maj7
• Duke Ellington: sophisticated maj7 voicings
• Create jazzy but sophisticated sound

BEBOP AND BEYOND (1940s-present)
• Major 7th became standard jazz harmony
• Extended chords (9th, 11th, 13th) build on maj7 foundation
• Contemporary jazz almost exclusively uses maj7

MODERN CLASSICAL MUSIC
• John Williams: maj7 chords for expansive, romantic moments
• Film music: maj7 creates emotional openness
• Contemporary concert music: atmospheric effects
      ''',
      tips: '''
IDENTIFYING MAJ7 CHORDS
Sheet music:
• "Cmaj7" or "CM7" chord symbol
• Roman numeral: IMaj7 or I7 (in figured bass)
• Notes: major triad + major 7th (B natural in C Major)

LISTENING FOR MAJ7
Jazz standards:
• "Autumn Leaves": opens with IMaj7
• "All The Things You Are": sophisticated maj7 progressions
• "Take Five": maj7 creates modern sophisticated sound

Classical/Film music:
• Debussy "Clair de Lune": impressionistic maj7 usage
• John Williams "Theme from Schindler's List": maj7 for emotional depth
• Modern orchestral: maj7 for floating, open effect

TRANSPOSITION PRACTICE
Build maj7 chords in all major keys:
• CMaj7, GMaj7, DMaj7, AMaj7, EMaj7, BMaj7
• FMaj7, BbMaj7, EbMaj7, AbMaj7, DbMaj7, GbMaj7
• Each maj7 follows same construction pattern

VOICE LEADING EXERCISE
1. Play IMaj7 chord (C-E-G-B)
2. Resolve to IV chord (F Major): smooth drop of B to A
3. Or resolve to vi chord (A Minor): E and B move down
4. Or resolve to ii chord (D Minor): G and B move down
5. Notice how maj7 allows smooth transitions
      ''',
      objectives: [
        'Construct major seventh chords in all keys',
        'Understand major 7th interval and its sound quality',
        'Voice maj7 chords in close and open positions',
        'Apply maj7 in jazz progressions',
        'Recognize maj7 in classical and contemporary music',
      ],
      keyPoints: [
        'Maj7 = Major Triad + Major 7th (not minor 7th)',
        'Creates floating, sophisticated, modern sound',
        'Opposite of V7 (releases tension rather than creating it)',
        'Foundation of jazz harmony and extended chords',
        'Maj7 allows smooth voice leading due to consonant interval quality',
      ],
      reference: 'ABRSM Music Theory Grade 5-6 | Berklee Jazz Harmony',
    ),
  };

  static LessonContentDetail? getContent(String lessonId) {
    return _contents[lessonId];
  }

  static List<LessonContentDetail> getAllContents() {
    return _contents.values.toList();
  }
}
