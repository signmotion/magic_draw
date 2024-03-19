part of 'bloc.dart';

class PathPage extends StatelessWidget {
  const PathPage({
    super.key,
    required this.pathBloc,
  });

  final PathBloc pathBloc;

  @override
  Widget build(BuildContext context) => BlocProvider(
        create: (context) => pathBloc..add(const InitializingPathEvent()),
        child: const PathContent(),
      );
}
