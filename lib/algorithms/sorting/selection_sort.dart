import 'package:algolab/algorithms/sorting/sort_algorithm.dart';
import 'package:algolab/models/sort_step.dart';
import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:flutter/material.dart';

class SelectionSort extends SortAlgorithm {

  const SelectionSort();

  @override
  IconData get icon => Icons.swap_horiz;

  @override
  String get name => 'Selection Sort';

  @override
  String get description => "Selection sort looks for the smallest element in the list and swaps it into the first position, then repeats this process for each remaining position. It uses a clear, step-by-step approach that makes it easy to follow. Just like bubble sort, it's far too slow to be used in practical applications. Its main purpose today is educational, helping students understand how sorting algorithms work.";

  @override
  String get moreInfoUrl => 'https://www.geeksforgeeks.org/dsa/selection-sort-algorithm-2/';

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
