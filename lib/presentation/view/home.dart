import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hugeicons/hugeicons.dart';

import '../../data/source/gamification.dart';

class Home extends ConsumerWidget {
  const Home({super.key, this.onSwitchTab});

  final void Function(int)? onSwitchTab;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final xp = ref.watch(xpProvider);
    final streak = ref.watch(streakProvider);
    final playerLevel = levelForXp(xp);
    final isWide = MediaQuery.sizeOf(context).width > 600;

    return Scaffold(
      appBar: AppBar(
        titleSpacing: 20,
        actions: [
          IconButton(
            icon: HugeIcon(
              icon: HugeIcons.strokeRoundedNotification01,
              color: theme.colorScheme.onSurface,
              size: 22,
            ),
            onPressed: () {},
          ),
          const SizedBox(width: 8),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 4),
            _FeaturedBanner(theme: theme, onTap: () => onSwitchTab?.call(1)),
            const SizedBox(height: 12),
            _StatRow(
              theme: theme,
              streak: streak,
              xp: xp,
              playerLevel: playerLevel,
            ),
            const SizedBox(height: 20),
            Text(
              'QUICK ACCESS',
              style: theme.textTheme.labelSmall?.copyWith(
                color: theme.colorScheme.onSurfaceVariant,
                letterSpacing: 1.5,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 10),
            if (isWide)
              Row(children: [
                Expanded(
                  child: _QuickCard(
                    icon: HugeIcons.strokeRoundedMusicNote01,
                    label: 'Lessons',
                    subtitle: 'Structured learning',
                    onTap: () => onSwitchTab?.call(1),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: _QuickCard(
                    icon: HugeIcons.strokeRoundedMusicNote02,
                    label: 'Free Play',
                    subtitle: 'Open the piano',
                    onTap: () => onSwitchTab?.call(2),
                  ),
                ),
              ])
            else
              Column(children: [
                _QuickCard(
                  icon: HugeIcons.strokeRoundedMusicNote01,
                  label: 'Lessons',
                  subtitle: 'Structured learning',
                  onTap: () => onSwitchTab?.call(1),
                ),
                const SizedBox(height: 10),
                _QuickCard(
                  icon: HugeIcons.strokeRoundedMusicNote02,
                  label: 'Free Play',
                  subtitle: 'Open the piano',
                  onTap: () => onSwitchTab?.call(2),
                ),
              ]),
            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }
}

class _StatRow extends StatelessWidget {
  const _StatRow({
    required this.theme,
    required this.streak,
    required this.xp,
    required this.playerLevel,
  });

  final ThemeData theme;
  final int streak;
  final int xp;
  final PlayerLevel playerLevel;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        _StatChip(
          theme: theme,
          icon: HugeIcons.strokeRoundedFire,
          label: '$streak day${streak == 1 ? '' : 's'}',
          color: const Color(0xFFFF6B35),
        ),
        const SizedBox(width: 8),
        _StatChip(
          theme: theme,
          icon: HugeIcons.strokeRoundedStar,
          label: 'Lv ${playerLevel.level} · ${playerLevel.title}',
          color: theme.colorScheme.primary,
        ),
        const SizedBox(width: 8),
        _StatChip(
          theme: theme,
          icon: HugeIcons.strokeRoundedZap,
          label: '$xp XP',
          color: theme.colorScheme.secondary,
        ),
      ],
    );
  }
}

class _StatChip extends StatelessWidget {
  const _StatChip({
    required this.theme,
    required this.icon,
    required this.label,
    required this.color,
  });

  final ThemeData theme;
  final List<List<dynamic>> icon;
  final String label;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
        decoration: BoxDecoration(
          color: color.withAlpha(20),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            HugeIcon(icon: icon, color: color, size: 16),
            const SizedBox(width: 6),
            Flexible(
              child: Text(
                label,
                style: theme.textTheme.labelSmall?.copyWith(
                  fontWeight: FontWeight.w600,
                  color: color,
                ),
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _FeaturedBanner extends StatelessWidget {
  const _FeaturedBanner({required this.theme, required this.onTap});
  final ThemeData theme;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: theme.colorScheme.primary,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Start Learning',
                  style: theme.textTheme.titleMedium?.copyWith(
                    color: theme.colorScheme.onPrimary,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  'From beginner to virtuoso,\nat your own pace.',
                  style: theme.textTheme.bodySmall?.copyWith(
                    color: theme.colorScheme.onPrimary.withAlpha(200),
                    height: 1.5,
                  ),
                ),
                const SizedBox(height: 14),
                FilledButton.tonal(
                  style: FilledButton.styleFrom(
                    backgroundColor: theme.colorScheme.onPrimary,
                    foregroundColor: theme.colorScheme.primary,
                    visualDensity: VisualDensity.compact,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16, vertical: 8),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    textStyle: theme.textTheme.labelMedium?.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  onPressed: onTap,
                  child: const Text('Browse Lessons'),
                ),
              ],
            ),
          ),
          const SizedBox(width: 12),
          HugeIcon(
            icon: HugeIcons.strokeRoundedMusicNote03,
            color: theme.colorScheme.onPrimary.withAlpha(50),
            size: 80,
          ),
        ],
      ),
    );
  }
}

class _QuickCard extends StatelessWidget {
  const _QuickCard({
    required this.icon,
    required this.label,
    required this.subtitle,
    required this.onTap,
  });

  final List<List<dynamic>> icon;
  final String label;
  final String subtitle;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Material(
      color: theme.colorScheme.surfaceContainerHighest,
      borderRadius: BorderRadius.circular(16),
      child: InkWell(
        borderRadius: BorderRadius.circular(16),
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
          child: Row(
            children: [
              Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: theme.colorScheme.primary.withAlpha(20),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: HugeIcon(
                  icon: icon,
                  color: theme.colorScheme.primary,
                  size: 22,
                ),
              ),
              const SizedBox(width: 14),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      label,
                      style: theme.textTheme.titleSmall?.copyWith(
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Text(
                      subtitle,
                      style: theme.textTheme.bodySmall?.copyWith(
                        color: theme.colorScheme.onSurfaceVariant,
                      ),
                    ),
                  ],
                ),
              ),
              HugeIcon(
                icon: HugeIcons.strokeRoundedArrowRight01,
                color: theme.colorScheme.onSurfaceVariant,
                size: 18,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
