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
    this.bottomWidgetPadding = const EdgeInsets.symmetric(
      horizontal: 16.0,
      vertical: 8.0,
    ),
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

  /// Optional custom padding around the search field.
  final EdgeInsetsGeometry bottomWidgetPadding;

  @override
  Widget build(BuildContext context) {
    return StackedAppBar(
      title: titleTxt,
      titleStyle: titleTxtStyle,
      backgroundColor: bgColor,
      titleWidget: titleWidget,
      leading: leading,
      actions: actionsList,
      showBackArrow: willShowBackArrow ?? true,
      centerTitle: centerTitle ?? true,
      leadingWidth: leadingWidth,
      borderRadius: appBarRadius,
      height: height ?? 120.0,
      overlayWidget: Padding(
        padding: bottomWidgetPadding,
        child: AppSearchField(fieldModel: fieldModel),
      ),
    );
  }
}
