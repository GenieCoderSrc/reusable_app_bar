import 'package:flutter/material.dart';
import 'package:reusable_app_bar/views/widgets/avatar_title_sub_title_builder.dart';
import 'package:text_field_builder/text_field_builder.dart';

class SearchableTopTitleSubTitleProfileAppBar extends StatelessWidget
    implements PreferredSizeWidget {
  const SearchableTopTitleSubTitleProfileAppBar({
    super.key,
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
    this.willShowBackArrow = true,
    this.leadingWidth,
    this.appBarRadius,
    this.searchField,
    this.elevation,
    this.fieldModel,
    this.hasLeading = true,
  });

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

  final bool willShowBackArrow;
  final double? leadingWidth;
  final double? appBarRadius;
  final bool hasLeading;

  final Widget? searchField;
  final double? elevation;

  final FieldModel? fieldModel;

  @override
  Widget build(BuildContext context) {
    final double horizontalPadding = hasLeading ? 30.0 : 4.0;

    return AppBar(
      backgroundColor:
          imgBgColor ?? Theme.of(context).appBarTheme.backgroundColor,
      elevation: elevation ?? 0,
      leading: willShowBackArrow ? leadingWidget ?? BackButton() : null,
      leadingWidth: leadingWidth,
      actions: actionsList,
      shape:
          appBarRadius != null
              ? RoundedRectangleBorder(
                borderRadius: BorderRadius.vertical(
                  bottom: Radius.circular(appBarRadius!),
                ),
              )
              : null,
      flexibleSpace: SafeArea(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
                child: ProfileHeader(
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
              ),
              const SizedBox(height: 8),
              if (searchField != null)
                searchField!
              else
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16.0),
                  child: AppSearchField(
                    fieldModel: fieldModel?.copyWith(
                      hintText: fieldModel?.hintText ?? 'Search',
                      radius:
                          fieldModel?.radius ??
                          TextFieldBorderRadius.fullRadius,
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight + 120);
}
