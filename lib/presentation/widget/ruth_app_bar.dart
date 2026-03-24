import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class RuthAppBar extends StatelessWidget implements PreferredSizeWidget {
  const RuthAppBar({
    super.key,
    this.title,
    this.leading,
    this.actions,
    this.bottom,
    this.titleSpacing,
  });

  final Widget? title;
  final Widget? leading;
  final List<Widget>? actions;
  final PreferredSizeWidget? bottom;
  final double? titleSpacing;

  @override
  Size get preferredSize => Size.fromHeight(
        kToolbarHeight + (bottom?.preferredSize.height ?? 0),
      );

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: isDark
          ? SystemUiOverlayStyle.light
          : SystemUiOverlayStyle.dark,
      child: Container(
        decoration: BoxDecoration(
          color: theme.appBarTheme.backgroundColor,
          boxShadow: [
            BoxShadow(
              color: isDark
                  ? Colors.white.withAlpha(18)
                  : Colors.black.withAlpha(22),
              offset: const Offset(0, 1),
              blurRadius: 6,
              spreadRadius: 0,
            ),
          ],
        ),
        child: SafeArea(
          bottom: false,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(
                height: kToolbarHeight,
                child: NavigationToolbar(
                  leading: leading ??
                      (Navigator.of(context).canPop()
                          ? const BackButton()
                          : null),
                  middle: DefaultTextStyle(
                    style: theme.appBarTheme.titleTextStyle ??
                        theme.textTheme.titleLarge!.copyWith(
                          color: theme.appBarTheme.foregroundColor,
                          fontWeight: FontWeight.bold,
                        ),
                    child: title ?? const SizedBox.shrink(),
                  ),
                  trailing: actions != null
                      ? Row(
                          mainAxisSize: MainAxisSize.min,
                          children: actions!,
                        )
                      : null,
                  middleSpacing: titleSpacing ?? NavigationToolbar.kMiddleSpacing,
                ),
              ),
              if (bottom != null) bottom!,
            ],
          ),
        ),
      ),
    );
  }
}
