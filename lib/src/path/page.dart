part of 'bloc.dart';

class PathPage extends StatelessWidget {
  const PathPage({
    super.key,
    required this.pathBloc,
  });

  final PathBloc pathBloc;

  @override
  Widget build(BuildContext context) {
    logi('Build content $runtimeType');

    return BlocProvider(
      create: (context) => pathBloc..add(const InitializingPathEvent()),
      child: const PathContent(),
    );
  }
}
