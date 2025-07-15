import 'package:flutter/material.dart';
import 'package:reusable_image_widget/reusable_image_widget.dart';

class BottomMiddleAvatarScaffold extends StatelessWidget {
  const BottomMiddleAvatarScaffold({
    super.key,
    this.title,
    this.titleStyle,
    this.leading,
    this.actions,
    this.centerTitle = true,
    this.drawer,
    this.appBarHeight = 150.0,
    this.appBarColor,
    this.appBarRadius = 24.0,
    this.bgImage,
    this.bgImageOpacity = 0.1,
    this.avatarImage,
    this.avatarRadius = 36.0,
    this.avatarBgColor,
    this.body,
    this.bodyTop = 210.0,
    this.avatarTop = 100.0,
    this.showAvatar = true,
  });

  // AppBar-related
  final String? title;
  final TextStyle? titleStyle;
  final Widget? leading;
  final List<Widget>? actions;
  final bool centerTitle;
  final Widget? drawer;

  final double appBarHeight;
  final Color? appBarColor;
  final double appBarRadius;

  final String? bgImage;
  final double bgImageOpacity;

  // Avatar-related
  final String? avatarImage;
  final Color? avatarBgColor;
  final double avatarRadius;
  final double avatarTop;
  final bool showAvatar;

  // Body
  final Widget? body;
  final double bodyTop;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      drawer: drawer,
      appBar: AppBar(
        title: Text(title ?? '', style: titleStyle),
        centerTitle: centerTitle,
        leading: leading,
        actions: actions,
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: Stack(
        clipBehavior: Clip.none,
        children: [
          _buildAppBarBackground(context),
          if (showAvatar && avatarImage != null) _buildAvatar(context),
          if (body != null) _buildBody(),
        ],
      ),
    );
  }

  Widget _buildAppBarBackground(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      height: appBarHeight,
      width: double.infinity,
      decoration: BoxDecoration(
        color: appBarColor ?? theme.appBarTheme.backgroundColor,
        image:
            bgImage != null
                ? DecorationImage(
                  image: NetworkImage(bgImage!),
                  fit: BoxFit.cover,
                  opacity: bgImageOpacity,
                )
                : null,
        borderRadius: BorderRadius.vertical(
          bottom: Radius.circular(appBarRadius),
        ),
      ),
    );
  }

  Widget _buildAvatar(BuildContext context) {
    return Positioned(
      top: avatarTop,
      left: MediaQuery.of(context).size.width / 2 - avatarRadius,
      child: AppAvatar(
        imageSource: avatarImage,
        radius: avatarRadius,
        backgroundColor: avatarBgColor,
      ),
    );
  }

  Widget _buildBody() {
    return Positioned(top: bodyTop, left: 0, right: 0, child: body!);
  }
}

