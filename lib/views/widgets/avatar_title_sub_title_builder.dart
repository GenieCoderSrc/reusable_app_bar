import 'dart:io';

import 'package:flutter/material.dart';
import 'package:app_style/app_style.dart';
import 'package:reusable_image_widget/app_circle_avatar.dart';


class AvatarTitleSubTitleBuilder extends StatelessWidget {
  const AvatarTitleSubTitleBuilder({
    super.key,
    this.img,
    this.imageSource,
    this.imgBgColor,
    this.avatarRadius,
    this.titleTxt,
    this.titleTxtStyle,
    this.subTitleTxt,
    this.subTitleTxtStyle,
    this.titleWidget,
    this.subTitleWidget,
    this.centerTitle = false,
    this.padding,
  });

  final File? img;
  final String? imageSource;
  final Color? imgBgColor;
  final double? avatarRadius;
  final EdgeInsetsGeometry? padding;

  final String? titleTxt;
  final TextStyle? titleTxtStyle;

  final String? subTitleTxt;
  final TextStyle? subTitleTxtStyle;

  final Widget? titleWidget;
  final Widget? subTitleWidget;

  final bool centerTitle;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding ?? const EdgeInsets.all(8.0),
      // padding: padding ?? const EdgeInsets.all(16.0),
      child: Row(
        mainAxisAlignment:
            centerTitle ? MainAxisAlignment.center : MainAxisAlignment.start,
        children: [
          if (img != null || imageSource != null)
            AppCircleAvatar(
              img: img,
              imageSource: imageSource,
              backgroundColor: imgBgColor,
              radius: avatarRadius ?? 20,
            ),
          const SizedBox(width: 8.0),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              titleWidget ??
                  Text(titleTxt ?? '',
                      style: titleTxtStyle ??
                          AppTxtStyles.kTitleTextStyle20
                              .copyWith(color: Colors.white)),
              subTitleWidget ??
                  Text(subTitleTxt ?? '',
                      style: subTitleTxtStyle ??
                          AppTxtStyles.kSmallSubTitleTextStyle
                              .copyWith(color: Colors.white))
            ],
          ),
        ],
      ),
    );
  }
}
