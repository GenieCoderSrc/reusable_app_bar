import 'package:flutter/material.dart';
import 'package:text_field_builder/text_field_builder.dart';

class SearchableTitleAppBar extends StatelessWidget {
  const SearchableTitleAppBar({
    super.key,
    this.titleTxt,
    this.fieldModel,
    this.titleWidget,
    this.leadingWidget,
    this.actionsList,
    this.willShowBackArrow,
    this.leadingWidth,
    this.appBarRadius,
    this.searchField,
    this.bgColor,
    this.isTopSearch = true,
    this.centerTitle = true,
    this.elevation,
  });

  final String? titleTxt;
  final Widget? titleWidget;

  final Widget? leadingWidget;
  final double? leadingWidth;
  final List<Widget>? actionsList;

  final FieldModel? fieldModel;

  final Widget? searchField;
  final bool isTopSearch;
  final bool? centerTitle;

  final Color? bgColor;
  final bool? willShowBackArrow;
  final double? appBarRadius;
  final double? elevation;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: bgColor,
      elevation: elevation,
      leading: leadingWidget,
      actions: actionsList,
      title:
          isTopSearch
              ? AppSearchField(fieldModel: fieldModel)
              : Text(titleTxt ?? ""),
      bottom: PreferredSize(
        preferredSize: const Size.fromHeight(kToolbarHeight),
        child:
            isTopSearch
                ? Text(titleTxt ?? "")
                : AppSearchField(fieldModel: fieldModel),
      ),
      // flexibleSpace: isTitleTop
      //     ? SearchFieldTopTitleBuilder(
      //         titleTxt: titleTxt,
      //         imgBgColor: imgBgColor,
      //         bgColor: bgColor,
      //         titleWidget: titleWidget,
      //         leadingWidget: leadingWidget,
      //         actionsList: actionsList,
      //         willShowBackArrow: willShowBackArrow,
      //         fieldBgColor: fieldBgColor,
      //         leadingWidth: leadingWidth,
      //         appBarRadius: appBarRadius,
      //         hintText: hintText,
      //         searchController: searchController,
      //         fieldRadius: fieldRadius,
      //         hasLeading: hasLeading,
      //         onChanged: onChanged,
      //         onTapClearIcon: onTapClearIcon,
      //         searchField: searchField,
      //         elevation: elevation,
      //         centerTitle: centerTitle,
      //       )
      //     : SearchFieldTitleBuilder(
      //         titleTxt: titleTxt,
      //         imgBgColor: imgBgColor,
      //         bgColor: bgColor,
      //         titleWidget: titleWidget,
      //         leadingWidget: leadingWidget,
      //         actionsList: actionsList,
      //         willShowBackArrow: willShowBackArrow,
      //         fieldBgColor: fieldBgColor,
      //         leadingWidth: leadingWidth,
      //         appBarRadius: appBarRadius,
      //         hintText: hintText,
      //         searchController: searchController,
      //         fieldRadius: fieldRadius,
      //         hasLeading: hasLeading,
      //         onChanged: onChanged,
      //         onTapClearIcon: onTapClearIcon,
      //         searchField: searchField,
      //         elevation: elevation,
      //         centerTitle: centerTitle,
      //       ),
    );
  }
}
