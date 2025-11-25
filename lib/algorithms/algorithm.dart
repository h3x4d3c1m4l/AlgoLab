import 'package:flutter/widgets.dart';

abstract class Algorithm {

  const Algorithm();

  IconData get icon;
  String get name;
  String get description;
  String get moreInfoUrl;

}
