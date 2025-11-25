import 'package:algolab/algorithms/algorithm.dart';
import 'package:algolab/algorithms/sorting/bubble_sort.dart';
import 'package:algolab/algorithms/sorting/selection_sort.dart';
import 'package:algolab/algorithms/sorting/sort_algorithm.dart';
import 'package:algolab/app_router.gr.dart';
import 'package:algolab/views/base/screen_view_base.dart';
import 'package:algolab/views/components/algo_lab_scaffold.dart';
import 'package:algolab/views/dashboard_screen/components/algorithm_card.dart';
import 'package:algolab/views/dashboard_screen/dashboard_screen_controller.dart';
import 'package:algolab/views/dashboard_screen/dashboard_screen_view_model.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flexible_wrap/flexible_wrap.dart';
import 'package:flutter/material.dart';

class DashboardScreenView extends ScreenViewBase<DashboardScreenViewModel, DashboardScreenController> {

  const DashboardScreenView({
    required super.viewModel,
    required super.controller,
    required super.contextAccessor,
  });

  @override
  Widget get body {
    return AlgoLabScaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Welcome!', style: theme.textTheme.headlineSmall),
            const SizedBox(height: 32),
            Row(
              spacing: 16,
              children: [
                Icon(Icons.sort),
                Text('Sorting algorithms', style: theme.textTheme.headlineMedium),
              ],
            ),
            const SizedBox(height: 16),
            FlexibleWrap(
              runSpacing: 16,
              children: [
                AlgorithmCard(algorithm: const BubbleSort(), onTap: () => onCardTapped(const BubbleSort())),
                AlgorithmCard(algorithm: const SelectionSort(), onTap: () => onCardTapped(const SelectionSort())),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void onCardTapped(Algorithm algorithm) {
    switch (algorithm) {
      case SortAlgorithm _:
        context.pushRoute(SortingPracticeRoute(numberCount: 10, allowDuplicateNumbers: false, algorithm: algorithm));
    }
  }

}
