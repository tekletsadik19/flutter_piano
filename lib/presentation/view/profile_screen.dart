import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:recase/recase.dart';

import '../../data/source/settings.dart';
import '../view/app.dart';
import '../widget/color_role.dart';
import '../widget/locale.dart';
import '../widget/piano_key.dart';
import 'package:country_flags/country_flags.dart';
import '../../l10n/app_localizations.dart';

class ProfileScreen extends ConsumerWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final cs = theme.colorScheme;

    return Scaffold(
      backgroundColor: cs.surface,
      body: CustomScrollView(
        slivers: [
          // ── Header ──
          SliverAppBar(
            expandedHeight: 190,
            pinned: true,
            backgroundColor: cs.surface,
            surfaceTintColor: Colors.transparent,
            elevation: 0,
            title: Text(
              'Profile',
              style: theme.textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.w700,
              ),
            ),
            flexibleSpace: FlexibleSpaceBar(
              background: _ProfileHeader(),
            ),
          ),

          // ── Settings Sections ──
          SliverPadding(
            padding: const EdgeInsets.fromLTRB(16, 12, 16, 120),
            sliver: SliverList(
              delegate: SliverChildListDelegate([
                _SectionCard(
                  icon: Icons.palette_outlined,
                  title: 'Appearance',
                  children: [
                    _ThemeBrightnessRow(),
                  ],
                ),
                const SizedBox(height: 12),
                _SectionCard(
                  icon: Icons.piano_outlined,
                  title: 'Piano Keys',
                  children: [
                    _KeyWidthRow(),
                    _Divider(),
                    _InvertKeysRow(),
                    _Divider(),
                    _ColorRoleRow(),
                    _Divider(),
                    _KeyLabelsRow(),
                    _Divider(),
                    _SplitKeyboardRow(),
                    _Divider(),
                    _DisableScrollRow(),
                  ],
                ),
                const SizedBox(height: 12),
                _SectionCard(
                  icon: Icons.vibration_outlined,
                  title: 'Feedback',
                  children: [
                    _HapticsRow(),
                  ],
                ),
                const SizedBox(height: 12),
                _SectionCard(
                  icon: Icons.language_outlined,
                  title: 'Language',
                  children: [
                    _LanguageRow(),
                  ],
                ),
              ]),
            ),
          ),
        ],
      ),
    );
  }
}

// ── Profile Header ──────────────────────────────────────────────────

class _ProfileHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    final theme = Theme.of(context);
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            cs.primary.withValues(alpha: 0.10),
            cs.primaryContainer.withValues(alpha: 0.05),
          ],
        ),
      ),
      child: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 12),
            Container(
              width: 72,
              height: 72,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [cs.primary, cs.tertiary],
                ),
                boxShadow: [
                  BoxShadow(
                    color: cs.primary.withValues(alpha: 0.35),
                    blurRadius: 18,
                    spreadRadius: 1,
                  ),
                ],
              ),
              child:
                  Icon(Icons.music_note_rounded, color: cs.onPrimary, size: 34),
            ),
            const SizedBox(height: 10),
            Text(
              'Lumina Piano',
              style: theme.textTheme.titleMedium
                  ?.copyWith(fontWeight: FontWeight.w700),
            ),
            const SizedBox(height: 2),
            Text(
              'Your musical journey',
              style: theme.textTheme.bodySmall
                  ?.copyWith(color: cs.onSurface.withValues(alpha: 0.5)),
            ),
          ],
        ),
      ),
    );
  }
}

// ── Section Card ────────────────────────────────────────────────────

class _SectionCard extends StatelessWidget {
  const _SectionCard({
    required this.icon,
    required this.title,
    required this.children,
  });

