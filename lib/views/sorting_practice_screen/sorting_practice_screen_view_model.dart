import 'package:algolab/algorithms/sorting/sort_algorithm.dart';
import 'package:algolab/misc/random_functions.dart';
import 'package:algolab/models/sort_step.dart';
import 'package:algolab/models/sort_step_view_model.dart';
import 'package:algolab/views/base/screen_view_model_base.dart';
import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:flutter/foundation.dart';
import 'package:mobx/mobx.dart';

part 'sorting_practice_screen_view_model.g.dart';

class SortingPracticeScreenViewModel = SortingPracticeScreenViewModelBase with _$SortingPracticeScreenViewModel;

abstract class SortingPracticeScreenViewModelBase extends ScreenViewModelBase with Store {

  final SortAlgorithm algorithm;

  late final IList<int> startValues;
  late final IList<SortStep> steps;
  late final int totalSwapCount;

  IList<SortStepViewModel> _nextCompareSteps = const IList.empty();

  @readonly
  int _currentStep = 0;

  @readonly
  IList<SortStepViewModel> _stepViewModels = const IList.empty();

  @computed
  String get swapCounter => 'Step ${_stepViewModels.last.swapIndex ?? totalSwapCount} / $totalSwapCount';

  @readonly
  double _paperGridScrollPosition = 0;

  @computed
  bool get finished => _currentStep == steps.length;

  SortingPracticeScreenViewModelBase({
    required super.contextAccessor,
    required this.algorithm,
    required int numberCount,
    required bool allowDuplicateNumbers,
  }) {
    startValues = generateRandomNumbers(length: numberCount, allowDuplicates: allowDuplicateNumbers);
    steps = algorithm.generateSteps(startValues);
    totalSwapCount = steps.count((s) => s.swap);
    initializeStepViewModels();
  }

  void initializeStepViewModels() {
    while (!steps[_currentStep].swap) {
      _nextCompareSteps = _nextCompareSteps.add(
        SortStepViewModel(
          key: UniqueKey(),
          type: SortStepType.compare,
          currentValues: _currentStep == 0 ? startValues : steps[_currentStep - 1].currentArray,
          highlightedIndices: ISet({steps[_currentStep].indexA, steps[_currentStep].indexB}),
        ),
      );
      _currentStep++;
    }

    _stepViewModels = _stepViewModels.add(
      SortStepViewModel(
        key: UniqueKey(),
        swapIndex: 1,
        currentValues: _currentStep == 0 ? startValues : steps[_currentStep - 1].currentArray,
        highlightedIndices: const ISetConst({}),
      ),
    );
  }

  void updateSelectedIndices(ISet<int> indices) {
    _stepViewModels = _stepViewModels.replace(
      _stepViewModels.length - 1,
      _stepViewModels[_stepViewModels.length - 1].copyWith(highlightedIndices: indices),
    );
  }

  void verifyAndHandleResultOfLastStep() {
    SortStep currentStep = steps[_currentStep];
    SortStepViewModel stepViewModel = _stepViewModels.last;
    if (stepViewModel.highlightedIndices.containsAll([currentStep.indexA, currentStep.indexB])) {
      // User input was correct.
      _stepViewModels = _stepViewModels.removeLast().addAll(_nextCompareSteps).add(
        stepViewModel.copyWith(type: SortStepType.correctSwap),
      );
      _currentStep++;

      _nextCompareSteps = const IList.empty();
      while (_currentStep < steps.length && !steps[_currentStep].swap) {
        _nextCompareSteps = _nextCompareSteps.add(
          SortStepViewModel(
            key: UniqueKey(),
            type: SortStepType.compare,
            currentValues: steps[_currentStep - 1].currentArray,
            highlightedIndices: ISet({steps[_currentStep].indexA, steps[_currentStep].indexB}),
          ),
        );
        _currentStep++;
      }

      if (_currentStep < steps.length) {
        // Add next step.
        _stepViewModels = _stepViewModels.add(
          SortStepViewModel(
            key: UniqueKey(),
            swapIndex: stepViewModel.swapIndex! + 1,
            currentValues: steps[_currentStep - 1].currentArray,
            highlightedIndices: const ISetConst({}),
          ),
        );
      } else if (_currentStep == steps.length) {
        // Add result.
        _stepViewModels = _stepViewModels.add(
          SortStepViewModel(
            key: UniqueKey(),
            type: SortStepType.endResult,
            currentValues: startValues.sort(),
            highlightedIndices: const ISetConst({}),
          ),
        );
      }
    } else {
      // User input was incorrect.
      _stepViewModels = _stepViewModels
          .replace(_stepViewModels.length - 1, _stepViewModels[_stepViewModels.length - 1].copyWith(type: SortStepType.incorrectSwap))
          .add(_stepViewModels[_stepViewModels.length - 1].copyWith(key: UniqueKey(), highlightedIndices: const ISetConst({}), type: null));
    }
  }

  void setPaperGridScrollPosition(double position) => _paperGridScrollPosition = position;

}
