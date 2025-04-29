import 'package:flutter/material.dart';

class AppSimpleAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String titleTxt;
  final Widget? leading;
  final List<Widget>? actions;
  final bool? centerTitle;
  final double? elevation;

  final Color? bgColor;

  const AppSimpleAppBar({
    super.key,
    required this.titleTxt,
    this.centerTitle,
    this.bgColor,
    this.leading,
    this.actions,
    this.elevation,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(titleTxt),
      centerTitle: centerTitle,
      backgroundColor: bgColor,
      elevation: elevation,
      leading: leading,
      actions: actions,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
