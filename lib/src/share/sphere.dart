part of 'share.dart';

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
    ).animate().fadeIn(duration: 1200.ms, curve: Curves.easeInSine);
  }
}
