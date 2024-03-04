part of 'share.dart';

/// TODO(sign): Extract to package `brownian_animate`?
class WrappedSphere extends StatefulWidget {
  const WrappedSphere({
    super.key,
    required this.data,
  });

  final SphereData data;

  @override
  State<WrappedSphere> createState() => _WrappedSphereState();
}

class _WrappedSphereState extends State<WrappedSphere> {
  (double, double)? size;
  double get width => size!.$1;
  double get height => size!.$2;

  (double, double)? sizeSphere;
  double get sphereWidth => sizeSphere!.$1;
  double get sphereHeight => sizeSphere!.$2;

  int get maxDelta => (width - sphereWidth).floor();

  var dx = 0.0;
  var dy = 0.0;

  Curve get curve => Curves.easeInSine;

  @override
  void initState() {
    super.initState();

    Timer.periodic(
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
  Widget build(BuildContext context) {
    size ??= sizeWrappedSphereMana(context);
    sizeSphere ??= sizeSphereMana(context);

    return SizedBox(
      width: width,
      height: height,
      child: Stack(
        children: [
          AnimatedPositioned(
            width: sphereWidth,
            height: sphereHeight,
            left: dx,
            top: dy,
            duration: widget.data.duration.ms,
            curve: curve,
            child: Sphere(data: widget.data),
          ),
        ],
      ),
    );
  }
}

(double, double) sizeWrappedSphereMana(BuildContext context) {
  final size = MediaQuery.of(context).size;
  const scale = 1.0;
  final width = size.width * scale / 12 / 2 / size.aspectRatio;
  final height = size.height * scale / 12 / 2;

  return (width, height);
}
