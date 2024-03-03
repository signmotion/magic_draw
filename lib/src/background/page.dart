part of 'bloc.dart';

class BackgroundPage extends StatelessWidget {
  const BackgroundPage({
    super.key,
    required this.backgroundBloc,
  });

  final BackgroundBloc backgroundBloc;

  @override
  Widget build(BuildContext context) {
    logi('Build content $runtimeType');

    return BlocProvider(
      create: (context) =>
          backgroundBloc..add(const InitializingBackgroundEvent()),
      child: const BackgroundContent(),
    );
  }
}
