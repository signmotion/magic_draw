part of 'bloc.dart';

class ManaState extends Equatable {
  const ManaState({
    this.state = ManaStateEnum.unspecified,
    required this.pool,
    required this.layout,
  });

  final ManaStateEnum state;

  final ManaPool pool;
  final ManaLayout layout;

  ManaState copyWith({
    ManaStateEnum? state,
    ManaPool? pool,
    ManaLayout? layout,
  }) =>
      ManaState(
        state: state ?? this.state,
        pool: pool ?? this.pool,
        layout: layout ?? this.layout,
      );

  @override
  List<Object?> get props => [state, pool, layout];
}
