# Navigation & Screen Structure

## Screen Flow

```
Home
├── Open Piano → Piano (free play)
└── Lessons → Lessons List
    └── Lesson Detail → Guided Piano (practice mode)
```

## Screens

### Home (`lib/presentation/view/home.dart`)
The landing screen of the app. Shows:
- App name and tagline
- "Open Piano" card — navigates to free play piano
- "Lessons" card — navigates to the lessons list

### Piano (`lib/presentation/view/piano.dart`)
The full interactive MIDI piano keyboard for free play.
- AppBar with octave controls, sustain toggle, split keyboard, settings
- Supports keyboard shortcuts (A–L keys mapped to notes)
- Split keyboard mode for larger screens

### Lessons List _(to build)_
Browsable list of lessons organized by level:
- Beginner
- Intermediate
- Advanced

### Lesson Detail _(to build)_
Individual lesson screen:
1. Concept introduction (text or video)
2. Demonstration (listen to the target piece)
3. Guided practice (piano opens in practice mode)
4. Completion score (1–3 stars)

### Guided Piano _(to build)_
The piano in learning mode:
- Key highlighting (next note to press)
- Wait Mode (pauses until correct note played)
- Hand isolation (left / right / both)
- Tempo control (50–100%)
- Real-time feedback (correct / wrong / timing)

### Progress Screen _(to build)_
User's learning dashboard:
- Current streak
- Lessons completed
- Accuracy per session
- Practice time calendar heatmap

## Navigation Style

- `Navigator.push` for lesson → piano drill (stack-based, back button returns to lesson)
- Bottom navigation or home cards for top-level sections (Home, Lessons, Progress)
