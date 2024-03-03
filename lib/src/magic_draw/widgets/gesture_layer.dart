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
        child: Container(color: Colors.white.withOpacity(0)),
      );

  void onTapDown(BuildContext context, TapDownDetails details) {
    logi(details.globalPosition);

    aimBloc.add(TapEffectAimEvent(position: details.localPosition));
  }
}
