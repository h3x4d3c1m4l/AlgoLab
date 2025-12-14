import 'package:algolab/extensions/build_context_extension.dart';
import 'package:algolab/models/sort_step_view_model.dart';
import 'package:algolab/views/base/dialog_helper.dart';
import 'package:algolab/views/base/screen_view_base.dart';
import 'package:algolab/views/components/algo_lab_scaffold.dart';
import 'package:algolab/views/components/containers/animated_appearance.dart';
import 'package:algolab/views/components/containers/scrolling_paper_grid.dart';
import 'package:algolab/views/components/dialogs/cancel_exercise_dialog.dart';
import 'package:algolab/views/sorting_practice_screen/components/sort_step_display.dart';
import 'package:algolab/views/sorting_practice_screen/sorting_practice_screen_controller.dart';
import 'package:algolab/views/sorting_practice_screen/sorting_practice_screen_view_model.dart';
import 'package:collection/collection.dart';
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
    return AlgoLabScaffold(
      appBarMiddle: Text(
        "Select the two numbers that are to be swapped next.",
        textAlign: TextAlign.center,
        style: Theme.of(context).textTheme.titleMedium,
      ),
      bodyBackground: Observer(
        builder: (context) => ScrollingPaperGrid(
          scrollOffset: viewModel.paperGridScrollPosition,
        ),
      ),
      bodyPadding: EdgeInsets.zero,
      body: Align(
        alignment: AlignmentGeometry.bottomCenter,
        child: NotificationListener<Notification>(
          onNotification: (notification) {
            controller.onPossibleTableScrollNotification(notification);
            return false;
          },
          child: SingleChildScrollView(
            reverse: true,
            controller: controller.stepsScrollController,
            padding: EdgeInsets.symmetric(vertical: 16),
            child: Observer(
              builder: (context) => Column(
                children: viewModel.stepViewModels.mapIndexed((i, step) {
                  String? leadingText;
                  if (step.type == SortStepType.endResult) {
                    leadingText = 'End result';
                  } else if (step.swapIndex == null) {
                    leadingText = 'Comparison';
                  } else if (step.type == SortStepType.correctSwap || i == viewModel.stepViewModels.length - 1) {
                    leadingText = 'Swap ${step.swapIndex}';
                  }

                  return AnimatedAppearance(
                    key: step.key,
                    isDim: step.type == SortStepType.compare,
                    animateSize: i != 0,
                    child: SortStepDisplay(
                      leading: leadingText,
                      viewModel: step,
                      buttonsScrollController: controller.buttonsScrollControllers[i],
                      onSelectedIndicesChanged: controller.onSelectedIndicesChanged,
                    ),
                  );
                }).toList(),
              ),
            ),
          ),
        ),
      ),
      bottomBarLeading: Row(
        children: [
          if (context.isMobile)
            IconButton(
              onPressed: () => showAlgoLabDialog(context: context, builder: (_) => CancelExerciseDialog()),
              style: ElevatedButton.styleFrom(foregroundColor: Colors.red),
              icon: Icon(Icons.arrow_back),
            ),
          Text(
            '${context.isMobile ? '' : 'Practicing: '}${viewModel.algorithm.name}',
            style: Theme.of(context).textTheme.titleLarge,
          ),
        ],
      ),
      bottomBarTrailing: Row(
        spacing: 32,
        children: [
          Observer(
            builder: (context) => Text(viewModel.swapCounter, style: Theme.of(context).textTheme.titleLarge),
          ),
          if (!context.isMobile)
            ElevatedButton.icon(
              onPressed: () => showAlgoLabDialog(context: context, builder: (_) => CancelExerciseDialog()),
              style: ElevatedButton.styleFrom(foregroundColor: Colors.red),
              icon: Icon(Icons.close),
              label: Text('Stop'),
            )
          else
            const SizedBox(width: 0),
        ],
      ),
    );
  }

}
