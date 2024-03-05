part of 'bloc.dart';

/// The pool with predefined cells with widgets.
class ManaPool extends Equatable {
  ManaPool({
    int? size,
    List<SphereData?>? data,
  })  : assert(size != null || data != null,
            'Should be defiend `size` or `data`.'),
        assert(size != null && size > 0),
        assert(data == null || (size != null && size >= data.length)),
        data = List.filled(size ?? data!.length, null) {
    for (var i = 0; i < (data?.length ?? 0); ++i) {
      this.data[i] = data![i];
    }
  }

  /// Copy resized with [newSize].
  ManaPool resized(int newSize) => ManaPool(size: newSize, data: data);

  /// Copy refilled with [newData].
  ManaPool refilled(List<SphereData?> newData) =>
      ManaPool(size: max(data.length, size), data: newData);

  final List<SphereData?> data;

  int get size => data.length;

  List<SphereData> filledData({shuffle = true}) {
    final r = [
      for (final d in data)
        if (d != null) d
    ];
    if (shuffle) {
      r.shuffle();
    }

    return r;
  }

  /// Fully empty.
  bool get isEmpty => filledCells().isEmpty;

  /// Fully filled.
  bool get isFilled => freeCells().isEmpty;

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
  List<Object?> get props => [size, filledCells];
}
