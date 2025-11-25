import 'package:algolab/algorithms/sorting/sort_algorithm.dart';
import 'package:algolab/models/sort_step.dart';
import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:flutter/material.dart';

class BubbleSort extends SortAlgorithm {

  const BubbleSort();

  @override
  IconData get icon => Icons.swap_horiz;

  @override
  String get name => 'Bubble Sort';

  @override
  String get description => "Bubble sort repeatedly scans a list and swaps adjacent items whenever they're in the wrong order. With each pass, the largest remaining value moves toward the end of the list. It's extremely simple to implement but very inefficient for larger inputs. You won't see it in real-world systems; it's mostly used to teach basic algorithmic thinking.";

  @override
  String get moreInfoUrl => 'https://www.geeksforgeeks.org/dsa/bubble-sort-algorithm/';

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
