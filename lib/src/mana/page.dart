part of 'bloc.dart';

class ManaPage extends StatelessWidget {
  const ManaPage({
    super.key,
    required this.manaBloc,
  });

  final ManaBloc manaBloc;

  @override
  Widget build(BuildContext context) => BlocProvider(
        create: (context) => manaBloc..add(const InitializingManaEvent()),
        child: const ManaContent(),
      );
}
