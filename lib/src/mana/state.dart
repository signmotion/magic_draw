part of 'bloc.dart';

class ManaState extends Equatable {
  const ManaState({
    this.state = ManaStateEnum.unspecified,
    this.count = 0,
    this.limitCount = 1 << 32,
  });

  final ManaStateEnum state;
  final int count;
  final int limitCount;

  ManaState copyWith({
    ManaStateEnum? state,
    int? count,
    int? limitCount,
  }) =>
      ManaState(
        state: state ?? this.state,
        count: count ?? this.count,
        limitCount: limitCount ?? this.limitCount,
      );

  @override
  List<Object?> get props => [state, count, limitCount];
}
