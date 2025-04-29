import 'package:flutter/material.dart';
import 'package:reusable_app_bar/views/app_bars/normal_app_bar.dart';
import 'package:text_field_builder/text_field_builder.dart';

class SearchFieldTopTitleBuilder extends StatelessWidget {
  const SearchFieldTopTitleBuilder({
    super.key,
    this.titleTxt,
    this.hasLeading = true,
    this.searchField,
    this.centerTitle,
    this.fieldModel,
  });

  final String? titleTxt;
  final bool? centerTitle;
  final bool hasLeading;
  final FieldModel? fieldModel;

  final Widget? searchField;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: centerTitle ?? false
          ? CrossAxisAlignment.center
          : CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: hasLeading ? 10.0 : 4),
          // child: Text(titleTxt ?? "", style: AppTxtStyles.kTitleWhite),
          child: NormalAppBar(
            titleTxt: titleTxt,
            centerTitle: centerTitle,
          ),
        ),
        if (searchField != null)
          searchField!
        else
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: AppSearchField(
              fieldModel: fieldModel,
            ),
          ),
      ],
    );
  }
}
