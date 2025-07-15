import 'package:flutter/material.dart';

import 'search_field_toggle_builder.dart';

class SearchIconAppBar extends AppBar {
  final String? titleTxt;
  final TextStyle? titleTxtStyle;
  final Widget? searchField;
  final String? hintTxt;
  final TextEditingController? searchController;
  final ValueChanged<String>? onChanged;
  final VoidCallback? onTapClearIcon;
  final Color? bgColor;
  final Widget? titleWidget;
  final Widget? leadingWidget;
  final List<Widget>? actionsList;
  final bool? willShowBackArrow;
  @override
  final bool? centerTitle;
  @override
  final double? leadingWidth;

  SearchIconAppBar({
    super.key,
    this.titleTxt,
    this.titleTxtStyle,
    this.searchField,
    this.hintTxt,
    this.searchController,
    this.onChanged,
    this.onTapClearIcon,
    this.bgColor,
    this.titleWidget,
    this.leadingWidget,
    this.actionsList,
    this.willShowBackArrow,
    this.centerTitle,
    this.leadingWidth,
  }) : super(
         title: SearchFieldToggleBuilder(
           titleTxt: titleTxt,
           titleTxtStyle: titleTxtStyle,
           searchField: searchField,
           hintTxt: hintTxt,
           searchController: searchController,
           onChanged: onChanged,
           onTapClearIcon: onTapClearIcon,
         ),
         centerTitle: centerTitle ?? true,
         leadingWidth: leadingWidth,
         leading: leadingWidget,
         actions: actionsList,
         backgroundColor: bgColor,
         automaticallyImplyLeading: willShowBackArrow ?? true,
       );
}
