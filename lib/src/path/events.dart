part of 'bloc.dart';

abstract class PathEvent extends Equatable {
  const PathEvent();

  @override
  List<Object?> get props => [];
}

class InitializingPathEvent extends PathEvent {
  const InitializingPathEvent();
}

class ConstructPathEvent extends PathEvent {
  const ConstructPathEvent({
    required this.fromPosition,
    required this.toPosition,
  });

  final Offset fromPosition;
  final Offset toPosition;

  @override
  List<Object?> get props => [...super.props, fromPosition, toPosition];
}

class WaitingPathEvent extends PathEvent {
  const WaitingPathEvent();
}
