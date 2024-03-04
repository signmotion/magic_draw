part of '../bloc.dart';

class PathContent extends StatelessWidget {
  const PathContent({super.key});

  @override
  Widget build(BuildContext context) => BlocBuilder<PathBloc, PathState>(
        builder: (context, state) => content(context, state),
      );

  Widget content(BuildContext context, PathState state) => state.path == null
      ? const SizedBox()
      : Container(
          color: Colors.amberAccent.withOpacity(0.8),
          child: Stack(
            children: [
              PathAnimation(
                path: state.path!,
                duration: 2400.ms,
                curve: Curves.easeInSine,
                repeat: false,
                reverse: false,
                drawPath: true,
                pathColor: Colors.yellowAccent,
                pathWidth: 2,
                child: Container(
                  color: Colors.greenAccent,
                  width: 20,
                  height: 20,
                ),
                // child: const Sphere(),
              ),
            ],
          ),
        );
}
