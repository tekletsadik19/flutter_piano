# Lessons System

## Overview

The lessons system is the core learning engine of Ruth. It guides users from complete beginner to advanced through a structured curriculum of concepts, exercises, and songs.

## Curriculum Structure

### Three Tiers

#### Beginner (0–6 months)
- Keyboard layout — naming all 88 keys
- Posture and hand position
- Finding middle C
- One-hand five-finger patterns (C position)
- Basic note values: quarter, half, whole
- Reading the treble clef (right hand)
- Reading the bass clef (left hand)
- Simple 4/4 time signature
- First songs: right hand only, simple melodies (Ode to Joy, Twinkle Twinkle)

#### Intermediate (6 months – 2 years)
- Grand staff reading (treble + bass clef together)
- Hands together — simple coordination
- All 12 major scales (hands separate, then together)
- Basic minor scales
- Chords: major and minor triads
- Chord inversions (root, 1st, 2nd)
- I–IV–V–I progressions in multiple keys
- 3/4 time signature (waltz feel)
- Simple syncopation
- Ledger lines
- Sight-reading simple pieces

#### Advanced (2+ years)
- All major and minor scales (harmonic, melodic)
- Circle of fifths in practice
- Arpeggios in all keys
- Hanon / Czerny finger independence drills
- Complex syncopation and cross-rhythms
- Parallel thirds and sixths
- Jazz chord voicings
- Full performance repertoire
- Advanced sight-reading

---

## Learning Paths (Goal Fork)

At onboarding, the user selects a goal:

### Soloist Path
- Focus: classical technique, notation reading, finger exercises
- Emphasis: reading sheet music fluently, two-hand independence, formal technique
- Songs: classical repertoire (Bach, Beethoven, Mozart simplified → full)

### Chords Path
- Focus: pop/rock/jazz accompaniment, chord shapes, playing by ear
- Emphasis: chord progressions, lead sheets, strumming patterns for singer-pianists
- Songs: popular songs, chord-based arrangements

Both paths share the same foundational modules (keyboard layout, posture, basic note values) before diverging.

---

## Individual Lesson Structure

Every lesson follows this 5-step flow:

1. **Concept Introduction** — Short explanation (text + illustration or short video, 30–90 seconds). Explains the "why" behind the concept.
2. **Demonstration** — Listen to the target piece or exercise at full speed. The user hears what they are working toward.
3. **Guided Practice** — The piano opens in practice mode. The app listens and provides real-time feedback. Wait Mode is on by default.
4. **Completion Score** — 1–3 stars based on accuracy and timing. Shown at end of lesson.
5. **Mastery Replay** — Optional: replay the lesson to improve the star rating before moving on.

---

## Arrangement Laddering

Every song is offered at multiple difficulty tiers:
- **Simplified** — right hand only, reduced notes, slow tempo (beginner)
- **Standard** — both hands, full melody, moderate tempo (intermediate)
- **Full** — complete published arrangement with dynamics (advanced)

Users unlock higher tiers as they progress. The target of playing the "real" version motivates continued practice.

---

## Placement Test

On first launch, a short assessment determines starting level:
- 5–8 short exercises
- Tests note recognition, basic rhythm, and hand coordination
- Result places the user at the correct curriculum entry point
- Can be skipped (defaults to complete beginner)

---

## Data Model (planned)

```dart
class Lesson {
  final String id;
  final String title;
  final String description;
  final LessonLevel level;       // beginner, intermediate, advanced
  final LessonPath path;         // soloist, chords, both
  final List<LessonStep> steps;
  final String? videoUrl;
  final MidiExercise? exercise;
  final int starRating;          // 0–3, persisted locally
  final bool completed;
}

enum LessonLevel { beginner, intermediate, advanced }
enum LessonPath { soloist, chords, both }
```
