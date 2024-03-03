part of '../bloc.dart';

class WrappedSphere extends StatefulWidget {
  const WrappedSphere({
    super.key,
    required this.width,
  });

  final double width;
  double get height => width;

  @override
  State<WrappedSphere> createState() => _WrappedSphereState();
}

class _WrappedSphereState extends State<WrappedSphere> {
  double get sphereWidth => widget.width * 0.84;
  double get sphereHeight => sphereWidth;

  static const minPeriod = 1200 * 1;
  static const maxPeriod = minPeriod + minPeriod * 2;
  late final int period;

  int get maxDelta => (widget.width - sphereWidth).floor();

  var dx = 0.0;
  var dy = 0.0;

  static const minDuration = 1200;
  static const maxDuration = minDuration + minDuration * 2;
  late final int duration;

  Curve get curve => Curves.easeInSine;

  @override
  void initState() {
    super.initState();

    period = randomIntRange(minPeriod, maxPeriod);
    duration = randomIntRange(minDuration, maxDuration);

    Timer.periodic(
      period.ms,
      (timer) => setState(
        () {
          const k = 1.0;
          dx = randomIntRange(0, maxDelta) * k;
          dy = randomIntRange(0, maxDelta) * k;
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widget.width,
      height: widget.height,
      child: Stack(
        children: [
          AnimatedPositioned(
            width: sphereWidth,
            height: sphereHeight,
            left: dx,
            top: dy,
            duration: duration.ms,
            curve: curve,
            child: const Sphere(),
          ),
        ],
      ),
    );
  }
}
