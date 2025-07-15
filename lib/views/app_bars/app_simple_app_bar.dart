import 'package:flutter/material.dart';

class AppSimpleAppBar extends StatelessWidget implements PreferredSizeWidget {
  const AppSimpleAppBar({
    super.key,
    required this.title,
    this.titleStyle,
    this.leading,
    this.actions,
    this.centerTitle,
    this.elevation,
    this.backgroundColor,
  });

  /// Title string to be displayed in the app bar
  final String title;

  /// Optional custom title style
  final TextStyle? titleStyle;

  /// Leading widget (e.g., back button, icon)
  final Widget? leading;

  /// App bar action widgets
  final List<Widget>? actions;

  /// Whether the title should be centered
  final bool? centerTitle;

  /// Elevation/shadow under the app bar
  final double? elevation;

  /// Background color of the app bar
  final Color? backgroundColor;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return AppBar(
      title: Text(title, style: titleStyle ?? theme.textTheme.titleLarge),
      centerTitle: centerTitle,
      backgroundColor: backgroundColor ?? theme.appBarTheme.backgroundColor,
      elevation: elevation,
      leading: leading,
      actions: actions,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
