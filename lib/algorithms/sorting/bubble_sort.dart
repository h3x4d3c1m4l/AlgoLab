import 'package:algolab/algorithms/sorting/sort_algorithm.dart';
import 'package:algolab/models/sort_step.dart';
import 'package:fast_immutable_collections/fast_immutable_collections.dart';

class BubbleSort implements SortAlgorithm {

  const BubbleSort();

  @override
  String get name => 'Bubble Sort';

  @override
  IList<SortStep> generateSteps(IList<int> input) {
    final List<int> workingList = List<int>.from(input);
    final List<SortStep> steps = <SortStep>[];

    for (int i = 0; i < workingList.length; i++) {
      for (int j = 0; j < workingList.length - i - 1; j++) {
        final bool swap = workingList[j] > workingList[j + 1];
        if (swap) {
          final int temp = workingList[j];
          workingList[j] = workingList[j + 1];
          workingList[j + 1] = temp;
        }
        steps.add(SortStep(indexA: j, indexB: j + 1, swap: swap, currentArray: workingList.lock));
      }
    }

    return steps.lock;
  }

}
