import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../data/source/settings.dart';
import '../../l10n/app_localizations.dart';
import 'home.dart';

final localeProvider = StateProvider<Locale?>(
  (ref) => null,
);

class Ruth extends ConsumerWidget {
  const Ruth({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final color = ref.watch(themeColorProvider);
    final mode = ref.watch(themeModeProvider);
    const appBarTheme = AppBarTheme(
      backgroundColor: Colors.black,
      foregroundColor: Colors.white,
    );
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Ruth',
      theme: ThemeData.light(useMaterial3: true).copyWith(
        colorScheme: ColorScheme.fromSeed(
          seedColor: color,
          brightness: Brightness.light,
        ),
        appBarTheme: appBarTheme,
      ),
      darkTheme: ThemeData.dark(useMaterial3: true).copyWith(
        colorScheme: ColorScheme.fromSeed(
          seedColor: color,
          brightness: Brightness.dark,
        ),
        appBarTheme: appBarTheme,
      ),
      themeMode: mode,
      locale: ref.watch(localeProvider),
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      home: const Home(),
    );
  }
}
