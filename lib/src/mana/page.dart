part of 'bloc.dart';

class ManaPage extends StatelessWidget {
  const ManaPage({
    super.key,
    required this.manaBloc,
  });

  final ManaBloc manaBloc;

  @override
  Widget build(BuildContext context) {
    logi('Build content $runtimeType');

    return BlocProvider(
      create: (context) => manaBloc..add(const InitializingManaEvent()),
      child: const ManaContent(),
    );
  }
}
