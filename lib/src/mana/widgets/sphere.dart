part of '../bloc.dart';

class Sphere extends StatelessWidget {
  const Sphere({super.key});

  @override
  Widget build(BuildContext context) => Image.asset(
        'assets/images/spheres/blue.webp',
        fit: BoxFit.cover,
      ).animate().fadeIn(duration: 1200.ms, curve: Curves.easeInSine);
}
