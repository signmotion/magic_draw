part of '../bloc.dart';

abstract class ManaLayout {
  const ManaLayout();

  /// Conctructing a representation of [ManaPool].
  Widget build(BuildContext context, ManaPool pool) => Wrap(
        children: [
          for (final d in pool.filledData) WrappedSphere(key: d.key, data: d),
        ],
      );
}
