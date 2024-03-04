part of 'bloc.dart';

class MagicDraw extends StatelessWidget {
  MagicDraw({super.key}) {
    EquatableConfig.stringify = true;
  }

  final backgroundBloc = BackgroundBloc(
    state: const BackgroundState(state: BackgroundStateEnum.unspecified),
  );

  final aimBloc = AimBloc(
    state: const AimState(state: AimStateEnum.unspecified),
  );

  final pathBloc = PathBloc(
    state: const PathState(state: PathStateEnum.unspecified),
  );

  static const columns = 12;
  static const rows = 2;

  final manaBloc = ManaBloc(
    state: ManaState(
      pool: ManaPool.empty(count: columns * rows),
      layout: const TableManaLayout(columns: columns, rows: rows),
    ),
  );

  @override
  Widget build(BuildContext context) {
    logi('Build content $runtimeType');

    return BlocProvider(
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
}
