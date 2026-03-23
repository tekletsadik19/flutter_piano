# Piano Keyboard UI

## Overview

The piano keyboard is the central interactive element of Ruth. It serves two modes:
1. **Free Play** — full keyboard, no guidance, user plays freely
2. **Guided Practice** — keyboard responds to lesson exercises with highlighting, feedback, and input detection

---

## Key Layout

### Dimensions
- Default key width: 80px (adjustable in settings, range 40–120px)
- White keys: full height of the keyboard area
- Black keys: 60% height, 60% width of a white key
- The keyboard scrolls horizontally — user can swipe to change octave range

### Octave Range
- Default: 7 octaves (full piano range)
- On screen at one time: 2–3 octaves depending on device width
- Octave offset control: +/- buttons in the AppBar (already implemented)
- In guided practice: the view auto-scrolls to center on the active playing region

---

## Key Highlighting States

| State | Color | Trigger |
|---|---|---|
| Next note (right hand) | Primary color (deep pink) | Upcoming note in the exercise |
| Next note (left hand) | Blue | Upcoming note in the exercise |
| Correct — played | Green flash | User played the correct note |
| Wrong — played | Red flash | User played the wrong note |
| Timing error | Yellow flash | Correct note, wrong timing |
| Sustained | Soft glow of primary color | Note held down (sustain active) |
| Idle | White / black (standard) | No activity |

---

## Labels on Keys

### Beginner Mode
- Note name (C, D, E, F, G, A, B) shown on white keys
- Octave number shown on C keys (C3, C4, C5)
- Finger numbers (1–5) shown during guided practice when fingering data is available

### Intermediate / Advanced Mode
- Labels fade out — clean keyboard, no text
- Toggle in settings to re-enable labels at any time

---

## Split Keyboard Mode

On larger screens (height > 600px), the keyboard can be split into two identical rows:
- Top row and bottom row show the same range
- Allows two-hand touch play on a tablet lying flat
- Toggle button in AppBar (already implemented)

---

## Inverted Keys Mode

A settings option to invert black and white key colors:
- Black keys become white, white keys become dark
- Useful for certain visual preferences or accessibility needs
- Already implemented in settings

---

## Piano in Free Play Mode

The existing `Piano` screen (`lib/presentation/view/piano.dart`):
- Full keyboard, no restrictions
- Keyboard shortcut mapping (A–L keys = notes)
- Sustain toggle
- Octave offset
- Split keyboard
- Settings (color theme, key width, labels, etc.)

---

## Piano in Guided Practice Mode

Extended version of the free play piano with practice overlay:

### Additional UI Elements
- **Notation bar** at the top — scrolling sheet music or falling notes
- **Practice toolbar** — Wait Mode toggle, tempo slider, hand isolation selector, loop markers
- **Feedback overlay** — accuracy counter, current note indicator
- **Progress bar** — shows position through the exercise/song

### Input Flow
1. App renders the next expected note(s) on the keyboard (highlighted)
2. User plays a key
3. If Wait Mode ON: app checks the note — advance if correct, flash red if wrong
4. If Wait Mode OFF: app records correct/incorrect and advances with the tempo
5. At end of exercise: show session summary (accuracy %, stars, XP earned)

---

## Keyboard Accessibility

- Minimum key width enforced at 40px to remain tappable on small screens
- High contrast mode respects system accessibility settings
- VoiceOver / TalkBack: keys labeled with note name for screen reader users (stretch goal)
