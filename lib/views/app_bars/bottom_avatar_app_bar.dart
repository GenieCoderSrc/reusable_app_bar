import 'package:flutter/material.dart';
import 'package:reusable_image_widget/reusable_image_widget.dart';

class BottomAvatarAppBar extends StatelessWidget
    implements PreferredSizeWidget {
  const BottomAvatarAppBar({
    super.key,
    this.titleTxt,
    this.titleTxtStyle,
    this.bgColor,
    this.titleWidget,
    this.leadingWidget,
    this.actions,
    this.showBackArrow = true,
    this.centerTitle = true,
    this.leadingWidth,
    this.borderRadius,
    this.height = 120.0,
    this.avatarImage,
    this.avatarBgColor,
    this.avatarRadius = 36.0,
    this.avatarTop = 80.0,
    this.avatarLeft,
    this.avatarRight,
    this.avatarBottom,
    this.isCenterAvatar = true,
    this.isCircleAvatar = true,
  });

  /// Text displayed as title if [titleWidget] is not provided.
  final String? titleTxt;

  /// Optional custom widget as title.
  final Widget? titleWidget;

  /// Style for the title text.
  final TextStyle? titleTxtStyle;

  /// Background color of the app bar.
  final Color? bgColor;

  /// Leading widget like back button or icon.
  final Widget? leadingWidget;

  /// Action widgets displayed at the end.
  final List<Widget>? actions;

  /// Whether to automatically show back arrow.
  final bool showBackArrow;

  /// Whether to center the title.
  final bool centerTitle;

  /// Width of the leading widget.
  final double? leadingWidth;

  /// Border radius for the bottom of the app bar.
  final double? borderRadius;

  /// Height of the app bar.
  final double height;

  /// Avatar image source (network, asset, etc.).
  final String? avatarImage;

  /// Avatar background color.
  final Color? avatarBgColor;

  /// Radius of the avatar.
  final double avatarRadius;

  /// Avatar position from top in the stack.
  final double? avatarTop;

  /// Avatar position from left in the stack.
  final double? avatarLeft;

  /// Avatar position from right in the stack.
  final double? avatarRight;

  /// Avatar position from bottom in the stack.
  final double? avatarBottom;

  /// Whether to horizontally center the avatar.
  final bool isCenterAvatar;

  /// Whether avatar should be circular.
  final bool isCircleAvatar;

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);

    return Stack(
      children: [
        AppBar(
          elevation: 0,
          automaticallyImplyLeading: showBackArrow,
          leading: leadingWidget,
          leadingWidth: leadingWidth,
          actions: actions,
          centerTitle: centerTitle,
          backgroundColor: Colors.transparent,
          flexibleSpace: Container(
            height: height,
            width: double.infinity,
            padding: const EdgeInsets.only(bottom: 10),
            decoration: BoxDecoration(
              color: bgColor ?? theme.appBarTheme.backgroundColor,
              borderRadius:
                  borderRadius != null
                      ? BorderRadius.vertical(
                        bottom: Radius.circular(borderRadius!),
                      )
                      : null,
            ),
            child: Center(
              child:
                  titleWidget ??
                  Text(
                    titleTxt ?? '',
                    style:
                        titleTxtStyle ??
                        theme.textTheme.titleLarge?.copyWith(
                          color: Colors.white,
                        ),
                    textAlign: TextAlign.center,
                  ),
            ),
          ),
        ),
        if (avatarImage != null)
          Positioned(
            top: avatarTop,
            bottom: avatarBottom,
            left: isCenterAvatar ? null : avatarLeft ?? 0.0,
            right: isCenterAvatar ? null : avatarRight,
            child: Align(
              alignment:
                  isCenterAvatar ? Alignment.topCenter : Alignment.topLeft,
              child: AppAvatar(
                imageSource: avatarImage,
                backgroundColor: avatarBgColor,
                radius: avatarRadius,
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

// class BottomMiddleAvatarAppBar extends StatelessWidget {
//   const BottomMiddleAvatarAppBar({
//     super.key,
//     this.titleTxt,
//     this.titleTxtStyle,
//     this.bgColor,
//     this.titleWidget,
//     this.leadingWidget,
//     this.actionsList,
//     this.willShowBackArrow,
//     this.centerTitle = true,
//     this.leadingWidth,
//     this.appBarRadius,
//     this.height,
//     this.bottomWidget,
//     this.positionTop,
//     this.positionBottom,
//     this.positionLeft,
//     this.positionRight,
//     this.imageSource,
//     this.img,
//     this.imgBgColor,
//     this.imgRadius,
//   });
//
//   final String? titleTxt;
//   final TextStyle? titleTxtStyle;
//   final Color? bgColor;
//   final Widget? titleWidget;
//   final Widget? leadingWidget;
//   final List<Widget>? actionsList;
//   final bool? willShowBackArrow;
//   final bool? centerTitle;
//   final double? leadingWidth;
//   final double? appBarRadius;
//   final double? height;
//
//   final Widget? bottomWidget;
//
//   final double? positionTop;
//   final double? positionBottom;
//   final double? positionLeft;
//   final double? positionRight;
//
//   final File? img;
//   final String? imageSource;
//   final Color? imgBgColor;
//   final double? imgRadius;
//
//   @override
//   Widget build(BuildContext context) {
//     return Stack(
//       children: [
//         AppBar(
//           leadingWidth: leadingWidth,
//           leading: leadingWidget,
//           actions: actionsList,
//           centerTitle: centerTitle,
//           automaticallyImplyLeading: willShowBackArrow ?? true,
//           // backgroundColor: Colors.red,
//
//           // backgroundColor: Colors.transparent,
//           backgroundColor: theme.scaffoldBackgroundColor,
//           title: Text(titleTxt ?? ""),
//           flexibleSpace: SizedBox(
//             height: height ?? 120.0,
//             child: Container(
//                 padding: const EdgeInsets.only(bottom: 10),
//                 width: MediaQuery.of(context).size.width,
//                 decoration: BoxDecoration(
//                   color:
//                       bgColor ?? theme.appBarTheme.backgroundColor,
//                   borderRadius: appBarRadius == null
//                       ? null
//                       : BorderRadius.vertical(
//                           bottom: Radius.circular(appBarRadius ?? 0)),
//                 ),
//                 child: titleWidget),
//           ),
//         ),
//         Positioned(
//           top: positionTop ?? 80.0,
//           bottom: positionBottom,
//           left: positionLeft ?? 0.0,
//           right: positionRight ?? 0.0,
//           child: AppAvatar(
//             pickedFile: img,
//             imageSource: imageSource,
//             backgroundColor: imgBgColor,
//             radius: imgRadius,
//           ),
//         ),
//       ],
//     );
//   }
// }

// class BottomAvatarAppBar extends StatelessWidget {
//   const BottomAvatarAppBar({
//     super.key,
//     this.title,
//     this.titleStyle,
//     this.titleWidget,
//     this.leading,
//     this.actions,
//     this.showBackArrow = true,
//     this.centerTitle = true,
//     this.leadingWidth,
//     this.appBarRadius,
//     this.height = 120.0,
//     this.imageSource,
//     this.imgBgColor,
//     this.imgRadius = 40.0,
//     this.avatarTop = 80.0,
//     this.avatarBottom,
//     this.avatarLeft,
//     this.avatarRight,
//     this.isCircleAvatar = true,
//     this.isCenterAvatar = true,
//   });
//
//   final String? title;
//   final TextStyle? titleStyle;
//   final Widget? titleWidget;
//
//   final Widget? leading;
//   final List<Widget>? actions;
//   final bool showBackArrow;
//   final bool centerTitle;
//   final double? leadingWidth;
//
//   final double? appBarRadius;
//   final double height;
//
//   final String? imageSource;
//   final Color? imgBgColor;
//   final double imgRadius;
//
//   final double avatarTop;
//   final double? avatarBottom;
//   final double? avatarLeft;
//   final double? avatarRight;
//
//   final bool isCircleAvatar;
//   final bool isCenterAvatar;
//
//   @override
//   Widget build(BuildContext context) {
//     final ThemeData theme = Theme.of(context);
//
//     return Stack(
//       children: [
//         AppBar(
//           leading: leading,
//           leadingWidth: leadingWidth,
//           actions: actions,
//           automaticallyImplyLeading: showBackArrow,
//           centerTitle: centerTitle,
//           backgroundColor: theme.scaffoldBackgroundColor,
//           title: title != null ? Text(title!, style: titleStyle) : null,
//           flexibleSpace: SizedBox(
//             height: height,
//             child: Container(
//               padding: const EdgeInsets.only(bottom: 10),
//               width: double.infinity,
//               decoration: BoxDecoration(
//                 color: theme.appBarTheme.backgroundColor,
//                 borderRadius: appBarRadius != null
//                     ? BorderRadius.vertical(
//                   bottom: Radius.circular(appBarRadius!),
//                 )
//                     : null,
//               ),
//               child: titleWidget,
//             ),
//           ),
//         ),
//         Positioned(
//           top: avatarTop,
//           bottom: avatarBottom,
//           left: isCenterAvatar ? null : (avatarLeft ?? 16.0),
//           right: isCenterAvatar ? null : avatarRight,
//           child: Align(
//             alignment:
//             isCenterAvatar ? Alignment.center : Alignment.centerLeft,
//             child: AppAvatar(
//               imageSource: imageSource,
//               backgroundColor: imgBgColor,
//               radius: imgRadius,
//               isCircle: isCircleAvatar,
//             ),
//           ),
//         ),
//       ],
//     );
//   }
// }
