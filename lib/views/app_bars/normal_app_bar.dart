import 'package:flutter/material.dart';
import 'package:app_style/app_style.dart';

class NormalAppBar extends StatelessWidget implements PreferredSizeWidget {
  const NormalAppBar({
    super.key,
    this.titleTxt,
    this.titleTxtStyle,
    this.bgColor,
    this.titleWidget,
    this.leading,
    this.actionsList,
    this.willShowBackArrow,
    this.centerTitle,
    this.leadingWidth,
    this.appBarRadius,
    this.flxTitle,
    this.flxTitleTxtStyle,
    this.bottomTitle,
    this.bottomTitleTxtStyle,
    this.bottomChild,
    this.bottom,
    this.appBarHeight = 0,
    this.bottomChildPadding,
  });

  final String? titleTxt;
  final TextStyle? titleTxtStyle;

  final Color? bgColor;
  final Widget? titleWidget;
  final Widget? leading;
  final List<Widget>? actionsList;
  final bool? willShowBackArrow;
  final bool? centerTitle;
  final double? leadingWidth;
  final double? appBarRadius;

  final String? flxTitle;
  final TextStyle? flxTitleTxtStyle;

  final String? bottomTitle;
  final TextStyle? bottomTitleTxtStyle;
  final Widget? bottomChild;
  final EdgeInsetsGeometry? bottomChildPadding;

  final PreferredSizeWidget? bottom;

  final double appBarHeight;

//

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: titleWidget ?? Text(titleTxt ?? '', style: titleTxtStyle),
      // title: Padding(
      //   padding: const EdgeInsets.only(top: 8.0),
      //   child: titleWidget ?? Text(titleTxt ?? '', style: titleTxtStyle),
      // ),
      centerTitle: centerTitle ?? true,
      leadingWidth: leadingWidth,
      leading: leading,
      actions: actionsList,
      backgroundColor: bgColor,
      automaticallyImplyLeading: willShowBackArrow ?? true,
      // flexibleSpace: FlexibleSpaceBar(
      //   centerTitle: centerTitle,
      //   title: flxTitleWidget ??
      //       Text(
      //         flxTitle ?? "",
      //         style: flxTitleTxtStyle ??
      //             AppTxtStyles.kTitleTextStyle.copyWith(color: Colors.red),
      //       ),
      // ),
      flexibleSpace: flxTitle != null
          ? FlexibleSpaceBar(
              centerTitle: centerTitle,
              title: Text(
                flxTitle ?? "",
                style: flxTitleTxtStyle ??
                    AppTxtStyles.kTitleTextStyle.copyWith(color: Colors.white),
              ),
            )
          : null,
      bottom: bottomChild != null || bottomTitle != null
          ? PreferredSize(
              preferredSize: const Size.fromHeight(kToolbarHeight),
              child: bottomTitle != null
                  ? Text(bottomTitle ?? "",
                      style: bottomTitleTxtStyle ??
                          AppTxtStyles.kTitleTextStyle
                              .copyWith(color: Colors.white))
                  : bottomChild!)
          : bottom,
      shape: appBarRadius == null
          ? null
          : RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(
                bottom: Radius.circular(
                    appBarRadius ?? 20), // Adjust the radius as needed
              ),
            ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight + appBarHeight);
}
