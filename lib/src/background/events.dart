part of 'bloc.dart';

abstract class BackgroundEvent extends Equatable {
  const BackgroundEvent();

  @override
  List<Object?> get props => [];
}

class InitializingBackgroundEvent extends BackgroundEvent {
  const InitializingBackgroundEvent();
}

class SetContentBackgroundEvent extends BackgroundEvent {
  const SetContentBackgroundEvent({required this.child});

  final Widget child;

  @override
  List<Object?> get props => [...super.props, child];
}

class WaitingBackgroundEvent extends BackgroundEvent {
  const WaitingBackgroundEvent();
}
