part of '../bloc.dart';

class ManaContent extends StatelessWidget {
  const ManaContent({super.key});

  @override
  Widget build(BuildContext context) => BlocBuilder<ManaBloc, ManaState>(
        builder: (context, state) => content(context, state),
      );

  Widget content(BuildContext context, ManaState state) {
    final (width, _) = size(context);

    return Padding(
      padding: const EdgeInsets.all(12),
      child: Wrap(
        children: [
          for (var i = 0; i < state.count; ++i) WrappedSphere(width: width),
        ],
      ),
    );
  }

  static (double, double) size(BuildContext context) {
    final size = MediaQuery.of(context).size;
    const scale = 1.0;
    final width = size.width * scale / 12 / 2 / size.aspectRatio;
    final height = size.height * scale / 12 / 2;

    return (width, height);
  }
}
