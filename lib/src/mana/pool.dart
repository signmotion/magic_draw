part of 'bloc.dart';

/// The pool with predefined cells with widgets.
class ManaPool extends Equatable {
  ManaPool.empty({required int count})
      : assert(count > 0),
        data = List.filled(count, null);

  ManaPool.filled({required this.data}) : assert(data.isNotEmpty);

  late final List<SphereData?> data;

  int get count => data.length;

  List<SphereData> get filledData => [
        for (final d in data)
          if (d != null) d
      ];

  /// Returns `-1` if all cells are empty.
  int filledCell({random = true}) {
    final filled = filledCells(shuffle: false);
    if (filled.isEmpty) {
      return -1;
    }

    if (random) {
      filled.shuffle();
    }

    return filled.first;
  }

  /// See [freeCell].
  List<int> filledCells({bool shuffle = true}) {
    final r = <int>[];
    for (var i = 0; i < data.length; ++i) {
      if (data[i] != null) {
        r.add(i);
      }
    }
    if (shuffle) {
      r.shuffle();
    }

    return r;
  }

  /// Returns `-1` if all cells are filled.
  int freeCell({random = true}) {
    final free = freeCells(shuffle: false);
    if (free.isEmpty) {
      return -1;
    }

    if (random) {
      free.shuffle();
    }

    return free.first;
  }

  /// See [filledCell].
  List<int> freeCells({bool shuffle = true}) {
    final r = <int>[];
    for (var i = 0; i < data.length; ++i) {
      if (data[i] == null) {
        r.add(i);
      }
    }
    if (shuffle) {
      r.shuffle();
    }

    return r;
  }

  @override
  List<Object?> get props => [count, filledCells];
}
