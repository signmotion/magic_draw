part of 'bloc.dart';

abstract class AimEvent extends Equatable {
  const AimEvent();

  @override
  List<Object?> get props => [];
}

class InitializingAimEvent extends AimEvent {
  const InitializingAimEvent();
}

class SetTapEffectAimEvent extends AimEvent {
  const SetTapEffectAimEvent({required this.effectBuilder});

  final TapEffectBuilder effectBuilder;

  @override
  List<Object?> get props => [...super.props, effectBuilder];
}

class TapEffectAimEvent extends AimEvent {
  const TapEffectAimEvent({required this.position});

  final Offset position;

  @override
  List<Object?> get props => [...super.props, position];
}

class BuildTapEffectAimEvent extends AimEvent {
  const BuildTapEffectAimEvent({required this.widget});

  final Widget widget;

  @override
  List<Object?> get props => [...super.props, widget];
}

class WaitingAimEvent extends AimEvent {
  const WaitingAimEvent();
}
