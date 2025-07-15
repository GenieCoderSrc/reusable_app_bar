import 'package:flutter/material.dart';
import 'package:reusable_app_bar/views/widgets/avatar_title_sub_title_builder.dart';

import 'normal_app_bar.dart';

class TitleSubTitleProfileAppBar extends StatelessWidget {
  const TitleSubTitleProfileAppBar({
    super.key,
    this.imageSource,
    this.imgBgColor,
    this.avatarRadius,
    this.titleTxt,
    this.titleTxtStyle,
    this.subTitleTxt,
    this.subTitleTxtStyle,
    this.bgColor,
    this.titleWidget,
    this.subTitleWidget,
    this.leading,
    this.actionsList,
    this.willShowBackArrow,
    this.centerTitle,
    this.leadingWidth,
    this.appBarRadius,
  });

  final String? imageSource;
  final Color? imgBgColor;
  final double? avatarRadius;

  final String? titleTxt;
  final TextStyle? titleTxtStyle;

  final String? subTitleTxt;
  final TextStyle? subTitleTxtStyle;

  final Color? bgColor;
  final Widget? titleWidget;
  final Widget? subTitleWidget;

  final Widget? leading;
  final List<Widget>? actionsList;
  final bool? willShowBackArrow;
  final bool? centerTitle;
  final double? leadingWidth;
  final double? appBarRadius;

  @override
  Widget build(BuildContext context) {
    return NormalAppBar(
      backgroundColor: bgColor,
      leading: leading,
      actions: actionsList,
      showBackArrow: willShowBackArrow ?? true,
      centerTitle: centerTitle ?? true,
      leadingWidth: leadingWidth ?? 20,
      appBarRadius: appBarRadius,
      titleWidget: ProfileHeader(
        imageSource: imageSource,
        imgBgColor: imgBgColor,
        avatarRadius: avatarRadius ?? 20,
        titleTxt: titleTxt,
        titleTxtStyle: titleTxtStyle,
        subTitleTxt: subTitleTxt,
        subTitleTxtStyle: subTitleTxtStyle,
        titleWidget: titleWidget,
        subTitleWidget: subTitleWidget,
      ),
    );
  }
}
