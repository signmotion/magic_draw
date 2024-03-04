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
    logi(details.globalPosition);

    final pool = manaBloc.state.pool;
    final filledCell = pool.filledCell();
    if (filledCell == -1) {
      // no mana
      return;
    }

    final sphereData = pool.data[filledCell]!;
    // final manaPosition = sphereData.key.globalPaintBounds?.center;
    // logi('manaPosition $manaPosition');
    // final size = MediaQuery.of(context).size;
    // pathBloc.add(ConstructPathEvent(
    //   fromPosition: const Offset(0, 0),
    //   toPosition: Offset(size.width, size.height),
    //   // fromPosition: manaPosition!,
    //   // toPosition: details.localPosition,
    // ));

    final tapPosition = details.localPosition;
    aimBloc.add(TapEffectAimEvent(position: tapPosition));

    manaBloc.add(const DrainManaEvent());
  }
}
