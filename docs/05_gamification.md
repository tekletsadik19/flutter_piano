# Gamification & Progress Tracking

## Overview

Gamification keeps users coming back daily. The goal is to make practice feel rewarding, not like a chore. Every mechanic serves motivation — short-term (finish this lesson), medium-term (keep the streak), and long-term (reach the next level).

---

## Daily Streaks

**The single biggest retention driver.**

- Increments by 1 for every day the user completes at least one lesson or practice session
- Displayed prominently on the home screen
- Push notification reminder if no practice by a set time (user-configured)
- Streak freeze: one grace day per week if the user misses (prevents discouragement)
- Milestones: 7 days, 30 days, 100 days trigger special badge unlocks

---

## Stars Per Lesson (1–3)

Each lesson is rated on completion:

| Stars | Accuracy | Meaning |
|---|---|---|
| ⭐ | 60–74% | Completed |
| ⭐⭐ | 75–89% | Good |
| ⭐⭐⭐ | 90–100% | Mastered |

- Users can replay any lesson to improve their star rating
- 3-star rating unlocks the next difficulty tier of the same song
- Stars are visible on the lesson list as a progress indicator

---

## XP (Experience Points)

Earned for every completed action:

| Action | XP |
|---|---|
| Complete a lesson (1 star) | 10 XP |
| Complete a lesson (2 stars) | 20 XP |
| Complete a lesson (3 stars) | 35 XP |
| Maintain a 7-day streak | 50 XP bonus |
| Complete a full course | 100 XP bonus |
| First time completing a song | 25 XP |

XP accumulates into an overall **Player Level** displayed on the profile/progress screen.

---

## Player Levels

| Level | XP Required | Title |
|---|---|---|
| 1 | 0 | Beginner |
| 2 | 100 | Student |
| 3 | 300 | Practitioner |
| 4 | 700 | Musician |
| 5 | 1500 | Performer |
| 6 | 3000 | Virtuoso |

---

## Achievements & Badges

Unlocked at milestone moments for psychological reward at irregular intervals:

| Badge | Trigger |
|---|---|
| First Note | Play your first note |
| First Song | Complete your first song lesson |
| Streak Starter | 3-day streak |
| Week Warrior | 7-day streak |
| Month Master | 30-day streak |
| Both Hands | Complete first hands-together lesson |
| Scale Master | Complete all 12 major scales |
| Speed Demon | Complete a lesson at 100% tempo with 3 stars |
| Perfectionist | 100% accuracy on any lesson |
| Night Owl | Practice after 10pm |
| Early Bird | Practice before 7am |

---

## Progress Tracking

### Practice Time Calendar
- GitHub-style heatmap calendar showing days practiced
- Color intensity reflects duration of session
- Visible on the progress screen

### Accuracy Over Time
- Line graph showing accuracy % per session over the past 30 days
- Helps identify improvement trends and plateaus

### Lesson Completion
- Course progress bar per level (e.g., "Beginner: 12/30 lessons complete")
- Per-lesson star rating visible in the lesson list

### Per-Song Mastery
- Each song shows its highest star rating achieved
- Difficulty tier unlocked shown (Simplified / Standard / Full)

### Stats Summary
- Total practice time (lifetime)
- Current and longest streak
- Total lessons completed
- Total songs mastered (3 stars)
- Overall accuracy average

---

## Progress Screen Layout (planned)

```
┌─────────────────────────────┐
│  🔥 Streak: 12 days         │
│  ⭐ Level 3 — Practitioner  │
│  ████████░░ 680 / 700 XP    │
├─────────────────────────────┤
│  Practice Calendar          │
│  [heatmap grid]             │
├─────────────────────────────┤
│  Accuracy (last 30 days)    │
│  [line graph]               │
├─────────────────────────────┤
│  Courses                    │
│  Beginner    ████░░ 12/30   │
│  Intermediate ██░░░  4/20   │
└─────────────────────────────┘
```
