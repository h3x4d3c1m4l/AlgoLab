import 'package:flutter/material.dart';
import 'package:flutter_scroll_shadow/flutter_scroll_shadow.dart';

class AlgoLabScaffold extends StatelessWidget {

  final Widget? appBarLeading;
  final Widget? appBarMiddle;
  final Widget? appBarTrailing;
  final EdgeInsets appBarPadding;
  final Widget? bodyBackground;
  final Widget body;
  final EdgeInsets bodyPadding;
  final Widget? bottomBarLeading;
  final Widget? bottomBarMiddle;
  final Widget? bottomBarTrailing;
  final EdgeInsets bottomBarPadding;

  const AlgoLabScaffold({
    super.key,
    this.appBarLeading,
    this.appBarMiddle,
    this.appBarTrailing,
    this.appBarPadding = EdgeInsets.zero,
    this.bodyBackground,
    required this.body,
    this.bodyPadding = const EdgeInsets.symmetric(horizontal: 16),
    this.bottomBarLeading,
    this.bottomBarMiddle,
    this.bottomBarTrailing,
    this.bottomBarPadding = EdgeInsets.zero,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarLeading != null || appBarMiddle != null || appBarTrailing != null
          ? _AppBar(
              location: _AppBarLocation.top,
              leading: appBarLeading,
              middle: appBarMiddle,
              trailing: appBarTrailing,
              padding: appBarPadding,
            )
          : null,
      body: ScrollShadow(
        size: 16,
        color: Colors.black26,
        child: Stack(
          fit: StackFit.expand,
          children: [
            if (bodyBackground != null) bodyBackground!,
            Align(
              alignment: Alignment.topCenter,
              child: Container(padding: bodyPadding, width: 1200, child: body),
            ),
          ],
        ),
      ),
      bottomNavigationBar: _AppBar(location: _AppBarLocation.bottom, leading: bottomBarLeading, middle: bottomBarMiddle, trailing: bottomBarTrailing, padding: bottomBarPadding),
    );
  }

}

enum _AppBarLocation { top, bottom }

class _AppBar extends StatelessWidget implements PreferredSizeWidget {

  final _AppBarLocation location;
  final EdgeInsets padding;
  final Widget? leading;
  final Widget? middle;
  final Widget? trailing;

  const _AppBar({required this.location, required this.padding, this.leading, this.middle, this.trailing});

  double get _height => location == _AppBarLocation.top ? 78 : 86;

  @override
  Widget build(BuildContext context) {
    if (leading == null && middle == null && trailing == null) return SizedBox(height: preferredSize.height);
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        if (location == _AppBarLocation.bottom) Divider(height: 1),
        Container(
          height: _height - 16 - 6,
          alignment: Alignment.center,
          padding: padding,
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
        if (location == _AppBarLocation.top) Divider(height: 1),
        if (location == _AppBarLocation.bottom) const SizedBox(height: 2),
      ],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(_height);

}
