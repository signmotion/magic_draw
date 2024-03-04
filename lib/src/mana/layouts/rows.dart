part of '../bloc.dart';

class TableManaLayout extends ManaLayout {
  const TableManaLayout({
    required this.columns,
    required this.rows,
  })  : assert(columns > 0),
        assert(rows > 0);

  final int columns;
  final int rows;

  @override
  Widget build(BuildContext context, ManaPool pool) {
    final (width, height) = sizeWrappedSphereMana(context);

    return Column(
      children: [
        for (var c = 0; c < columns; ++c)
          Row(
            children: [
              for (var r = 0; r < rows; ++r)
                pool.data[r] == null
                    ? SizedBox(width: width, height: height)
                    : WrappedSphere(
                        key: pool.data[r]!.key,
                        data: pool.data[r]!,
                      ),
            ],
          ),
      ],
    );
  }
}
