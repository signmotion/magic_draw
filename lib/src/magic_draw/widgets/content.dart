part of '../bloc.dart';

class MDContent extends StatelessWidget {
  const MDContent({
    super.key,
    required this.backgroundBloc,
    required this.aimBloc,
    required this.pathBloc,
    required this.manaBloc,
  });

  final BackgroundBloc backgroundBloc;
  final AimBloc aimBloc;
  final PathBloc pathBloc;
  final ManaBloc manaBloc;

  @override
  Widget build(BuildContext context) => Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Spacer(flex: 1),
              BackgroundPage(backgroundBloc: backgroundBloc),
              const Spacer(flex: 1),
            ],
          ),
          AimPage(aimBloc: aimBloc),
          PathPage(pathBloc: pathBloc),
          GestureLayer(
            aimBloc: aimBloc,
            manaBloc: manaBloc,
            pathBloc: pathBloc,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Spacer(flex: 999),
              ManaPage(manaBloc: manaBloc),
              const Spacer(flex: 1),
            ],
          ),
        ],
      );
}
