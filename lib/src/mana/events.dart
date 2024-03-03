part of 'bloc.dart';

abstract class ManaEvent extends Equatable {
  const ManaEvent();

  @override
  List<Object?> get props => [];
}

class InitializingManaEvent extends ManaEvent {
  const InitializingManaEvent();
}

class SetLimitCountManaEvent extends ManaEvent {
  const SetLimitCountManaEvent({this.limitCount = 1});

  final int limitCount;

  @override
  List<Object?> get props => [...super.props, limitCount];
}

class IncrementManaEvent extends ManaEvent {
  const IncrementManaEvent({this.count = 1});

  final int count;

  @override
  List<Object?> get props => [...super.props, count];
}

class DecrementManaEvent extends ManaEvent {
  const DecrementManaEvent({this.count = 1});

  final int count;

  @override
  List<Object?> get props => [...super.props, count];
}

class WaitingManaEvent extends ManaEvent {
  const WaitingManaEvent();
}
