import 'package:algolab/views/base/screen_view_base.dart';
import 'package:algolab/views/sorting_practice_screen/components/sort_step_display.dart';
import 'package:algolab/views/sorting_practice_screen/sorting_practice_screen_controller.dart';
import 'package:algolab/views/sorting_practice_screen/sorting_practice_screen_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class SortingPracticeScreenView extends ScreenViewBase<SortingPracticeScreenViewModel, SortingPracticeScreenController> {

  const SortingPracticeScreenView({
    required super.viewModel,
    required super.controller,
    required super.contextAccessor,
  });

  @override
  Widget get body {
    return Scaffold(
      appBar: AppBar(
        title: Text("Practicing: Sorting"),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 32),
        child: Observer(
          builder: (_) => Table(
            columnWidths: {
              0: IntrinsicColumnWidth(),
            },
            defaultVerticalAlignment: TableCellVerticalAlignment.middle,
            children: viewModel.stepViewModels.map((step) {
              return TableRow(
                children: [
                  Text(step.isCorrect != false ? 'Step ${step.stepIndex}' : ''),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: SortStepDisplay(
                        viewModel: step,
                        onSelectedIndicesChanged: controller.onSelectedIndicesChanged,
                      ),
                    ),
                  ),
                ],
              );
            }).toList(),
          ),
        ),
      ),
    );
  }

}
