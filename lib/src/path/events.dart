part of 'bloc.dart';

abstract class PathEvent extends Equatable {
  const PathEvent();

  @override
  List<Object?> get props => [];
}

// system
class InitializingPathEvent extends PathEvent {
  const InitializingPathEvent();
}

class WaitingPathEvent extends PathEvent {
  const WaitingPathEvent();
}
