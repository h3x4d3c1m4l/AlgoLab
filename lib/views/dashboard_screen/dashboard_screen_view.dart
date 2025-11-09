import 'package:algolab/views/base/screen_view_base.dart';
import 'package:algolab/views/dashboard_screen/dashboard_screen_controller.dart';
import 'package:algolab/views/dashboard_screen/dashboard_screen_view_model.dart';
import 'package:flutter/material.dart';

class DashboardScreenView extends ScreenViewBase<DashboardScreenViewModel, DashboardScreenController> {

  const DashboardScreenView({
    required super.viewModel,
    required super.controller,
    required super.contextAccessor,
  });

  @override
  Widget get body {
    return Scaffold(body: Center(child: Text("Hello from DashboardScreen!")));
  }

}
