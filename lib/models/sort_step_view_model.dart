import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'sort_step_view_model.freezed.dart';

@freezed
abstract class SortStepViewModel with _$SortStepViewModel {

  const factory SortStepViewModel({
    SortStepType? type,
    int? swapIndex,
    required IList<int> currentValues,
    required ISet<int> highlightedIndices,
  }) = _SortStepViewModel;

}

enum SortStepType { compare, incorrectSwap, correctSwap }
