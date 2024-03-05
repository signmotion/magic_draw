import 'package:flutter_test/flutter_test.dart';
import 'package:magic_draw/src/mana/bloc.dart';
import 'package:magic_draw/src/share/share.dart';

void main() {
  group('ManaPool', () {
    test('Constructing empty', () {
      const size = 12;
      final pool = ManaPool(size: size);
      expect(pool.size, size);
      expect(pool.isEmpty, isTrue);
      expect(pool.isFilled, isFalse);
      expect(pool.filledCells(), isEmpty);
      expect(pool.freeCells().length, size);
    });

    test('Constructing filled', () {
      const size = 6;
      final data = [SphereData(), null, null, SphereData(), null];
      final pool = ManaPool(size: size, data: data);
      expect(pool.size, size);
      expect(pool.filledCells().length, 2);
      expect(pool.filledCells(shuffle: false), [0, 3]);
      expect(pool.freeCells().length, size - 2);
      expect(pool.freeCells(shuffle: false), [1, 2, 4, 5]);
      expect(pool.filledData(shuffle: false), [data[0], data[3]]);
      expect(pool.freeCell(random: false), 1);
    });

    test('Constructing filled and resize after', () {
      const size = 6;
      final data = [SphereData(), null, null, SphereData(), null];
      final pool = ManaPool(size: size, data: data);
      // just resize
      const add = 1;
      final newPool = pool.resized(size + add);
      expect(newPool.size, size + add);
      expect(newPool.filledCells().length, 2);
      expect(newPool.filledCells(shuffle: false), [0, 3]);
      expect(newPool.freeCells().length, size + add - 2);
      expect(newPool.freeCells(shuffle: false), [1, 2, 4, 5, 6]);
      expect(newPool.filledData(shuffle: false), [data[0], data[3]]);
      expect(newPool.freeCell(random: false), 1);
    });
  });
}
