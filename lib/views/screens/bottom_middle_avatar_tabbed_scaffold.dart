import 'package:flutter/material.dart';
import 'package:reusable_image_widget/reusable_image_widget.dart';

class BottomMiddleAvatarTabbedScaffold extends StatelessWidget {
  const BottomMiddleAvatarTabbedScaffold({
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
    this.avatarBgColor,
    this.avatarRadius = 36.0,
    this.avatarTop = 100.0,
    this.showAvatar = true,
    this.bodyTop = 210.0,
    required this.tabs,
    required this.tabViews,
    this.tabBarIndicatorColor,
    this.tabBarLabelColor,
    this.tabBarUnselectedLabelColor,
  }) : assert(tabs.length == tabViews.length, 'Tabs and views must match');

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

  final String? avatarImage;
  final Color? avatarBgColor;
  final double avatarRadius;
  final double avatarTop;
  final bool showAvatar;

  final double bodyTop;

  final List<Tab> tabs;
  final List<Widget> tabViews;

  final Color? tabBarIndicatorColor;
  final Color? tabBarLabelColor;
  final Color? tabBarUnselectedLabelColor;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: tabs.length,
      child: Scaffold(
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
            _buildTabViewWithTabBar(),
          ],
        ),
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

  Widget _buildTabViewWithTabBar() {
    return Positioned(
      top: bodyTop,
      left: 0,
      right: 0,
      bottom: 0,
      child: Column(
        children: [
          TabBar(
            labelColor: tabBarLabelColor,
            unselectedLabelColor: tabBarUnselectedLabelColor,
            indicatorColor: tabBarIndicatorColor,
            tabs: tabs,
          ),
          const SizedBox(height: 8),
          Expanded(child: TabBarView(children: tabViews)),
        ],
      ),
    );
  }
}
