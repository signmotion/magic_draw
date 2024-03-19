part of 'bloc.dart';

class BackgroundPage extends StatelessWidget {
  const BackgroundPage({
    super.key,
    required this.backgroundBloc,
  });

  final BackgroundBloc backgroundBloc;

  @override
  Widget build(BuildContext context) => BlocProvider(
        create: (context) =>
            backgroundBloc..add(const InitializingBackgroundEvent()),
        child: const BackgroundContent(),
      );
}
