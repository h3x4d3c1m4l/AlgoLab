import 'package:algolab/algorithms/sorting/sort_algorithm.dart';
import 'package:algolab/misc/random_functions.dart';
import 'package:algolab/models/sort_step.dart';
import 'package:algolab/models/sort_step_view_model.dart';
import 'package:algolab/views/base/screen_view_model_base.dart';
import 'package:fast_immutable_collections/fast_immutable_collections.dart';
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

  String get bottomText {
    return 'Select the two numbers that are to be swapped next.';
  }

  void initializeStepViewModels() {
    while (!steps[_currentStep].swap) {
      _nextCompareSteps = _nextCompareSteps.add(
        SortStepViewModel(
          type: SortStepType.compare,
          currentValues: _currentStep == 0 ? startValues : steps[_currentStep - 1].currentArray,
          highlightedIndices: ISet({steps[_currentStep].indexA, steps[_currentStep].indexB}),
        ),
      );
      _currentStep++;
    }

    _stepViewModels = _stepViewModels.add(
      SortStepViewModel(
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
            type: SortStepType.compare,
            currentValues: steps[_currentStep - 1].currentArray,
            highlightedIndices: ISet({steps[_currentStep].indexA, steps[_currentStep].indexB}),
          ),
        );
        _currentStep++;
      }

      // Add next step.
      if (_currentStep < steps.length) {
        _stepViewModels = _stepViewModels.add(
          SortStepViewModel(
            swapIndex: stepViewModel.swapIndex! + 1,
            currentValues: steps[_currentStep - 1].currentArray,
            highlightedIndices: const ISetConst({}),
          ),
        );
      }
    } else {
      // User input was incorrect.
      _stepViewModels = _stepViewModels
          .replace(_stepViewModels.length - 1, _stepViewModels[_stepViewModels.length - 1].copyWith(type: SortStepType.incorrectSwap))
          .add(_stepViewModels[_stepViewModels.length - 1].copyWith(highlightedIndices: const ISetConst({}), type: null));
    }
  }

}
