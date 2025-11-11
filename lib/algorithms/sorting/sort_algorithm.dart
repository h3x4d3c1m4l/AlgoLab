import 'package:algolab/models/sort_step.dart';
import 'package:fast_immutable_collections/fast_immutable_collections.dart';

abstract class SortAlgorithm {

  String get name;
  IList<SortStep> generateSteps(IList<int> input);

}