// class BottomMiddleAvatarScaffold extends StatelessWidget {
//   const BottomMiddleAvatarScaffold(
//       {super.key,
//       this.leading,
//       this.actionsList,
//       this.body,
//       this.titleTxt,
//       this.centerTitle = true,
//       this.height,
//       this.childHeight,
//       this.bgColor,
//       this.appBarRadius,
//       this.imageSource,
//       this.imgBgColor,
//       this.imgRadius,
//       this.avatarPositionTop,
//       this.positionWidget,
//       this.drawer,
//       this.bgImageSource,
//       this.bodyPositionTop,
//       this.bgImageOpacity});
//
//   final Widget? leading;
//   final List<Widget>? actionsList;
//   final Widget? drawer;
//   final String? titleTxt;
//   final bool? centerTitle;
//   final double? height;
//   final double? childHeight;
//
//   final Color? bgColor;
//   final double? appBarRadius;
//   final String? bgImageSource;
//   final double? bgImageOpacity;
//
//   final String? imageSource;
//   final Color? imgBgColor;
//   final double? imgRadius;
//   final double? avatarPositionTop;
//
//   final Widget? positionWidget;
//
//   final Widget? body;
//   final double? bodyPositionTop;
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       extendBodyBehindAppBar: true,
//       drawer: drawer,
//       appBar: AppBar(
//         title: Text(titleTxt ?? ""),
//         centerTitle: centerTitle,
//         leading: leading,
//         actions: actionsList,
//         backgroundColor: Colors.transparent,
//         elevation: 0.0,
//       ),
//       body: Stack(
//         alignment: Alignment.bottomCenter,
//         clipBehavior: Clip.none,
//         children: <Widget>[
//           Row(
//             children: <Widget>[
//               Expanded(
//                 child: Container(
//                   height: 150.0,
//                   decoration: BoxDecoration(
//                     color: bgColor ??
//                         Theme.of(context).appBarTheme.backgroundColor,
//                     image: bgImageSource != null
//                         ? DecorationImage(
//                             opacity: bgImageOpacity ?? 0.1,
//                             fit: BoxFit.cover,
//                             image: NetworkImage(bgImageSource!),
//                           )
//                         : null,
//                     borderRadius: appBarRadius == null
//                         ? null
//                         : BorderRadius.vertical(
//                             bottom: Radius.circular(appBarRadius ?? 20),
//                           ),
//                   ),
//                 ),
//               ),
//             ],
//           ),
//           // Positioned(
//           //   top: avatarPositionTop ?? 100.0,
//           //   child: positionWidget ??
//           //       Container(
//           //         decoration: BoxDecoration(
//           //           shape: BoxShape.circle,
//           //           border: Border.all(color: Colors.white, width: 6.0),
//           //         ),
//           //         child: AppCircleAvatar(
//           //           img: img,
//           //           imageSource: imageSource,
//           //           radius: imgRadius,
//           //         ),
//           //       ),
//           // ),
//           if (body != null)
//             Positioned(
//               top: bodyPositionTop ?? 210.0,
//               left:
//                   0, // Position the body widget in a specific location within the Stack
//               right: 0,
//               child: body!,
//               // child: ConstrainedBox(
//               //   constraints: BoxConstraints(
//               //     maxHeight: MediaQuery.of(context).size.height -
//               //         (bodyPositionTop ??
//               //             210.0), // Ensure the body widget does not overflow
//               //   ),
//               //   child: body,
//               // ),
//             ),
//         ],
//       ),
//     );
//   }
// }

//
// return Scaffold(
//      extendBodyBehindAppBar: true,
//      drawer: drawer,
//      appBar: AppBar(
//        title: Text(titleTxt ?? ""),
//        centerTitle: centerTitle,
//        leading: leading,
//        actions: actionsList,
//        backgroundColor: Colors.transparent,
//        elevation: 0.0,
//      ),
//      body: Stack(
//        alignment: Alignment.bottomCenter,
//        clipBehavior: Clip.none,
//        children: <Widget>[
//          Row(
//            children: <Widget>[
//              Expanded(
//                child: Container(
//                  height: 150.0,
//                  decoration: BoxDecoration(
//                    color: bgColor ??
//                        Theme.of(context).appBarTheme.backgroundColor,
//                    image: bgImageSource != null
//                        ? DecorationImage(
//                            opacity: bgImageOpacity ?? 0.1,
//                            fit: BoxFit.cover,
//                            image: NetworkImage(bgImageSource!))
//                        : null,
//                    borderRadius: appBarRadius == null
//                        ? null
//                        : BorderRadius.vertical(
//                            bottom: Radius.circular(appBarRadius ??
//                                20), // Adjust the radius as needed
//                          ),
//                  ),
//                ),
//              )
//            ],
//          ),
//          Positioned(
//            top: avatarPositionTop ?? 100.0,
//            child: positionWidget ??
//                Container(
//                  decoration: BoxDecoration(
//                      shape: BoxShape.circle,
//                      border: Border.all(color: Colors.white, width: 6.0)),
//                  child: AppCircleAvatar(
//                    img: img,
//                    imageSource: imageSource,
//                    radius: imgRadius,
//                  ),
//                ),
//          ),
//          if (body != null)
//            // SingleChildScrollView(child: )
//            Positioned(
//              top: bodyPositionTop ?? 210.0,
//              child: body!,
//            ),
//        ],
//      ),
//    );
