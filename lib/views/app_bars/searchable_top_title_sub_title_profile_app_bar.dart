import 'dart:io';

import 'package:flutter/material.dart';
import 'package:reusable_app_bar/views/widgets/avatar_title_sub_title_builder.dart';
import 'package:text_field_builder/text_field_builder.dart';

class SearchableTopTitleSubTitleProfileAppBar extends StatelessWidget {
  const SearchableTopTitleSubTitleProfileAppBar({
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
    this.leadingWidget,
    this.actionsList,
    this.willShowBackArrow,
    this.leadingWidth,
    this.hasLeading = true,
    this.appBarRadius,
    this.searchField,
    this.elevation,
    this.fieldModel,
  });

  final File? img;
  final String? imageSource;
  final Color? imgBgColor;
  final double? avatarRadius;

  final String? titleTxt;
  final TextStyle? titleTxtStyle;

  final String? subTitleTxt;
  final TextStyle? subTitleTxtStyle;

  final Widget? titleWidget;
  final Widget? subTitleWidget;
  final Widget? leadingWidget;
  final List<Widget>? actionsList;
  final bool? willShowBackArrow;
  final double? leadingWidth;
  final double? appBarRadius;

  final bool hasLeading;

  final Widget? searchField;
  final double? elevation;

  final FieldModel? fieldModel;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: imgBgColor,
      elevation: elevation,
      leading: leadingWidget,
      actions: actionsList,
      flexibleSpace: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: hasLeading ? 30.0 : 4),
              child: AvatarTitleSubTitleBuilder(
                img: img,
                imageSource: imageSource,
                imgBgColor: imgBgColor,
                avatarRadius: avatarRadius,
                titleTxt: titleTxt,
                titleTxtStyle: titleTxtStyle,
                subTitleTxt: subTitleTxt,
                subTitleTxtStyle: subTitleTxtStyle,
                titleWidget: titleWidget,
                subTitleWidget: subTitleWidget,
              ),
            ),
            if (searchField != null)
              searchField!
            else
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                child: AppSearchField(
                  fieldModel: fieldModel?.copyWith(
                    hintText: fieldModel?.hintText ?? 'Search',
                    radius:
                        fieldModel?.radius ?? TextFieldBorderRadius.fullRadius,
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
