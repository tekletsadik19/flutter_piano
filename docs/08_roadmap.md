# Development Roadmap

## Phase 1 — Foundation (Current)
_The piano and home screen. Already built._

- [x] Interactive MIDI piano keyboard
- [x] Free play mode with octave control, sustain, split keyboard
- [x] Settings (theme color, key width, key labels, invert keys)
- [x] Keyboard shortcut support (desktop)
- [x] Home screen with "Open Piano" card
- [x] Deep pink primary color
- [x] Outfit font
- [x] Multi-language support (l10n)

---

## Phase 2 — Learning Structure
_Add the skeleton of the learning system._

- [ ] Lessons list screen (Beginner / Intermediate / Advanced sections)
- [ ] Lesson detail screen (concept → demo → practice → score)
- [ ] "Lessons" card on home screen alongside "Open Piano"
- [ ] Placement test (onboarding flow)
- [ ] Goal fork at onboarding (Soloist Path vs Chords Path)
- [ ] Local progress persistence (stars, completion, XP) via shared_preferences

---

## Phase 3 — Guided Piano
_The piano in learning mode._

- [ ] Key highlighting (by hand color)
- [ ] Wait Mode
- [ ] Hand isolation (left / right / both)
- [ ] Tempo control slider
- [ ] Real-time note feedback (correct / wrong / timing)
- [ ] Session summary screen (accuracy %, stars, XP)

---

## Phase 4 — Gamification
_Make practice habit-forming._

- [ ] Daily streak counter on home screen
- [ ] Stars per lesson (1–3) displayed on lesson list
- [ ] XP system and player level
- [ ] Achievements / badges
- [ ] Progress screen (calendar heatmap, accuracy graph, course completion)

---

## Phase 5 — Content
_Populate the app with real learning content._

- [ ] Beginner curriculum (30 lessons)
- [ ] Song library with difficulty tiers (simplified → full)
- [ ] Chord charts and chord library
- [ ] Theory mini-lessons embedded in lessons
- [ ] Exercise library (scales, arpeggios, Hanon)

---

## Phase 6 — Notation & Visualization
_Proper music notation rendering._

- [ ] Scrolling sheet music (custom Flutter painter or notation library)
- [ ] Falling notes (Synthesia-style) visualization
- [ ] Toggle between sheet music and falling notes
- [ ] Fingering number overlays on notation

---

## Phase 7 — Input
_Expand input methods._

- [ ] Microphone pitch detection
- [ ] Microphone calibration (noise floor setup)
- [ ] Latency compensation for mic input
- [ ] MIDI Bluetooth support

---

## Phase 8 — Video & Media
_Bring in instructor content._

- [ ] Video lesson player (embedded in lesson detail)
- [ ] Video hosted externally or bundled
- [ ] Offline lesson download support

---

## Phase 9 — Polish & Social
_Final layer of engagement features._

- [ ] Share completed song to social media
- [ ] Friend leaderboards
- [ ] Weekly challenges
- [ ] Dark / light theme refinement
- [ ] Onboarding tutorial (first-launch walkthrough)
