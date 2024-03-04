part of '../bloc.dart';

class ManaContent extends StatelessWidget {
  const ManaContent({super.key});

  @override
  Widget build(BuildContext context) => BlocBuilder<ManaBloc, ManaState>(
        builder: (context, state) => content(context, state),
      );

  Widget content(BuildContext context, ManaState state) => Padding(
        padding: const EdgeInsets.all(12),
        child: state.layout.build(state.pool),
      );
}
