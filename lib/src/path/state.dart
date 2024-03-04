part of 'bloc.dart';

class PathState extends Equatable {
  const PathState({
    this.state = PathStateEnum.unspecified,
    this.path,
  });

  final PathStateEnum state;
  final Path? path;

  PathState copyWith({
    PathStateEnum? state,
    Path? path,
  }) =>
      PathState(
        state: state ?? this.state,
        path: path ?? this.path,
      );

  @override
  List<Object?> get props => [state, path];
}
