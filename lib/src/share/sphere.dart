part of 'share.dart';

class Sphere extends StatelessWidget {
  const Sphere({
    super.key,
    required this.data,
  });

  final SphereData data;

  @override
  Widget build(BuildContext context) {
    final (width, height) = sizeSphereMana(context);

    return Image.asset(
      'assets/images/spheres/${data.color}.webp',
      fit: BoxFit.cover,
      width: width,
      height: height,
    ).animate().fadeIn(duration: 1200.ms, curve: Curves.easeInSine);
  }
}

(double, double) sizeSphereMana(BuildContext context) {
  final size = sizeWrappedSphereMana(context);
  const k = 0.84;

  return (size.$1 * k, size.$2 * k);
}
