part of '../bloc.dart';

class AimContent extends StatelessWidget {
  const AimContent({super.key});

  @override
  Widget build(BuildContext context) => BlocBuilder<AimBloc, AimState>(
        builder: (context, state) => content(context, state),
        buildWhen: (previous, current) =>
            previous.tapEffectPositions != current.tapEffectPositions ||
            previous.tapEffectWidgets != current.tapEffectWidgets,
      );

  Widget content(BuildContext context, AimState state) {
    final (width, height) = sphereSize(context);

    if (state.tapEffectPositions.length > state.tapEffectWidgets.length) {
      final position = state.tapEffectPositions.last;
      context.read<AimBloc>().add(
            BuildTapEffectAimEvent(
              widget: Positioned(
                left: position.dx - width / 2,
                top: position.dy - height / 2,
                child: state.tapEffectBuilder!(context: context),
              ),
            ),
          );
    }

    return Stack(children: state.tapEffectWidgets);
  }
}
