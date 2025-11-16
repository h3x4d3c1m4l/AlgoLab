import 'package:algolab/models/sort_step_view_model.dart';
import 'package:collection/collection.dart';
import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:flutter/material.dart';

class SortStepDisplay extends StatelessWidget {

  final SortStepViewModel viewModel;
  final ValueChanged<ISet<int>> onSelectedIndicesChanged;

  const SortStepDisplay({super.key, required this.viewModel, required this.onSelectedIndicesChanged});

  @override
  Widget build(BuildContext context) {
    return SegmentedButton(
      segments: viewModel.currentValues.mapIndexed((index, element) {
        return ButtonSegment(value: index, label: Text('$element'));
      }).toList(),
      selected: viewModel.highlightedIndices.unlockView,
      multiSelectionEnabled: true,
      emptySelectionAllowed: true,
      style: SegmentedButton.styleFrom(
        selectedBackgroundColor: viewModel.type == SortStepType.correctSwap || viewModel.type == SortStepType.compare
            ? Colors.lightGreenAccent
            : viewModel.type == SortStepType.incorrectSwap
            ? Colors.red
            : Colors.yellow,
      ),
      showSelectedIcon: false,
      onSelectionChanged: (indicesSet) {
        if (viewModel.type == null) onSelectedIndicesChanged(indicesSet.lock);
      },
    );
  }

}
