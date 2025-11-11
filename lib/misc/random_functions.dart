import 'dart:math';

import 'package:fast_immutable_collections/fast_immutable_collections.dart';

final _rng = Random();

IList<int> generateRandomNumbers({required int length, int min = 1, int max = 100, bool allowDuplicates = true}) {
  if (max - min + 1 < length && !allowDuplicates) {
    throw ArgumentError('Range [$min, $max] is too small to generate $length unique numbers.');
  }

  if (allowDuplicates) {
    return List.generate(length, (_) => _rng.nextInt(max - min + 1) + min).lock;
  } else {
    final Set<int> numbers = {};
    while (numbers.length < length) {
      numbers.add(_rng.nextInt(max - min + 1) + min);
    }
    return numbers.toIList();
  }
}
