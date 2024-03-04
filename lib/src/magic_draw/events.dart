part of 'bloc.dart';

abstract class MDEvent extends Equatable {
  const MDEvent();

  @override
  List<Object?> get props => [];
}

class InitializingMDEvent extends MDEvent {
  const InitializingMDEvent();
}

class WaitingMDEvent extends MDEvent {
  const WaitingMDEvent();
}
