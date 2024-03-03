part of 'bloc.dart';

class BackgroundState extends Equatable {
  const BackgroundState({
    this.state = BackgroundStateEnum.unspecified,
    this.child,
  });

  final BackgroundStateEnum state;
  final Widget? child;

  BackgroundState copyWith({
    BackgroundStateEnum? state,
    Widget? child,
  }) =>
      BackgroundState(
        state: state ?? this.state,
        child: child ?? this.child,
      );

  @override
  List<Object?> get props => [state, child];
}
