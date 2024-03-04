part of 'bloc.dart';

class ManaState extends Equatable {
  const ManaState({
    this.state = ManaStateEnum.unspecified,
    this.limitCount = 1 << 32,
    required this.pool,
    required this.layout,
  });

  final ManaStateEnum state;
  final int limitCount;

  final ManaPool pool;
  final ManaLayout layout;

  ManaState copyWith({
    ManaStateEnum? state,
    int? limitCount,
    ManaPool? pool,
    ManaLayout? layout,
  }) =>
      ManaState(
        state: state ?? this.state,
        limitCount: limitCount ?? this.limitCount,
        pool: pool ?? this.pool,
        layout: layout ?? this.layout,
      );

  @override
  List<Object?> get props => [state, limitCount, pool, layout];
}
