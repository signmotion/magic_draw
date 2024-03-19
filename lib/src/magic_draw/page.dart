part of 'bloc.dart';

class MagicDraw extends StatelessWidget {
  MagicDraw({super.key}) {
    EquatableConfig.stringify = true;
  }

  static const defaultPoolSize = 12;

  final backgroundBloc = BackgroundBloc(
    state: const BackgroundState(state: BackgroundStateEnum.unspecified),
  );

  final aimBloc = AimBloc(
    state: const AimState(state: AimStateEnum.unspecified),
  );

  final pathBloc = PathBloc(
    state: const PathState(state: PathStateEnum.unspecified),
  );

  final manaBloc = ManaBloc(
    state: ManaState(
      pool: ManaPool(size: defaultPoolSize),
      layout: const WrapManaLayout(),
    ),
  );

  @override
  Widget build(BuildContext context) => BlocProvider(
        create: (context) => MDBloc(
          state: const MDState(state: MDStateEnum.unspecified),
          backgroundBloc: backgroundBloc,
          aimBloc: aimBloc,
          pathBloc: pathBloc,
          manaBloc: manaBloc,
        )..add(const InitializingMDEvent()),
        child: MDContent(
          backgroundBloc: backgroundBloc,
          aimBloc: aimBloc,
          pathBloc: pathBloc,
          manaBloc: manaBloc,
        ),
      );
}
