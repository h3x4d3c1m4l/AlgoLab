import 'package:algolab/algorithms/algorithm.dart';
import 'package:algolab/models/sort_step.dart';
import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:flutter/material.dart';

abstract class SortAlgorithm extends Algorithm {

  const SortAlgorithm();

  @override
  IconData get icon => Icons.sort;

  IList<SortStep> generateSteps(IList<int> input);

}
