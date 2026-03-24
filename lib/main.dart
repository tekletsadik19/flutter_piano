import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'core/theme/colors.dart';
import 'data/source/settings.dart';
import 'presentation/view/app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final prefs = await SharedPreferences.getInstance();

  // Migration: replace the old grey default with the new pink default
  const oldGrey = 0xFF9E9E9E;
  final newPink = AppColors.primary.value;
  final storedColor = prefs.getInt('themeColor');
  if (storedColor == null || storedColor == oldGrey) {
    await prefs.setInt('themeColor', newPink);
  }

  // Migration: ensure light mode is the default if nothing was stored
  if (prefs.getString('themeMode') == null) {
    await prefs.setString('themeMode', ThemeMode.light.name);
  }

  // Build initial overrides from persisted prefs — zero flash
  final overrides = <Override>[
    prefsProvider.overrideWith((_) async => prefs),
    themeColorProvider.overrideWith(
      (_) => Color(prefs.getInt('themeColor') ?? newPink),
    ),
    themeModeProvider.overrideWith(
      (_) => ThemeMode.values.firstWhere(
        (e) => e.name == (prefs.getString('themeMode') ?? 'light'),
        orElse: () => ThemeMode.light,
      ),
    ),
    invertKeysProvider.overrideWith(
      (_) => prefs.getBool('invertKeys') ?? false,
    ),
    keyWidthProvider.overrideWith(
      (_) => prefs.getDouble('keyWidth') ?? 80,
    ),
    hapticsProvider.overrideWith(
      (_) => prefs.getBool('haptics') ?? true,
    ),
    splitKeyboardProvider.overrideWith(
      (_) => prefs.getBool('splitKeyboard') ?? true,
    ),
    disableScrollProvider.overrideWith(
      (_) => prefs.getBool('disableScroll') ?? false,
    ),
  ];

  runApp(ProviderScope(overrides: overrides, child: const Ruth()));
}
