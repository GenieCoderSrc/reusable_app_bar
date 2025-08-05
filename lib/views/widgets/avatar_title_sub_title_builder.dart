import 'package:flutter/material.dart';
import 'package:reusable_image_widget/reusable_image_widget.dart';

class ProfileHeader extends StatelessWidget {
  const ProfileHeader({
    super.key,
    this.imageSource,
    this.imgBgColor,
    this.avatarRadius = 20,
    this.titleTxt,
    this.titleTxtStyle,
    this.subTitleTxt,
    this.subTitleTxtStyle,
    this.titleWidget,
    this.subTitleWidget,
    this.centerTitle = false,
    this.padding,
    this.textColor = Colors.white,
  });

  /// Avatar image from URL or path (optional).
  final String? imageSource;

  /// Background color for the avatar.
  final Color? imgBgColor;

  /// Radius for the avatar image.
  final double avatarRadius;

  /// Optional title string.
  final String? titleTxt;

  /// Optional subtitle string.
  final String? subTitleTxt;

  /// Custom text style for title.
  final TextStyle? titleTxtStyle;

  /// Custom text style for subtitle.
  final TextStyle? subTitleTxtStyle;

  /// Custom widget to override title.
  final Widget? titleWidget;

  /// Custom widget to override subtitle.
  final Widget? subTitleWidget;

  /// Whether to center the row.
  final bool centerTitle;

  /// Padding around the whole widget.
  final EdgeInsetsGeometry? padding;

  /// Text color if no custom style is provided.
  final Color textColor;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Padding(
      padding: padding ?? const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: centerTitle
            ? MainAxisAlignment.center
            : MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          if (imageSource != null)
            AppAvatar(
              imageSource: imageSource,
              backgroundColor: imgBgColor,
              radius: avatarRadius,
            ),
          const SizedBox(width: 8.0),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              titleWidget ??
                  Text(
                    titleTxt ?? '',
                    style:
                        titleTxtStyle ??
                        theme.textTheme.titleMedium?.copyWith(
                          color: textColor,
                          fontWeight: FontWeight.w600,
                        ),
                  ),
              if (subTitleWidget != null ||
                  (subTitleTxt != null && subTitleTxt!.isNotEmpty))
                subTitleWidget ??
                    Text(
                      subTitleTxt!,
                      style:
                          subTitleTxtStyle ??
                          theme.textTheme.bodySmall?.copyWith(
                            color: textColor.withAlpha((0.8 * 255).round()),
                          ),
                    ),
            ],
          ),
        ],
      ),
    );
  }
}

// class AvatarTitleSubTitleBuilder extends StatelessWidget {
//   const AvatarTitleSubTitleBuilder({
//     super.key,
//     this.pickedFile,
//     this.imageSource,
//     this.imgBgColor,
//     this.avatarRadius,
//     this.titleTxt,
//     this.titleTxtStyle,
//     this.subTitleTxt,
//     this.subTitleTxtStyle,
//     this.titleWidget,
//     this.subTitleWidget,
//     this.centerTitle = false,
//     this.padding,
//   });
//
//   final XFile? pickedFile;
//   final String? imageSource;
//   final Color? imgBgColor;
//   final double? avatarRadius;
//   final EdgeInsetsGeometry? padding;
//
//   final String? titleTxt;
//   final TextStyle? titleTxtStyle;
//
//   final String? subTitleTxt;
//   final TextStyle? subTitleTxtStyle;
//
//   final Widget? titleWidget;
//   final Widget? subTitleWidget;
//
//   final bool centerTitle;
//
//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: padding ?? const EdgeInsets.all(8.0),
//       // padding: padding ?? const EdgeInsets.all(16.0),
//       child: Row(
//         mainAxisAlignment:
//             centerTitle ? MainAxisAlignment.center : MainAxisAlignment.start,
//         children: [
//           if (pickedFile != null || imageSource != null)
//             AppAvatar(
//               pickedFile: pickedFile,
//               imageSource: imageSource,
//               backgroundColor: imgBgColor,
//               radius: avatarRadius ?? 20,
//             ),
//           const SizedBox(width: 8.0),
//           Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               titleWidget ??
//                   Text(
//                     titleTxt ?? '',
//                     style:
//                         titleTxtStyle ??
//                         AppTxtStyles.kTitleTextStyle20.copyWith(
//                           color: Colors.white,
//                         ),
//                   ),
//               subTitleWidget ??
//                   Text(
//                     subTitleTxt ?? '',
//                     style:
//                         subTitleTxtStyle ??
//                         AppTxtStyles.kSmallSubTitleTextStyle.copyWith(
//                           color: Colors.white,
//                         ),
//                   ),
//             ],
//           ),
//         ],
//       ),
//     );
//   }
// }
