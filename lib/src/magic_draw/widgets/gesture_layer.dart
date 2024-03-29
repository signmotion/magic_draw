part of '../bloc.dart';

class GestureLayer extends StatelessWidget {
  const GestureLayer({
    super.key,
    required this.aimBloc,
    required this.pathBloc,
    required this.manaBloc,
  });

  final AimBloc aimBloc;
  final PathBloc pathBloc;
  final ManaBloc manaBloc;

  @override
  Widget build(BuildContext context) => GestureDetector(
        onTapDown: (TapDownDetails details) => onTapDown(context, details),
        child: Container(color: Colors.white.withOpacity(0.0)),
      );

  void onTapDown(BuildContext context, TapDownDetails details) {
    final pool = manaBloc.state.pool;
    final filledCell = pool.filledCell();
    if (filledCell == -1) {
      // no mana
      return;
    }

    final tapPosition = details.localPosition;
    aimBloc.add(TapEffectAimEvent(position: tapPosition));

    //final sphereData = pool.data[filledCell]!;
    final size = MediaQuery.of(context).size;
    // TODO(sign): Detect a real mana position.
    final manaPosition = Offset(size.width / 2, size.height);
    pathBloc.add(ConstructPathEvent(
      fromPosition: manaPosition,
      toPosition: tapPosition,
    ));

    manaBloc.add(const DrainManaEvent());
  }
}
