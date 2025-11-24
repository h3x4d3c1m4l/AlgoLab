import 'package:flutter/material.dart';

class AlgoLabScaffold extends StatelessWidget {

  final Widget? appBarLeading;
  final Widget? appBarMiddle;
  final Widget? appBarTrailing;
  final Widget body;
  final Widget? bottomBarLeading;
  final Widget? bottomBarMiddle;
  final Widget? bottomBarTrailing;

  const AlgoLabScaffold({super.key, this.appBarLeading, this.appBarMiddle, this.appBarTrailing, required this.body, this.bottomBarLeading, this.bottomBarMiddle, this.bottomBarTrailing});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _AppBar(leading: appBarLeading, middle: appBarMiddle, trailing: appBarTrailing),
      body: Container(
        alignment: Alignment.topCenter,
        padding: EdgeInsets.symmetric(horizontal: 16),
        child: SizedBox(width: 1200, child: body),
      ),
      bottomNavigationBar: _AppBar(leading: bottomBarLeading, middle: bottomBarMiddle, trailing: bottomBarTrailing),
    );
  }

}

class _AppBar extends StatelessWidget implements PreferredSizeWidget {

  final Widget? leading;
  final Widget? middle;
  final Widget? trailing;

  const _AppBar({this.leading, this.middle, this.trailing});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 92,
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
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(64);

}
