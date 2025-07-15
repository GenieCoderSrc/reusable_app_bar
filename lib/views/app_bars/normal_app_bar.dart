import 'package:flutter/material.dart';

class NormalAppBar extends StatelessWidget implements PreferredSizeWidget {
  const NormalAppBar({
    super.key,
    this.title,
    this.titleStyle,
    this.backgroundColor,
    this.titleWidget,
    this.leading,
    this.actions,
    this.showBackArrow = true,
    this.centerTitle = true,
    this.leadingWidth,
    this.appBarRadius,
    this.flexibleTitle,
    this.flexibleTitleStyle,
    this.bottomTitle,
    this.bottomTitleStyle,
    this.bottomChild,
    this.bottomChildPadding,
    this.bottom,
    this.additionalHeight = 0,
  });

  final String? title;
  final TextStyle? titleStyle;

  final Color? backgroundColor;
  final Widget? titleWidget;
  final Widget? leading;
  final List<Widget>? actions;
  final bool showBackArrow;
  final bool centerTitle;
  final double? leadingWidth;
  final double? appBarRadius;

  final String? flexibleTitle;
  final TextStyle? flexibleTitleStyle;

  final String? bottomTitle;
  final TextStyle? bottomTitleStyle;
  final Widget? bottomChild;
  final EdgeInsetsGeometry? bottomChildPadding;

  final PreferredSizeWidget? bottom;

  /// Extra height to add on top of the default toolbar height
  final double additionalHeight;

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;

    final PreferredSizeWidget? bottomWidget =
        (bottomChild != null || bottomTitle != null)
            ? PreferredSize(
              preferredSize: const Size.fromHeight(kToolbarHeight),
              child: Padding(
                padding: bottomChildPadding ?? EdgeInsets.zero,
                child:
                    bottomTitle != null
                        ? Text(
                          bottomTitle!,
                          style:
                              bottomTitleStyle ??
                              textTheme.titleLarge?.copyWith(
                                color: Colors.white,
                              ),
                        )
                        : bottomChild ?? const SizedBox.shrink(),
              ),
            )
            : bottom;

    return AppBar(
      title:
          titleWidget ??
          (title != null ? Text(title!, style: titleStyle) : null),
      centerTitle: centerTitle,
      leading: leading,
      leadingWidth: leadingWidth,
      actions: actions,
      backgroundColor: backgroundColor,
      automaticallyImplyLeading: showBackArrow,
      flexibleSpace:
          flexibleTitle != null
              ? FlexibleSpaceBar(
                centerTitle: centerTitle,
                title: Text(
                  flexibleTitle!,
                  style:
                      flexibleTitleStyle ??
                      textTheme.titleLarge?.copyWith(color: Colors.white),
                ),
              )
              : null,
      bottom: bottomWidget,
      shape:
          appBarRadius != null
              ? RoundedRectangleBorder(
                borderRadius: BorderRadius.vertical(
                  bottom: Radius.circular(appBarRadius!),
                ),
              )
              : null,
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight + additionalHeight);
}
