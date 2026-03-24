import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'settings.dart';

/// XP awarded for a given star rating.
int xpForStars(int stars) => switch (stars) { 1 => 10, 2 => 20, _ => 35 };

/// Represents a player level with its XP bounds and display title.
class PlayerLevel {
  const PlayerLevel({
    required this.level,
    required this.title,
    required this.minXp,
    required this.maxXp,
  });

  final int level;
  final String title;
  final int minXp;
  final int maxXp; // -1 means max level (no upper bound)
}

const _levels = [
  PlayerLevel(level: 1, title: 'Beginner', minXp: 0, maxXp: 99),
  PlayerLevel(level: 2, title: 'Student', minXp: 100, maxXp: 299),
  PlayerLevel(level: 3, title: 'Practitioner', minXp: 300, maxXp: 699),
  PlayerLevel(level: 4, title: 'Musician', minXp: 700, maxXp: 1499),
  PlayerLevel(level: 5, title: 'Performer', minXp: 1500, maxXp: 2999),
  PlayerLevel(level: 6, title: 'Virtuoso', minXp: 3000, maxXp: -1),
];

/// Returns the [PlayerLevel] that corresponds to the given [xp] total.
PlayerLevel levelForXp(int xp) {
  for (var i = _levels.length - 1; i >= 0; i--) {
    if (xp >= _levels[i].minXp) return _levels[i];
  }
  return _levels.first;
}

// ---------------------------------------------------------------------------
// Providers
// ---------------------------------------------------------------------------

final xpProvider = StateProvider<int>((ref) {
  ref.listenSelf((previous, next) async {
    final prefs = await ref.watch(prefsProvider.future);
    await prefs.setInt('gamif_xp', next);
  });
  return 0;
});

final streakProvider = StateProvider<int>((ref) {
  ref.listenSelf((previous, next) async {
    final prefs = await ref.watch(prefsProvider.future);
    await prefs.setInt('gamif_streak', next);
  });
  return 0;
});

final lastPracticeDateProvider = StateProvider<String>((ref) {
  ref.listenSelf((previous, next) async {
    final prefs = await ref.watch(prefsProvider.future);
    await prefs.setString('gamif_lastDate', next);
  });
  return '';
});

// ---------------------------------------------------------------------------
// Actions
// ---------------------------------------------------------------------------

/// Records a completed practice session.
///
/// Awards XP based on [stars] and updates the streak:
/// - If last practice was yesterday → streak + 1
/// - If last practice was today → no change
/// - Otherwise → reset streak to 1
Future<void> recordPracticeSession(
  WidgetRef ref, {
  required int stars,
}) async {
  // 1. Award XP
  final earned = xpForStars(stars);
  ref.read(xpProvider.notifier).state += earned;

  // 2. Update streak
  final today = DateTime.now();
  final todayDate = DateTime(today.year, today.month, today.day);
  final lastDateStr = ref.read(lastPracticeDateProvider);

  if (lastDateStr.isEmpty) {
    ref.read(streakProvider.notifier).state = 1;
  } else {
    final last = DateTime.parse(lastDateStr);
    final lastDate = DateTime(last.year, last.month, last.day);
    final diff = todayDate.difference(lastDate).inDays;
    if (diff == 1) {
      ref.read(streakProvider.notifier).state += 1;
    } else if (diff == 0) {
      // Already practiced today — no change to streak
    } else {
      ref.read(streakProvider.notifier).state = 1;
    }
  }

  // 3. Update last practice date
  ref.read(lastPracticeDateProvider.notifier).state = todayDate.toIso8601String();
}

// ---------------------------------------------------------------------------
// Load persisted gamification state
// ---------------------------------------------------------------------------

final loadGamification = FutureProvider<void>((ref) async {
  final prefs = await ref.watch(prefsProvider.future);

  final xp = prefs.getInt('gamif_xp');
  if (xp != null) {
    ref.read(xpProvider.notifier).state = xp;
  }

  final streak = prefs.getInt('gamif_streak');
  if (streak != null) {
    ref.read(streakProvider.notifier).state = streak;
  }

  final lastDate = prefs.getString('gamif_lastDate');
  if (lastDate != null) {
    ref.read(lastPracticeDateProvider.notifier).state = lastDate;
  }
});
