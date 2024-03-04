part of 'bloc.dart';

abstract class ManaEvent extends Equatable {
  const ManaEvent();

  @override
  List<Object?> get props => [];
}

class InitializingManaEvent extends ManaEvent {
  const InitializingManaEvent();
}

class AddWidgetManaEvent extends ManaEvent {
  const AddWidgetManaEvent({
    required this.key,
    required this.widget,
  });

  final GlobalKey key;
  final Widget widget;

  @override
  List<Object?> get props => [...super.props, key, widget];
}

class RemoveWidgetManaEvent extends ManaEvent {
  const RemoveWidgetManaEvent({required this.key});

  final GlobalKey key;

  @override
  List<Object?> get props => [...super.props, key];
}

class SetNumberManaEvent extends ManaEvent {
  const SetNumberManaEvent({this.number = 1});

  final int number;

  @override
  List<Object?> get props => [...super.props, number];
}

class SetLayoutManaEvent extends ManaEvent {
  const SetLayoutManaEvent({required this.layout});

  final ManaLayout layout;

  @override
  List<Object?> get props => [...super.props, layout];
}

class FillManaEvent extends ManaEvent {
  const FillManaEvent({this.count = 1});

  final int count;

  @override
  List<Object?> get props => [...super.props, count];
}

class DrainManaEvent extends ManaEvent {
  const DrainManaEvent({this.count = 1});

  final int count;

  @override
  List<Object?> get props => [...super.props, count];
}

class WaitingManaEvent extends ManaEvent {
  const WaitingManaEvent();
}
