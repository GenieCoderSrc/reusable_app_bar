import 'dart:io';

import 'package:flutter/material.dart';
import 'package:reusable_icon/reusable_icon.dart';
import 'package:reusable_image_widget/reusable_image_widget.dart';

class BottomMiddleProfileRoundedAppBar extends StatelessWidget
    implements PreferredSizeWidget {
  final Widget? leading;
  final List<Widget>? actionsList;
  final Widget? child;
  final String titleTxt;
  final double? appBarHeight;
  final double childHeight;
  final Color? bgColor;
  final double? appBarRadius;

  final File? img;
  final String? imageSource;
  final Color? imgBgColor;
  final double? imgRadius;

  const BottomMiddleProfileRoundedAppBar({
    super.key,
    required this.titleTxt,
    this.appBarHeight = 200.0,
    this.childHeight = 200.0,
    // this.childHeight = 40.0,
    this.bgColor,
    this.leading,
    this.child,
    this.img,
    this.imageSource,
    this.imgBgColor,
    this.imgRadius,
    this.appBarRadius,
    this.actionsList,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox.fromSize(
      size: preferredSize,
      child: LayoutBuilder(
        builder: (context, constraint) {
          return Stack(
            children: <Widget>[
              ClipPath(
                clipper: _AppBarProfileClipper(),
                child: Container(
                  width: double.maxFinite,
                  height: preferredSize.height - childHeight,
                  color:
                      bgColor ?? Theme.of(context).appBarTheme.backgroundColor,
                  alignment: Alignment.topCenter,
                  child: Row(
                    children: <Widget>[
                      Expanded(
                          child: Container(
                        child: leading != null
                            ? leading!
                            : AppIcon(
                                Icons.menu,
                                color: Theme.of(context)
                                    .appBarTheme
                                    .iconTheme
                                    ?.color,
                              ),
                      )),
                      Text(
                        titleTxt,
                        style: Theme.of(context)
                            .textTheme
                            .titleLarge
                            ?.copyWith(color: Colors.white),
                      ),
                      Expanded(child: Container()),
                      ...?actionsList,
                      // IconButton(
                      //   icon: const Icon(
                      //     Icons.settings,
                      //     color: Colors.white,
                      //   ),
                      //   onPressed: () {},
                      // ),
                    ],
                  ),
                ),
              ),
              Positioned.fill(
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: AppCircleAvatar(
                    img: img,
                    imageSource: imageSource,
                    backgroundColor: imgBgColor,
                    radius: imgRadius,
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight + 300);
// Size.fromHeight(kToolbarHeight + (appBarHeight ?? 0));
}

class _AppBarProfileClipper extends CustomClipper<Path> {
  // final double? childHeight;

  // _AppBarProfileClipper(this.childHeight);

  @override
  Path getClip(Size size) {
    var path = Path();
    path.moveTo(0, size.height - 40.0);
    path.quadraticBezierTo(
        size.width / 2, size.height, size.width, size.height - 40.0);
    path.lineTo(size.width, 0);
    path.lineTo(0, 0);
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => true;
}
