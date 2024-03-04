part of '../bloc.dart';

class ManaContent extends StatelessWidget {
  const ManaContent({super.key});

  static const padding = EdgeInsets.all(12);

  @override
  Widget build(BuildContext context) => BlocBuilder<ManaBloc, ManaState>(
        builder: (context, state) => content(context, state),
      );

  Widget content(BuildContext context, ManaState state) => Padding(
        padding: padding,
        child: state.layout.build(context, state.pool),
      );
}
