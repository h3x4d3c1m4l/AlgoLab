import 'package:fast_immutable_collections/fast_immutable_collections.dart';

class SortStep {

  final int indexA;
  final int indexB;
  final bool swap;
  final IList<int> currentArray;

  SortStep({required this.indexA, required this.indexB, required this.swap, required this.currentArray});

}
