part of 'bloc.dart';

abstract class ManaEvent extends Equatable {
  const ManaEvent();

  @override
  List<Object?> get props => [];
}

class InitializingManaEvent extends ManaEvent {
  const InitializingManaEvent();
}

class AddManaEvent extends ManaEvent {
  const AddManaEvent({this.count = 1});

  final int count;

  @override
  List<Object?> get props => [...super.props, count];
}

class WaitingManaEvent extends ManaEvent {
  const WaitingManaEvent();
}
