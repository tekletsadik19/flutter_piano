import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:remixicon/remixicon.dart';

import '../../features/lessons/presentation/view/lessons_screen.dart';
import '../../features/progress/presentation/view/progress_screen.dart';
import 'home.dart';
import 'piano.dart';
import 'profile_screen.dart';

class MainShell extends StatefulWidget {
  const MainShell({super.key});

  @override
  State<MainShell> createState() => _MainShellState();
}

class _MainShellState extends State<MainShell> {
  int _currentIndex = 0;

  List<Widget> get _screens => [
        Home(onSwitchTab: (i) => setState(() => _currentIndex = i)),
        const LessonsScreen(),
        const Piano(),
        const ProgressScreen(),
        const ProfileScreen(),
      ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: IndexedStack(index: _currentIndex, children: _screens),
      bottomNavigationBar: _BottomNav(
        currentIndex: _currentIndex,
        onTap: (i) => setState(() => _currentIndex = i),
      ),
    );
  }
}

class _BottomNav extends StatelessWidget {
  const _BottomNav({required this.currentIndex, required this.onTap});

  final int currentIndex;
  final void Function(int) onTap;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    return ClipRRect(
      child: Container(
        padding: const EdgeInsets.fromLTRB(16, 4, 16, 8),
        color: Colors.transparent,
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 15, sigmaY: 15),
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
            decoration: BoxDecoration(
              color: isDark
                  ? const Color(0xFF2C2C2C).withAlpha(225)
                  : const Color(0xFFFFFFFF).withAlpha(225),
              borderRadius: BorderRadius.circular(100),
              boxShadow: [
                BoxShadow(blurRadius: 24, color: Colors.black.withAlpha(13)),
              ],
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _NavItem(
                  label: 'Home',
                  activeIcon: HugeIcons.strokeRoundedHome01,
                  inactiveIcon: HugeIcons.strokeRoundedHome01,
                  index: 0,
                  currentIndex: currentIndex,
                  onTap: onTap,
                ),
                _NavItem(
                  label: 'Lessons',
                  iconData: Remix.music_2_line,
                  index: 1,
                  currentIndex: currentIndex,
                  onTap: onTap,
                ),
                _NavItem(
                  label: 'Piano',
                  iconData: Remix.keyboard_line,
                  index: 2,
                  currentIndex: currentIndex,
                  onTap: onTap,
                ),
                _NavItem(
                  label: 'Progress',
                  iconData: Remix.bar_chart_box_line,
                  index: 3,
                  currentIndex: currentIndex,
                  onTap: onTap,
                ),
                _NavItem(
                  label: 'Profile',
                  iconData: Remix.account_circle_line,
                  index: 4,
                  currentIndex: currentIndex,
                  onTap: onTap,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _NavItem extends StatelessWidget {
  const _NavItem({
    required this.label,
    this.activeIcon,
    this.inactiveIcon,
    this.iconData,
    required this.index,
    required this.currentIndex,
    required this.onTap,
  });

  final String label;
  final List<List<dynamic>>? activeIcon;
  final List<List<dynamic>>? inactiveIcon;
  final IconData? iconData;
  final int index;
  final int currentIndex;
  final void Function(int) onTap;

  @override
  Widget build(BuildContext context) {
    final isSelected = currentIndex == index;
    final theme = Theme.of(context);

    return Expanded(
      child: GestureDetector(
        onTap: () => onTap(index),
        behavior: HitTestBehavior.translucent,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            AnimatedSwitcher(
              duration: const Duration(milliseconds: 200),
              child: iconData != null
                  ? Icon(
                      iconData,
                      key: ValueKey('icon_$isSelected'),
                      size: 24,
                      color: isSelected
                          ? theme.colorScheme.primary
                          : theme.colorScheme.onSurface.withValues(alpha: 0.6),
                    )
                  : HugeIcon(
                      key: ValueKey(isSelected),
                      icon: isSelected ? activeIcon! : inactiveIcon!,
                      size: 24,
                      color: isSelected
                          ? theme.colorScheme.primary
                          : theme.colorScheme.onSurface.withValues(alpha: 0.6),
                    ),
            ),
            const SizedBox(height: 4),
            AnimatedDefaultTextStyle(
              duration: const Duration(milliseconds: 200),
              style: theme.textTheme.labelSmall!.copyWith(
                fontWeight: isSelected ? FontWeight.w600 : FontWeight.w500,
                color: isSelected
                    ? theme.colorScheme.primary
                    : theme.colorScheme.onSurface.withAlpha(153),
              ),
              child: Text(label),
            ),
          ],
        ),
      ),
    );
  }
}
