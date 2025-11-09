import 'package:algolab/extensions/build_context_extension.dart';
import 'package:algolab/l10n/generated/app_localizations.dart';
import 'package:algolab/views/base/build_context_accessor.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

/// This mixin makes several objects (that normally needs to be accessed using [BuildContext]) easier accessible from screen view models and controllers.
mixin BuildContextAbstractor {

  BuildContextAccessor get contextAccessor;
  BuildContext get _context => contextAccessor.buildContext;

  ThemeData get theme => _context.theme;
  StackRouter get router => _context.router;

  NavigatorState get navigator => _context.navigator;
  NavigatorState get rootNavigator => _context.rootNavigator;

  AppLocalizations get localizations => AppLocalizations.of(_context)!;

}
