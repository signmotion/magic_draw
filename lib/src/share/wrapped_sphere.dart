part of 'share.dart';

/// TODO(sign): Extract to package `brownian_animate`?
class WrappedSphere extends StatefulWidget {
  const WrappedSphere({
    super.key,
    required this.data,
    required this.width,
    required this.height,
    this.k = 0.84,
  });

  final SphereData data;
  final double width;
  final double height;
  final double k;

  @override
  State<WrappedSphere> createState() => _WrappedSphereState();
}

class _WrappedSphereState extends State<WrappedSphere> {
  double get sphereWidth => widget.width * widget.k;
  double get sphereHeight => widget.height * widget.k;

  int get maxDelta => (widget.width - sphereWidth).floor();

  var dx = 0.0;
  var dy = 0.0;

  Curve get curve => Curves.easeInSine;

  late final Timer timer;

  @override
  void initState() {
    super.initState();

    timer = Timer.periodic(
      widget.data.period.ms,
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
  Widget build(BuildContext context) => SizedBox(
        width: widget.width,
        height: widget.height,
        child: Stack(
          children: [
            AnimatedPositioned(
              width: sphereWidth,
              height: sphereHeight,
              left: dx,
              top: dy,
              duration: widget.data.duration.ms,
              curve: curve,
              child: Sphere(
                data: widget.data,
                width: sphereWidth,
                height: sphereHeight,
              ),
            ),
          ],
        ),
      );

  @override
  void dispose() {
    timer.cancel();

    super.dispose();
  }
}
