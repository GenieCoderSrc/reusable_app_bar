import 'package:flutter/material.dart';

class RoundedAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String? titleTxt;
  final Color? bgColor;
  final Widget? leading;
  final List<Widget>? actions;
  final double? radius;
  final bool? willShowBackArrow;
  final bool? centerTitle;
  final List<Widget>? actionsList;

  const RoundedAppBar({
    super.key,
    this.titleTxt,
    this.centerTitle,
    this.bgColor,
    this.leading,
    this.actions,
    this.radius,
    this.willShowBackArrow,
    this.actionsList,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(titleTxt ?? ""),
      centerTitle: centerTitle,
      backgroundColor: bgColor,
      elevation: 0,
      leading: leading,
      actions: actions,
      automaticallyImplyLeading: willShowBackArrow ?? true,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          bottom: Radius.circular(radius ?? 20), // Adjust the radius as needed
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
