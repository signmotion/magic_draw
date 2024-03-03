part of '../bloc.dart';

class BackgroundContent extends StatelessWidget {
  const BackgroundContent({super.key});

  @override
  Widget build(BuildContext context) =>
      BlocBuilder<BackgroundBloc, BackgroundState>(
        builder: (context, state) => content(context, state),
      );

  Widget content(BuildContext context, BackgroundState state) =>
      AnimatedSwitcher(
        duration: 1200.ms,
        switchInCurve: Curves.easeInSine,
        switchOutCurve: Curves.easeOutSine,
        child: state.child ?? const SizedBox(),
      );
}