  final IconData icon;
  final String title;
  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final cs = theme.colorScheme;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(4, 0, 0, 8),
          child: Row(
            children: [
              Icon(icon, size: 14, color: cs.primary),
              const SizedBox(width: 6),
              Text(
                title.toUpperCase(),
                style: theme.textTheme.labelSmall?.copyWith(
                  color: cs.primary,
                  fontWeight: FontWeight.w700,
                  letterSpacing: 1.1,
                ),
              ),
            ],
          ),
        ),
        Card(
          elevation: 0,
          margin: EdgeInsets.zero,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
              side: BorderSide(
                  color: cs.outline.withValues(alpha: 0.12), width: 1)),
          color: cs.surface,
          child: Column(children: children),
        ),
      ],
    );
  }
}

class _Divider extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Divider(
      height: 0,
      indent: 16,
      endIndent: 16,
      color: Theme.of(context).colorScheme.outline.withValues(alpha: 0.1),
    );
  }
}

// ── Setting Rows ─────────────────────────────────────────────────────

class _ThemeBrightnessRow extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final brightness = ref.watch(themeModeProvider);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      child: Row(
        children: [
          Expanded(
              child: Text(context.locale.themeBrightness,
                  style: Theme.of(context).textTheme.bodyMedium)),
          SegmentedButton<ThemeMode>(
            style: SegmentedButton.styleFrom(
                padding: const EdgeInsets.symmetric(horizontal: 8)),
            segments: [
              ButtonSegment(
                  value: ThemeMode.light,
                  icon: const Icon(Icons.wb_sunny, size: 16)),
              ButtonSegment(
                  value: ThemeMode.system,
                  icon: const Icon(Icons.brightness_auto, size: 16)),
              ButtonSegment(
                  value: ThemeMode.dark,
                  icon: const Icon(Icons.nights_stay, size: 16)),
            ],
            selected: {brightness},
            onSelectionChanged: (v) =>
                ref.read(themeModeProvider.notifier).state = v.first,
          ),
        ],
      ),
    );
  }
}

class _KeyWidthRow extends ConsumerStatefulWidget {
  @override
  ConsumerState<_KeyWidthRow> createState() => _KeyWidthRowState();
}

class _KeyWidthRowState extends ConsumerState<_KeyWidthRow> {
  @override
  Widget build(BuildContext context) {
    final keyWidth = ref.watch(keyWidthProvider);
    final theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 10, 16, 4),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(children: [
            Expanded(
                child: Text(context.locale.keyWidth,
                    style: theme.textTheme.bodyMedium)),
            Text('${keyWidth.round()}',
                style: theme.textTheme.bodySmall?.copyWith(
                    color: theme.colorScheme.primary,
                    fontWeight: FontWeight.w600)),
            IconButton(
              icon: const Icon(Icons.restore, size: 18),
              tooltip: context.locale.resetToDefault,
              onPressed: keyWidth == 80
                  ? null
                  : () => ref.read(keyWidthProvider.notifier).state = 80,
            ),
          ]),
          Slider(
            value: keyWidth,
            min: 50,
            max: 200,
            onChanged: (v) =>
                setState(() => ref.read(keyWidthProvider.notifier).state = v),
          ),
        ],
      ),
    );
  }
}

class _InvertKeysRow extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final value = ref.watch(invertKeysProvider);
    return SwitchListTile(
      title: Text(context.locale.invertKeys,
          style: Theme.of(context).textTheme.bodyMedium),
      value: value,
      onChanged: (v) => ref.read(invertKeysProvider.notifier).state = v,
      contentPadding: const EdgeInsets.symmetric(horizontal: 16),
    );
  }
}

class _ColorRoleRow extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final value = ref.watch(colorRoleProvider);
    final theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      child: Row(
        children: [
          Expanded(
              child: Text(context.locale.colorRole,
                  style: theme.textTheme.bodyMedium)),
          DropdownButton<ColorRole>(
            value: value,
            underline: const SizedBox(),
            style: theme.textTheme.bodySmall
                ?.copyWith(color: theme.colorScheme.primary),
            onChanged: (v) => ref.read(colorRoleProvider.notifier).state = v!,
            items: ColorRole.values
                .map((e) =>
                    DropdownMenuItem(value: e, child: Text(e.name.titleCase)))
                .toList(),
          ),
        ],
      ),
    );
  }
}

