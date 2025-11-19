import 'package:flutter/material.dart';

class AlgoLabScaffold extends StatelessWidget {

  final Widget? appBarLeading;
  final String? appBarTitle;
  final Widget? appBarTrailing;
  final Widget body;
  final Widget? bottomBarLeading;
  final Widget? bottomBarMiddle;
  final Widget? bottomBarTrailing;

  const AlgoLabScaffold({super.key, this.appBarLeading, this.appBarTitle, this.appBarTrailing, required this.body, this.bottomBarLeading, this.bottomBarMiddle, this.bottomBarTrailing});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _AppBar(
        leading: appBarLeading,
        middle: appBarTitle != null ? Text(appBarTitle!, style: Theme.of(context).textTheme.titleLarge) : null,
        trailing: appBarTrailing,
      ),
      body: Align(
        alignment: Alignment.topCenter,
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
      height: 64,
      alignment: Alignment.center,
      child: SizedBox(
        width: 1200,
        child: NavigationToolbar(
          leading: leading,
          middle: middle,
          trailing: trailing,
        ),
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(64);

}
