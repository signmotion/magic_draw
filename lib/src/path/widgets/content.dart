part of '../bloc.dart';

class PathContent extends StatelessWidget {
  const PathContent({super.key});

  @override
  Widget build(BuildContext context) => BlocBuilder<PathBloc, PathState>(
        builder: (context, state) => content(context, state),
      );

  Widget content(BuildContext context, PathState state) {
    final (width, height) = sphereSize(context);
    final screenSize = MediaQuery.of(context).size;

    return SizedBox(
      width: screenSize.width,
      height: screenSize.height,
      //color: Colors.amberAccent.withOpacity(0.6),
      child: Stack(
        children: state.pathData.map((p) {
          final begin = Offset(p.to.dx - width / 2, p.from.dy - height / 2);
          final end = Offset(p.to.dx - width / 2, p.to.dy - height / 2);

          return Sphere(
            data: SphereData(),
            width: width,
            height: height,
          )
              .animate()
              .move(
                begin: begin,
                end: end,
                duration: 1200.ms,
                curve: Curves.easeInSine,
              )
              .then()
            ..fadeOut(duration: 600.ms, curve: Curves.easeInSine);
        }).toList(),
      ),
    );
  }
}
