import 'package:flutter/material.dart';
import 'package:text_field_builder/text_field_builder.dart';

class SearchableAppBar extends StatelessWidget implements PreferredSizeWidget {
  const SearchableAppBar({
    super.key,
    this.hintTxt,
    this.bgColor,
    this.searchField,
    this.leadingWidget,
    this.actionsList,
    this.willShowBackArrow = true,
    this.leadingWidth,
    this.searchController,
    this.onChanged,
    this.onTapClearIcon,
  });

  final String? hintTxt;
  final Color? bgColor;
  final Widget? searchField;
  final Widget? leadingWidget;
  final List<Widget>? actionsList;
  final bool willShowBackArrow;
  final double? leadingWidth;

  final TextEditingController? searchController;
  final ValueChanged<String>? onChanged;
  final VoidCallback? onTapClearIcon;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: willShowBackArrow,
      backgroundColor: bgColor,
      leading: leadingWidget,
      leadingWidth: leadingWidth,
      actions: actionsList,
      title: Padding(
        padding: const EdgeInsets.only(left: 8.0),
        child:
            searchField ??
            AppSearchField(
              fieldModel: FieldModel(
                hintText: hintTxt ?? 'Search',
                controller: searchController,
                onChanged: onChanged,
                onTapSuffixIcon: onTapClearIcon,
              ),
            ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
