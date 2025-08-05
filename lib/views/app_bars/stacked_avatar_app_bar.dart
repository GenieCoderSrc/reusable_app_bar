import 'package:flutter/material.dart';
import 'package:reusable_image_widget/reusable_image_widget.dart';

class StackedAvatarAppBar extends StatelessWidget
    implements PreferredSizeWidget {
  const StackedAvatarAppBar({
    super.key,
    this.title,
    this.titleStyle,
    this.titleWidget,
    this.leading,
    this.actions,
    this.showBackArrow = true,
    this.centerTitle = true,
    this.leadingWidth,
    this.backgroundColor,
    this.borderRadius,
    this.height = 120.0,
    this.imageSource,
    this.imgBgColor,
    this.imgRadius = 36.0,
    this.avatarTop = 80.0,
    this.avatarLeft,
    this.avatarRight,
    this.avatarBottom,
    this.isCenterAvatar = true,
    this.isCircleAvatar = true,
  });

  final String? title;
  final TextStyle? titleStyle;
  final Widget? titleWidget;
  final Widget? leading;
  final List<Widget>? actions;
  final bool showBackArrow;
  final bool centerTitle;
  final double? leadingWidth;

  final Color? backgroundColor;
  final double? borderRadius;
  final double height;

  final String? imageSource;
  final Color? imgBgColor;
  final double imgRadius;

  final double? avatarTop;
  final double? avatarBottom;
  final double? avatarLeft;
  final double? avatarRight;

  final bool isCenterAvatar;
  final bool isCircleAvatar;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Stack(
      children: [
        AppBar(
          elevation: 0,
          automaticallyImplyLeading: showBackArrow,
          leading: leading,
          leadingWidth: leadingWidth,
          actions: actions,
          centerTitle: centerTitle,
          backgroundColor: Colors.transparent,
          flexibleSpace: Container(
            height: height,
            width: double.infinity,
            padding: const EdgeInsets.only(bottom: 10),
            decoration: BoxDecoration(
              color: backgroundColor ?? theme.appBarTheme.backgroundColor,
              borderRadius: borderRadius != null
                  ? BorderRadius.vertical(
                      bottom: Radius.circular(borderRadius!),
                    )
                  : null,
            ),
            child: Center(
              child:
                  titleWidget ??
                  Text(
                    title ?? '',
                    style:
                        titleStyle ??
                        theme.textTheme.titleLarge?.copyWith(
                          color: Colors.white,
                        ),
                    textAlign: TextAlign.center,
                  ),
            ),
          ),
        ),
        if (imageSource != null)
          Positioned(
            top: avatarTop,
            bottom: avatarBottom,
            left: isCenterAvatar ? null : avatarLeft ?? 0.0,
            right: isCenterAvatar ? null : avatarRight,
            child: Align(
              alignment: isCenterAvatar
                  ? Alignment.topCenter
                  : Alignment.topLeft,
              child: AppAvatar(
                imageSource: imageSource,
                backgroundColor: imgBgColor,
                radius: imgRadius,
                isCircle: isCircleAvatar,
              ),
            ),
          ),
      ],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(height);
}
