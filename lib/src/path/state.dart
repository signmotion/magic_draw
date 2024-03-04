part of 'bloc.dart';

class PathState extends Equatable {
  const PathState({
    this.state = PathStateEnum.unspecified,
    this.pathData = const [],
  });

  final PathStateEnum state;
  final List<PathData> pathData;

  PathState copyWith({
    PathStateEnum? state,
    List<PathData>? pathData,
  }) =>
      PathState(
        state: state ?? this.state,
        pathData: pathData ?? this.pathData,
      );

  @override
  List<Object?> get props => [state, pathData];
}

class PathData extends Equatable {
  const PathData({
    required this.from,
    required this.to,
    required this.path,
  });

  final Offset from;
  final Offset to;
  final Path? path;

  @override
  List<Object?> get props => [from, to, path];
}
