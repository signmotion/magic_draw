part of 'bloc.dart';

class PathState extends Equatable {
  const PathState({
    this.state = PathStateEnum.unspecified,
  });

  final PathStateEnum state;

  PathState copyWith({
    PathStateEnum? state,
  }) =>
      PathState(
        state: state ?? this.state,
      );

  @override
  List<Object?> get props => [state];
}
