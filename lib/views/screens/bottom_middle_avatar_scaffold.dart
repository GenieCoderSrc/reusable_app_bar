import 'dart:io';

import 'package:flutter/material.dart';

class BottomMiddleAvatarScaffold extends StatelessWidget {
  const BottomMiddleAvatarScaffold(
      {super.key,
      this.leading,
      this.actionsList,
      this.body,
      this.titleTxt,
      this.centerTitle = true,
      this.height,
      this.childHeight,
      this.bgColor,
      this.appBarRadius,
      this.img,
      this.imageSource,
      this.imgBgColor,
      this.imgRadius,
      this.avatarPositionTop,
      this.positionWidget,
      this.drawer,
      this.bgImageSource,
      this.bodyPositionTop,
      this.bgImageOpacity});

  final Widget? leading;
  final List<Widget>? actionsList;
  final Widget? drawer;
  final String? titleTxt;
  final bool? centerTitle;
  final double? height;
  final double? childHeight;

  final Color? bgColor;
  final double? appBarRadius;
  final String? bgImageSource;
  final double? bgImageOpacity;

  final File? img;
  final String? imageSource;
  final Color? imgBgColor;
  final double? imgRadius;
  final double? avatarPositionTop;

  final Widget? positionWidget;

  final Widget? body;
  final double? bodyPositionTop;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      drawer: drawer,
      appBar: AppBar(
        title: Text(titleTxt ?? ""),
        centerTitle: centerTitle,
        leading: leading,
        actions: actionsList,
        backgroundColor: Colors.transparent,
        elevation: 0.0,
      ),
      body: Stack(
        alignment: Alignment.bottomCenter,
        clipBehavior: Clip.none,
        children: <Widget>[
          Row(
            children: <Widget>[
              Expanded(
                child: Container(
                  height: 150.0,
                  decoration: BoxDecoration(
                    color: bgColor ??
                        Theme.of(context).appBarTheme.backgroundColor,
                    image: bgImageSource != null
                        ? DecorationImage(
                            opacity: bgImageOpacity ?? 0.1,
                            fit: BoxFit.cover,
                            image: NetworkImage(bgImageSource!),
                          )
                        : null,
                    borderRadius: appBarRadius == null
                        ? null
                        : BorderRadius.vertical(
                            bottom: Radius.circular(appBarRadius ?? 20),
                          ),
                  ),
                ),
              ),
            ],
          ),
          // Positioned(
          //   top: avatarPositionTop ?? 100.0,
          //   child: positionWidget ??
          //       Container(
          //         decoration: BoxDecoration(
          //           shape: BoxShape.circle,
          //           border: Border.all(color: Colors.white, width: 6.0),
          //         ),
          //         child: AppCircleAvatar(
          //           img: img,
          //           imageSource: imageSource,
          //           radius: imgRadius,
          //         ),
          //       ),
          // ),
          if (body != null)
            Positioned(
              top: bodyPositionTop ?? 210.0,
              left:
                  0, // Position the body widget in a specific location within the Stack
              right: 0,
              child: body!,
              // child: ConstrainedBox(
              //   constraints: BoxConstraints(
              //     maxHeight: MediaQuery.of(context).size.height -
              //         (bodyPositionTop ??
              //             210.0), // Ensure the body widget does not overflow
              //   ),
              //   child: body,
              // ),
            ),
        ],
      ),
    );
  }
}

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
