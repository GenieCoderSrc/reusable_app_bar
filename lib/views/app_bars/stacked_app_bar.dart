import 'package:flutter/material.dart';

class StackedAppBar extends StatelessWidget implements PreferredSizeWidget {
  const StackedAppBar({
    super.key,
    this.title,
    this.titleStyle,
    this.titleWidget,
    this.leading,
    this.actions,
    this.showBackArrow = true,
    this.centerTitle = true,
    this.leadingWidth,
    this.backgroundColor,
    this.borderRadius,
    this.height = 120.0,
    this.overlayWidget,
    this.overlayTop,
    this.overlayBottom,
    this.overlayLeft,
    this.overlayRight,
  });

  /// Plain text title (ignored if `titleWidget` is provided).
  final String? title;

  /// Text style for plain title.
  final TextStyle? titleStyle;

  /// Custom widget for title. If provided, it overrides [title].
  final Widget? titleWidget;

  /// Background color of the app bar.
  final Color? backgroundColor;

  /// Leading widget (e.g. back button, icon).
  final Widget? leading;

  /// Width of the leading widget.
  final double? leadingWidth;

  /// App bar action widgets.
  final List<Widget>? actions;

  /// If true, shows the default back arrow when no [leading] is provided.
  final bool showBackArrow;

  /// Whether the title is centered.
  final bool centerTitle;

  /// Bottom border radius of the app bar container.
  final double? borderRadius;

  /// Total height of the app bar.
  final double height;

  /// Overlay widget that appears inside the [Stack].
  final Widget? overlayWidget;

  /// Overlay widget position from the top.
  final double? overlayTop;

  /// Overlay widget position from the bottom.
  final double? overlayBottom;

  /// Overlay widget position from the left.
  final double? overlayLeft;

  /// Overlay widget position from the right.
  final double? overlayRight;

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);

    return Stack(
      children: [
        AppBar(
          leading: leading,
          leadingWidth: leadingWidth,
          actions: actions,
          centerTitle: centerTitle,
          automaticallyImplyLeading: showBackArrow,
          backgroundColor: backgroundColor ?? theme.scaffoldBackgroundColor,
          flexibleSpace: _buildFlexibleSpace(context),
        ),
        if (overlayWidget != null)
          Positioned(
            top: overlayTop ?? 80,
            bottom: overlayBottom,
            left: overlayLeft ?? 0,
            right: overlayRight ?? 0,
            child: overlayWidget!,
          ),
      ],
    );
  }

  Widget _buildFlexibleSpace(BuildContext context) {
    final ThemeData theme = Theme.of(context);

    return SizedBox(
      height: height,
      child: Container(
        padding: const EdgeInsets.only(bottom: 10),
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          color: backgroundColor ?? theme.appBarTheme.backgroundColor,
          borderRadius:
              borderRadius != null
                  ? BorderRadius.vertical(
                    bottom: Radius.circular(borderRadius!),
                  )
                  : null,
        ),
        child:
            titleWidget ??
            Center(
              child: Text(
                title ?? '',
                style:
                    titleStyle ??
                    theme.textTheme.headlineMedium?.copyWith(
                      color: Colors.white,
                    ),
                overflow: TextOverflow.ellipsis,
              ),
            ),
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(height);
}
