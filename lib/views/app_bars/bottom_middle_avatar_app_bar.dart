import 'dart:io';

import 'package:flutter/material.dart';
import 'package:reusable_image_widget/reusable_image_widget.dart';

class BottomMiddleAvatarAppBar extends StatelessWidget {
  const BottomMiddleAvatarAppBar({
    super.key,
    this.titleTxt,
    this.titleTxtStyle,
    this.bgColor,
    this.titleWidget,
    this.leadingWidget,
    this.actionsList,
    this.willShowBackArrow,
    this.centerTitle = true,
    this.leadingWidth,
    this.appBarRadius,
    this.height,
    this.bottomWidget,
    this.positionTop,
    this.positionBottom,
    this.positionLeft,
    this.positionRight,
    this.imageSource,
    this.img,
    this.imgBgColor,
    this.imgRadius,
  });

  final String? titleTxt;
  final TextStyle? titleTxtStyle;
  final Color? bgColor;
  final Widget? titleWidget;
  final Widget? leadingWidget;
  final List<Widget>? actionsList;
  final bool? willShowBackArrow;
  final bool? centerTitle;
  final double? leadingWidth;
  final double? appBarRadius;
  final double? height;

  final Widget? bottomWidget;

  final double? positionTop;
  final double? positionBottom;
  final double? positionLeft;
  final double? positionRight;

  final File? img;
  final String? imageSource;
  final Color? imgBgColor;
  final double? imgRadius;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        AppBar(
          leadingWidth: leadingWidth,
          leading: leadingWidget,
          actions: actionsList,
          centerTitle: centerTitle,
          automaticallyImplyLeading: willShowBackArrow ?? true,
          // backgroundColor: Colors.red,

          // backgroundColor: Colors.transparent,
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          title: Text(titleTxt ?? ""),
          flexibleSpace: SizedBox(
            height: height ?? 120.0,
            child: Container(
                padding: const EdgeInsets.only(bottom: 10),
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color:
                      bgColor ?? Theme.of(context).appBarTheme.backgroundColor,
                  borderRadius: appBarRadius == null
                      ? null
                      : BorderRadius.vertical(
                          bottom: Radius.circular(appBarRadius ?? 0)),
                ),
                child: titleWidget),
          ),
        ),
        Positioned(
          top: positionTop ?? 80.0,
          bottom: positionBottom,
          left: positionLeft ?? 0.0,
          right: positionRight ?? 0.0,
          child: AppCircleAvatar(
            img: img,
            imageSource: imageSource,
            backgroundColor: imgBgColor,
            radius: imgRadius,
          ),
        ),
      ],
    );
  }
}
