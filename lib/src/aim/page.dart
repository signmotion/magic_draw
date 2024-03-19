part of 'bloc.dart';

class AimPage extends StatelessWidget {
  const AimPage({
    super.key,
    required this.aimBloc,
  });

  final AimBloc aimBloc;

  @override
  Widget build(BuildContext context) => BlocProvider(
        create: (context) => aimBloc..add(const InitializingAimEvent()),
        child: const AimContent(),
      );
}
