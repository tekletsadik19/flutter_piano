# Practice Tools

## Overview

Practice tools transform the piano from a free-play instrument into a guided learning environment. They are used during the "Guided Practice" step of every lesson.

---

## Wait Mode

**The most important beginner practice feature.**

When Wait Mode is on, the app pauses playback of the backing track and notation scroll until the user plays the correct note. Time pressure is removed entirely.

- Default state: **ON** for all beginner and intermediate lessons
- Can be toggled off by the user for a real-time performance feel
- If the user plays a wrong note, the correct key is highlighted more prominently
- Prevents the common frustration of "the song just kept going and I got lost"

**Implementation:** The guided piano listens for input and only advances the note cursor when the expected MIDI note is received.

---

## Tempo Control

Allows the user to slow down the piece to 50%, 75%, or a custom percentage of full speed.

- Displayed as a slider or segmented control: 50% / 75% / 100%
- Affects both audio playback speed and the scroll speed of the notation
- Combined with Wait Mode: slow tempo + wait mode = maximum beginner accessibility
- Recommended starting point for new pieces: 60% tempo

---

## Hand Isolation

Allows the user to practice one hand at a time before combining both.

- **Right hand only** — left hand part is muted and not required
- **Left hand only** — right hand part is muted and not required
- **Both hands** — full piece, both hands required

The standard teaching sequence:
1. Right hand alone until comfortable
2. Left hand alone until comfortable
3. Both hands together slowly
4. Both hands at full tempo

---

## Section Looping

Allows the user to mark a difficult passage and repeat it in isolation.

- Tap a start point and end point on the notation bar
- The selected section loops continuously
- User can narrow or widen the loop region
- Great for isolating a single bar or phrase that keeps going wrong

---

## Metronome

A built-in click track for timing practice.

- BPM control (adjustable)
- Visual beat indicator (pulsing dot or animated bar)
- Subdivision options: quarter note, eighth note, triplet
- Can be used in free play piano mode as well as guided practice

---

## Key Highlighting

Visual guide on the piano keyboard showing which key to press.

- **Next note** — highlighted in the user's primary color (deep pink)
- **Left hand notes** — blue highlight
- **Right hand notes** — red/orange highlight
- **Correct note played** — brief green flash
- **Wrong note played** — brief red flash
- Finger number overlays (1–5) shown for beginner lessons, fade out at intermediate level

---

## Real-Time Feedback States

Each note the user plays is evaluated and shown in one of three states:

| State | Color | Meaning |
|---|---|---|
| Correct | Green | Right note, right timing |
| Wrong note | Red | Incorrect pitch |
| Wrong timing | Pink/Yellow | Correct note, but too early or too late |

Timing deviation threshold: ±150ms is considered "on time" for beginners, tightened to ±80ms for intermediate and ±40ms for advanced.

---

## Input Methods

### Microphone
- Device listens via mic and detects pitches from any acoustic or digital piano
- Requires a brief calibration on first use (set noise floor)
- Latency: ~50–200ms (compensated algorithmically)
- Best for users without a MIDI cable

### MIDI (already implemented)
- Direct MIDI connection via USB or Bluetooth
- Zero latency, 100% accurate note detection
- Captures velocity (how hard the key is pressed) for dynamics feedback
- Recommended for serious learners

---

## Practice Session Summary

At the end of each practice session the app shows:
- Notes played: correct / wrong / timing errors (counts)
- Accuracy % for the session
- Time spent practicing
- Star rating earned (1–3)
- Option to retry or move to next lesson
