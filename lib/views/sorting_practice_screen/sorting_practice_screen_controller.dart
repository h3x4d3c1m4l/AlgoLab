import 'package:algolab/views/base/screen_controller_base.dart';
import 'package:algolab/views/sorting_practice_screen/sorting_practice_screen_view_model.dart';
import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:flutter/material.dart';

class SortingPracticeScreenController extends ScreenControllerBase<SortingPracticeScreenViewModel> {

  final ScrollController tableScrollController = ScrollController();

  // Initialization/Deinitialization

  SortingPracticeScreenController({
    required super.viewModel,
    required super.contextAccessor,
  });

  // User interaction handling

  void onSelectedIndicesChanged(ISet<int> indices) {
    viewModel.updateSelectedIndices(indices);
    if (indices.length == 2) viewModel.verifyAndHandleResultOfLastStep();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      tableScrollController.animateTo(tableScrollController.position.maxScrollExtent, duration: Durations.medium1, curve: Curves.easeInOut);
    });

    if (viewModel.currentStep == viewModel.steps.length) {
      showDialog(context: contextAccessor.buildContext, builder: (_) {
        return AlertDialog(
          title: const Text('Nice!'),
        );
      });
    }
  }

  @override
  void dispose() {
    tableScrollController.dispose();
    super.dispose();
  }

}
