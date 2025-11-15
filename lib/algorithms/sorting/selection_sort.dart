import 'package:algolab/algorithms/sorting/sort_algorithm.dart';
import 'package:algolab/models/sort_step.dart';
import 'package:fast_immutable_collections/fast_immutable_collections.dart';

class SelectionSort implements SortAlgorithm {

  const SelectionSort();

  @override
  String get name => 'Selection Sort';

  @override
  IList<SortStep> generateSteps(IList<int> input) {
    final List<int> arr = List<int>.from(input);
    final List<SortStep> steps = <SortStep>[];

    for (int i = 0; i < arr.length - 1; i++) {
      int minIndex = i;

      // Find minimum.
      for (int j = i + 1; j < arr.length; j++) {
        steps.add(SortStep(indexA: minIndex, indexB: j, swap: false, currentArray: IList(arr)));

        if (arr[j] < arr[minIndex]) {
          minIndex = j;
        }
      }

      if (minIndex != i) {
        final int tmp = arr[i];
        arr[i] = arr[minIndex];
        arr[minIndex] = tmp;

        steps.add(SortStep(indexA: i, indexB: minIndex, swap: true, currentArray: IList(arr)));
      }
    }

    return steps.lock;
  }

}
