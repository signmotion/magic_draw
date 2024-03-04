part of '../bloc.dart';

abstract class ManaLayout {
  const ManaLayout();

  /// Conctructing a representation of [ManaPool].
  Widget build(BuildContext context, ManaPool pool);
}
