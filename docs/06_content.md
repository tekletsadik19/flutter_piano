# Content Types

## Overview

Ruth delivers learning through five content types. Each serves a different purpose in the learning journey.

---

## 1. Video Lessons

Short, focused explainer videos attached to lessons that require physical demonstration.

### What they cover
- Hand posture and wrist position
- Pedaling technique
- How to hold fingers (curved, not flat)
- Dynamics — playing softly vs. loudly
- Practice techniques (slow practice, hands separate)

### Format
- Duration: 1–5 minutes per video
- Camera angles:
  - **Bird's eye** — looking down at the keyboard showing both hands (primary)
  - **Front-facing** — shows the teacher's face and upper body
  - **Close-up** — tight shot of finger placement for specific techniques
- Hosted externally (YouTube/Vimeo) or bundled as assets for offline use

### Integration
- Video plays first in the lesson (concept introduction step)
- "Start Practice" button appears after video finishes
- User can re-watch at any time from the lesson detail screen

---

## 2. Interactive Sheet Music

The primary practice medium. Music notation that scrolls horizontally as the user plays.

### Features
- Notes highlight in the user's primary color as they are played
- Upcoming notes glow in a preview color (split-second advance warning)
- Color-coded by hand: left hand = blue, right hand = red
- Fingering numbers (1–5) overlaid on notes for beginner levels
- Scrolls at the lesson tempo; pauses during Wait Mode
- Zoom control to increase note size on small screens

### Notation Rendering
- MusicXML or ABC notation format as source data
- Rendered to canvas in Flutter (custom painter or a notation library)
- Each note has metadata: pitch, duration, hand, finger number, timing position

---

## 3. Falling Notes (Synthesia-style)

An alternative visualization for beginners who are not yet reading notation.

### How it works
- Colored bars fall from the top of the screen toward the piano keyboard below
- Left hand bars: blue, Right hand bars: red
- Bar length represents note duration
- The user plays each bar as it reaches the keyboard

### When to use
- Onboarding (first 5–10 lessons) before introducing sheet music
- Song mode for users on the Chords Path who prefer it
- Toggle: user can switch between falling notes and sheet music at any time

### Limitation
- Teaches "what key and when" but not how to read music
- Recommended to transition users to sheet music view after beginner tier

---

## 4. Chord Charts

Used in the Chords Path for pop/accompaniment learners.

### Format
- **Lead sheet style** — chord name above a lyric line (e.g., `C    G    Am    F`)
- **Chord diagram** — shows the hand position on the keyboard for each chord
- Chord name, voicing (root position / inversion), and audio example

### Chord Library
- Searchable by chord name
- Filters: major, minor, dominant 7th, major 7th, minor 7th, sus, diminished
- Each entry shows:
  - Chord spelling (e.g., C major = C E G)
  - Keyboard diagram highlighting the keys
  - All inversions
  - Audio playback button

### Integration in Lessons
- Chord lessons use the chart as the concept introduction
- Practice step opens the piano with the chord keys highlighted
- User plays the chord and the app confirms all notes are correct simultaneously

---

## 5. Theory Mini-Lessons

Short theory explanations embedded directly inside lessons, not as standalone modules.

### Topics covered (in context)
- What is a key signature (taught when a song first uses one)
- What is a time signature (taught at the first 3/4 song)
- Intervals (taught when practicing scales)
- Why the I–IV–V–I progression sounds resolved (taught in chord lessons)
- What a sharp/flat does (taught at first black key lesson)

### Format
- 1–3 screen cards per theory concept
- Simple illustration + 1-paragraph explanation
- Optional: short interactive quiz (e.g., "Which note is this?" with 3 options)
- Dismissible — user can skip if they already know the concept

---

## 6. Exercises

Standalone drills not attached to a specific song.

### Types

| Exercise | Description | Level |
|---|---|---|
| Five-finger patterns | C-D-E-F-G and back, one hand | Beginner |
| Major scales | All 12 keys, hands separate then together | Intermediate |
| Minor scales | Natural, harmonic, melodic | Intermediate |
| Arpeggios | Root position, all inversions, all keys | Intermediate |
| Hanon exercises | Finger independence drills 1–20 | Advanced |
| Chord progressions | I–IV–V–I in all 12 keys | Intermediate |
| Interval drills | Playing major/minor thirds, sixths across keyboard | Advanced |

### Structure
- Each exercise has a slow reference demo
- Tempo control available (start slow, build speed)
- The app listens and marks each note correct/incorrect
- Completion unlocks the next exercise in the sequence
