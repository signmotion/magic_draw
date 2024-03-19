part of 'bloc.dart';

class MagicDraw extends StatelessWidget {
  MagicDraw({super.key}) {
    EquatableConfig.stringify = true;
  }

  static const defaultPoolSize = 12;

  final background = BackgroundBloc(
    state: const BackgroundState(state: BackgroundStateEnum.unspecified),
  );

  final aim = AimBloc(
    state: const AimState(state: AimStateEnum.unspecified),
  );

  final path = PathBloc(
    state: const PathState(state: PathStateEnum.unspecified),
  );

  final mana = ManaBloc(
    state: ManaState(
      pool: ManaPool(size: defaultPoolSize),
      layout: const WrapManaLayout(),
    ),
  );

  @override
  Widget build(BuildContext context) => BlocProvider(
        create: (context) => MDBloc(
          state: const MDState(state: MDStateEnum.unspecified),
          background: background,
          aim: aim,
          path: path,
          mana: mana,
        )..add(const InitializingMDEvent()),
        child: MDContent(
          backgroundBloc: background,
          aimBloc: aim,
          pathBloc: path,
          manaBloc: mana,
        ),
      );
}
