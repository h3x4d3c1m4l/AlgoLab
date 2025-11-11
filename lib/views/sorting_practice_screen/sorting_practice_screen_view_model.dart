import 'package:algolab/algorithms/sorting/sort_algorithm.dart';
import 'package:algolab/misc/random_functions.dart';
import 'package:algolab/models/sort_step.dart';
import 'package:algolab/models/sort_step_view_model.dart';
import 'package:algolab/views/base/screen_view_model_base.dart';
import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:mobx/mobx.dart';

part 'sorting_practice_screen_view_model.g.dart';

class SortingPracticeScreenViewModel = SortingPracticeScreenViewModelBase with _$SortingPracticeScreenViewModel;

// typedef // Sander: Hier komt een soort model voor de sort step display

abstract class SortingPracticeScreenViewModelBase extends ScreenViewModelBase with Store {

  late final IList<int> startValues;

  late final IList<SortStep> steps;

  @readonly
  int _currentStep = 0;

  @readonly
  late IList<SortStepViewModel> _stepViewModels;

  SortingPracticeScreenViewModelBase({
    required super.contextAccessor,
    required int numberCount,
    required bool allowDuplicateNumbers,
    required SortAlgorithm algorithm,
  }) {
    startValues = generateRandomNumbers(length: numberCount, allowDuplicates: allowDuplicateNumbers);
    steps = algorithm.generateSteps(startValues);
    _stepViewModels = [SortStepViewModel(stepIndex: 1, currentValues: startValues, selectedIndices: const ISetConst({}))].lock;
  }

  void updateSelectedIndices(ISet<int> indices) {
    _stepViewModels = _stepViewModels.replace(
      _stepViewModels.length - 1,
      _stepViewModels[_stepViewModels.length - 1].copyWith(selectedIndices: indices),
    );
  }

  void verifyAndHandleResultOfLastStep() {
    SortStep currentStep = steps[_currentStep];
    SortStepViewModel stepViewModel = _stepViewModels.last;
    if (stepViewModel.selectedIndices.containsAll([currentStep.indexA, currentStep.indexB])) {
      _stepViewModels = _stepViewModels
          .replace(_stepViewModels.length - 1, _stepViewModels[_stepViewModels.length - 1].copyWith(isCorrect: true))
          .add(
            SortStepViewModel(stepIndex: _currentStep + 2, currentValues: steps[_currentStep].currentArray, selectedIndices: const ISetConst({})),
          );
      _currentStep++;
    } else {
      _stepViewModels = _stepViewModels
          .replace(_stepViewModels.length - 1, _stepViewModels[_stepViewModels.length - 1].copyWith(isCorrect: false))
          .add(_stepViewModels[_stepViewModels.length - 1].copyWith(selectedIndices: const ISetConst({}), isCorrect: null));
    }
  }

}