class _KeyLabelsRow extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final value = ref.watch(keyLabelsProvider);
    final theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      child: Row(
        children: [
          Expanded(
              child: Text(context.locale.keyLabels,
                  style: theme.textTheme.bodyMedium)),
          DropdownButton<PitchLabels>(
            value: value,
            underline: const SizedBox(),
            style: theme.textTheme.bodySmall
                ?.copyWith(color: theme.colorScheme.primary),
            onChanged: (v) => ref.read(keyLabelsProvider.notifier).state = v!,
            items: PitchLabels.values
                .map((e) =>
                    DropdownMenuItem(value: e, child: Text(e.name.titleCase)))
                .toList(),
          ),
        ],
      ),
    );
  }
}

class _SplitKeyboardRow extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final value = ref.watch(splitKeyboardProvider);
    return SwitchListTile(
      title: Text(context.locale.splitKeyboard,
          style: Theme.of(context).textTheme.bodyMedium),
      value: value,
      onChanged: (v) => ref.read(splitKeyboardProvider.notifier).state = v,
      contentPadding: const EdgeInsets.symmetric(horizontal: 16),
    );
  }
}

class _DisableScrollRow extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final value = ref.watch(disableScrollProvider);
    return SwitchListTile(
      title: Text(context.locale.disableScroll,
          style: Theme.of(context).textTheme.bodyMedium),
      value: value,
      onChanged: (v) => ref.read(disableScrollProvider.notifier).state = v,
      contentPadding: const EdgeInsets.symmetric(horizontal: 16),
    );
  }
}

class _HapticsRow extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final value = ref.watch(hapticsProvider);
    return SwitchListTile(
      title: Text(context.locale.hapticFeedback,
          style: Theme.of(context).textTheme.bodyMedium),
      value: value,
      onChanged: (v) => ref.read(hapticsProvider.notifier).state = v,
      contentPadding: const EdgeInsets.symmetric(horizontal: 16),
    );
  }
}

class _LanguageRow extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 12, 16, 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Wrap(
            spacing: 8,
            runSpacing: 4,
            children: [
              for (final locale in AppLocalizations.supportedLocales)
                ChoiceChip(
                  avatar: locale.flag,
                  label: Text(locale.description(context)),
                  selected: ref.watch(localeProvider)?.languageCode ==
                      locale.languageCode,
                  onSelected: (_) =>
                      ref.read(localeProvider.notifier).state = locale,
                ),
            ],
          ),
          if (ref.watch(localeProvider) != null) ...[
            const SizedBox(height: 8),
            TextButton.icon(
              icon: const Icon(Icons.restore, size: 16),
              label: Text(context.locale.resetToDefault),
              onPressed: () => ref.read(localeProvider.notifier).state = null,
            ),
          ],
        ],
      ),
    );
  }
}

// ── Locale helpers (reused from settings.dart) ─────────────────────

extension _LocaleExt on Locale {
  String description(BuildContext context) {
    switch (languageCode) {
      case 'en':
        return context.locale.languageEn;
      case 'es':
        return context.locale.languageEs;
      case 'de':
        return context.locale.languageDe;
      case 'fr':
        return context.locale.languageFr;
      case 'ja':
        return context.locale.languageJa;
      case 'ko':
        return context.locale.languageKo;
      case 'zh':
        return context.locale.languageZh;
      case 'ru':
        return context.locale.languageRu;
      default:
        return 'Unknown';
    }
  }

  CountryFlag get flag {
    String? code;
    switch (languageCode) {
      case 'ja':
        code = 'jp';
      case 'en':
        code = 'us';
      case 'ko':
        code = 'kr';
      case 'zh':
        code = 'cn';
      case 'ru':
        code = 'ru';
    }
    if (code != null) {
      return CountryFlag.fromCountryCode(code, height: 18, width: 24);
    }
    return CountryFlag.fromLanguageCode(languageCode.toUpperCase(),
        height: 18, width: 24);
  }
}
