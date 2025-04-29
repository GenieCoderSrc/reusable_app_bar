import 'package:flutter/material.dart';
import 'package:text_field_builder/text_field_builder.dart';

class SearchableAppBar extends AppBar {
  final String? hintTxt;
  final Color? bgColor;
  final Widget? searchField;
  final Widget? leadingWidget;
  final List<Widget>? actionsList;
  final bool? willShowBackArrow;
  final Widget? leading;
  @override
  final double? leadingWidth;
  final TextEditingController? searchController;
  final ValueChanged<String>? onChanged;
  final VoidCallback? onTapClearIcon;

  @override
  SearchableAppBar({this.leading,
      this.hintTxt,

      this.bgColor,
      this.searchField,
      this.leadingWidget,
      this.actionsList,
      this.willShowBackArrow,
      this.leadingWidth,
      this.searchController,
      this.onChanged,
      this.onTapClearIcon,
      super.key})
      : super(
          title: Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: searchField ??
                AppSearchField(
                  fieldModel: FieldModel(
                    hintText: hintTxt ?? 'Search',
                    controller: searchController,
                    onChanged: onChanged,
                    onTapSuffixIcon: onTapClearIcon,
                  ),
                ),
          ),
          leadingWidth: leadingWidth,
          leading: leadingWidget,
          actions: actionsList,
          backgroundColor: bgColor,
          automaticallyImplyLeading: willShowBackArrow ?? true,
        );
}
