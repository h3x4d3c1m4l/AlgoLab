import 'package:flutter/material.dart';
import 'package:sketchy_design_lang/sketchy_design_lang.dart';

class AlgoLabScaffold extends StatelessWidget {

  final Widget? appBarLeading;
  final Widget? appBarMiddle;
  final Widget? appBarTrailing;
  final Widget? bodyBackground;
  final Widget body;
  final EdgeInsets? bodyPadding;
  final Widget? bottomBarLeading;
  final Widget? bottomBarMiddle;
  final Widget? bottomBarTrailing;

  const AlgoLabScaffold({
    super.key,
    this.appBarLeading,
    this.appBarMiddle,
    this.appBarTrailing,
    this.bodyBackground,
    required this.body,
    this.bodyPadding = const EdgeInsets.symmetric(horizontal: 16),
    this.bottomBarLeading,
    this.bottomBarMiddle,
    this.bottomBarTrailing,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _AppBar(location: _AppBarLocation.top, leading: appBarLeading, middle: appBarMiddle, trailing: appBarTrailing),
      body: Stack(
        fit: StackFit.expand,
        children: [
          if (bodyBackground != null) bodyBackground!,
          Align(
            alignment: Alignment.topCenter,
            child: Container(padding: bodyPadding, width: 1200, child: body),
          ),
        ],
      ),
      bottomNavigationBar: _AppBar(location: _AppBarLocation.bottom, leading: bottomBarLeading, middle: bottomBarMiddle, trailing: bottomBarTrailing),
    );
  }

}

enum _AppBarLocation { top, bottom }

class _AppBar extends StatelessWidget implements PreferredSizeWidget {

  final _AppBarLocation location;
  final Widget? leading;
  final Widget? middle;
  final Widget? trailing;

  const _AppBar({required this.location, this.leading, this.middle, this.trailing});

  double get _height => location == _AppBarLocation.top ? 70 : 86;

  @override
  Widget build(BuildContext context) {
    if (leading == null && middle == null && trailing == null) return SizedBox(height: preferredSize.height);
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        if (location == _AppBarLocation.top) const SizedBox(height: 6),
        if (location == _AppBarLocation.bottom) SketchyDivider(),
        Container(
          height: _height - 16 - 6,
          alignment: Alignment.center,
          child: Container(
            width: 1200,
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: NavigationToolbar(
              leading: IntrinsicWidth(child: Align(alignment: Alignment.centerLeft, child: leading)),
              middle: middle,
              trailing: IntrinsicWidth(child: Align(alignment: Alignment.centerRight, child: trailing)),
            ),
          ),
        ),
        if (location == _AppBarLocation.top) SketchyDivider(),
        if (location == _AppBarLocation.bottom) const SizedBox(height: 6),
      ],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(_height);

}
