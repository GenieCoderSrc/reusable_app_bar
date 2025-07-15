import 'package:flutter/material.dart';
import 'package:reusable_image_widget/reusable_image_widget.dart';

class RoundedProfileAvatarAppBar extends StatelessWidget
    implements PreferredSizeWidget {
  const RoundedProfileAvatarAppBar({
    super.key,
    required this.title,
    this.titleStyle,
    this.titleWidget,
    this.appBarHeight = 200.0,
    this.childHeight = 80.0,
    this.bgColor,
    this.leading,
    this.actions,
    this.imageSource,
    this.imgBgColor,
    this.imgRadius = 40.0,
  });

  final String title;
  final TextStyle? titleStyle;
  final Widget? titleWidget;

  /// Total app bar height
  final double appBarHeight;

  /// Vertical offset for profile avatar
  final double childHeight;

  final Color? bgColor;
  final Widget? leading;
  final List<Widget>? actions;

  final String? imageSource;
  final Color? imgBgColor;
  final double imgRadius;

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);

    return SizedBox(
      height: preferredSize.height,
      child: LayoutBuilder(
        builder: (context, constraints) {
          return Stack(
            children: [
              ClipPath(
                clipper: _RoundedAppBarClipper(),
                child: Container(
                  height: appBarHeight,
                  width: double.infinity,
                  color: bgColor ?? theme.appBarTheme.backgroundColor,
                  padding: const EdgeInsets.symmetric(horizontal: 12.0),
                  child: SafeArea(
                    bottom: false,
                    child: Row(
                      children: [
                        leading ??
                            Icon(
                              Icons.menu,
                              color:
                                  theme.appBarTheme.iconTheme?.color ??
                                  Colors.white,
                            ),
                        const Spacer(),
                        titleWidget ??
                            Text(
                              title,
                              style:
                                  titleStyle ??
                                  theme.textTheme.titleLarge?.copyWith(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w600,
                                  ),
                            ),
                        const Spacer(),
                        if (actions != null) ...actions!,
                      ],
                    ),
                  ),
                ),
              ),
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: AppAvatar(
                  imageSource: imageSource,
                  backgroundColor: imgBgColor,
                  radius: imgRadius,
                  isCircle: true,
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(appBarHeight + childHeight);
}

class _RoundedAppBarClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final Path path = Path();
    const double curveHeight = 40.0;

    path.moveTo(0, size.height - curveHeight);
    path.quadraticBezierTo(
      size.width / 2,
      size.height,
      size.width,
      size.height - curveHeight,
    );
    path.lineTo(size.width, 0);
    path.lineTo(0, 0);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => false;
}
