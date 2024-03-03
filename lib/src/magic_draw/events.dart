part of 'bloc.dart';

abstract class MDEvent extends Equatable {
  const MDEvent();

  @override
  List<Object?> get props => [];
}

// system
class InitializingMDEvent extends MDEvent {
  const InitializingMDEvent();
}

class WaitingMDEvent extends MDEvent {
  const WaitingMDEvent();
}
