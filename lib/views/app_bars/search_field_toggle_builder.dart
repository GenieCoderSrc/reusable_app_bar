import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:text_field_builder/text_field_builder.dart';

import '../../view_models/search_field_cubit.dart';

class SearchFieldToggleBuilder extends StatelessWidget {
  const SearchFieldToggleBuilder({
    super.key,
    this.titleTxt,
    this.titleTxtStyle,
    this.searchField,
    this.hintTxt,
    this.searchController,
    this.onChanged,
    this.onTapClearIcon,
    this.fieldModel,
  });

  final String? titleTxt;
  final TextStyle? titleTxtStyle;
  final Widget? searchField;
  final String? hintTxt;
  final TextEditingController? searchController;
  final ValueChanged<String>? onChanged;
  final VoidCallback? onTapClearIcon;

  final FieldModel? fieldModel;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchFieldCubit, bool>(
      builder: (context, isSearching) {
        return isSearching
            ? Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child:
                    searchField ??
                    AppSearchField(
                      fieldModel: fieldModel?.copyWith(
                        hintText: fieldModel?.hintText ?? 'Search',
                      ),
                    ),
              )
            : Text(
                titleTxt ?? '',
                style: titleTxtStyle ?? const TextStyle(color: Colors.white),
              );
      },
    );
  }
}
