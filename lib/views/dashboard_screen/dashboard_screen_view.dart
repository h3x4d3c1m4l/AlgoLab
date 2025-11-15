import 'package:algolab/algorithms/sorting/bubble_sort.dart';
import 'package:algolab/algorithms/sorting/selection_sort.dart';
import 'package:algolab/app_router.gr.dart';
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
    return Scaffold(body: SizedBox.expand(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        spacing: 16,
        children: [
          FilledButton(onPressed: () {
            router.push(SortingPracticeRoute(numberCount: 10, allowDuplicateNumbers: false, algorithm: BubbleSort()));
          }, child: Text("Start Bubble Sort (n = 10, no dups)")),
          FilledButton(onPressed: () {
            router.push(SortingPracticeRoute(numberCount: 10, allowDuplicateNumbers: false, algorithm: SelectionSort()));
          }, child: Text("Start Selection Sort (n = 10, no dups)")),
        ],
      ),
    ));
  }

}
