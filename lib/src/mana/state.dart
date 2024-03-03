part of 'bloc.dart';

class ManaState extends Equatable {
  const ManaState({
    this.state = ManaStateEnum.unspecified,
    this.count = 0,
  });

  final ManaStateEnum state;
  final int count;

  ManaState copyWith({
    ManaStateEnum? state,
    int? count,
  }) =>
      ManaState(
        state: state ?? this.state,
        count: count ?? this.count,
      );

  @override
  List<Object?> get props => [state, count];
}
