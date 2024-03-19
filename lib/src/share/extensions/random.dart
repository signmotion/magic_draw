part of '../share.dart';

/// [min; max)
int randomIntRange(int min, int max) => min + _random.nextInt(max - min + 1);

final _random = Random();
