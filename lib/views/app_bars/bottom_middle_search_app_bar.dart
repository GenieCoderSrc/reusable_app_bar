import 'package:flutter/material.dart';
import 'package:text_field_builder/text_field_builder.dart';


import 'stacked_app_bar.dart';

class BottomMiddleSearchAppBar extends StatelessWidget {
  const BottomMiddleSearchAppBar({
    super.key,
    this.fieldModel,
    this.titleTxt,
    this.titleTxtStyle,
    this.bgColor,
    this.titleWidget,
    this.leading,
    this.actionsList,
    this.willShowBackArrow,
    this.centerTitle = true,
    this.leadingWidth,
    this.appBarRadius,
    this.height,
    this.bottomWidget,
  });

  final FieldModel? fieldModel;

  final String? titleTxt;
  final TextStyle? titleTxtStyle;
  final Color? bgColor;
  final Widget? titleWidget;
  final Widget? leading;
  final List<Widget>? actionsList;
  final bool? willShowBackArrow;
  final bool? centerTitle;
  final double? leadingWidth;
  final double? appBarRadius;
  final double? height;

  final Widget? bottomWidget;

  @override
  Widget build(BuildContext context) {
    return StackedAppBar(
      titleTxt: titleTxt,
      titleTxtStyle: titleTxtStyle,
      bgColor: bgColor,
      titleWidget: titleWidget,
      leadingWidget: leading,
      actionsList: actionsList,
      willShowBackArrow: willShowBackArrow,
      centerTitle: centerTitle,
      leadingWidth: leadingWidth,
      appBarRadius: appBarRadius,
      height: height,
      bottomWidget: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
        child: AppSearchField(fieldModel: fieldModel),
      ),
    );
  }
}
