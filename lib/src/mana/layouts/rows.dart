part of '../bloc.dart';

class TableManaLayout extends ManaLayout {
  const TableManaLayout({
    required this.columns,
    required this.rows,
  })  : assert(columns > 0),
        assert(rows > 0);

  final int columns;
  final int rows;
}
