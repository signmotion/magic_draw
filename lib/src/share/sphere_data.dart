part of 'share.dart';

/// Each sphere has an own behaviour.
class SphereData {
  SphereData()
      : period = randomIntRange(minPeriod, maxPeriod),
        duration = randomIntRange(minDuration, maxDuration);

  static const minPeriod = 1200 * 1;
  static const maxPeriod = minPeriod + minPeriod * 2;
  late final int period;

  static const minDuration = 1200;
  static const maxDuration = minDuration + minDuration * 2;
  late final int duration;

  String get color => 'blue';
}
