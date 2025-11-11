import 'package:algolab/algorithms/sorting/sort_algorithm.dart';
import 'package:algolab/views/base/build_context_accessor.dart';
import 'package:algolab/views/base/screen_base.dart';
import 'package:algolab/views/sorting_practice_screen/sorting_practice_screen_controller.dart';
import 'package:algolab/views/sorting_practice_screen/sorting_practice_screen_view.dart';
import 'package:algolab/views/sorting_practice_screen/sorting_practice_screen_view_model.dart';
import 'package:auto_route/annotations.dart';

@RoutePage()
class SortingPracticeScreen extends ScreenBase<SortingPracticeScreenViewModel, SortingPracticeScreenController, SortingPracticeScreenView> {

  final int numberCount;
  final bool allowDuplicateNumbers;
  final SortAlgorithm algorithm;

  const SortingPracticeScreen({super.key, required this.numberCount, required this.allowDuplicateNumbers, required this.algorithm});

  @override
  SortingPracticeScreenController createController({required SortingPracticeScreenViewModel viewModel, required BuildContextAccessor contextAccessor}) {
    return SortingPracticeScreenController(viewModel: viewModel, contextAccessor: contextAccessor);
  }

  @override
  SortingPracticeScreenView createView({required SortingPracticeScreenController controller, required SortingPracticeScreenViewModel viewModel, required BuildContextAccessor contextAccessor}) {
    return SortingPracticeScreenView(viewModel: viewModel, controller: controller, contextAccessor: contextAccessor);
  }

  @override
  SortingPracticeScreenViewModel createViewModel({required BuildContextAccessor contextAccessor}) {
    return SortingPracticeScreenViewModel(contextAccessor: contextAccessor, numberCount: numberCount, allowDuplicateNumbers: allowDuplicateNumbers, algorithm: algorithm);
  }

}
