part of '../share.dart';

class Sphere extends StatelessWidget {
  const Sphere({
    super.key,
    required this.data,
    required this.width,
    required this.height,
  });

  final SphereData data;
  final double width;
  final double height;

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      'assets/images/spheres/${data.color}.webp',
      fit: BoxFit.cover,
      width: width,
      height: height,
    );
  }
}

(double, double) sphereSize(BuildContext context) {
  final screenSize = MediaQuery.of(context).size;

  return (
    screenSize.width / 12,
    screenSize.height / 12 * screenSize.aspectRatio,
  );
}
