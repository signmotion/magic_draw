part of 'bloc.dart';

class MDState extends Equatable {
  const MDState({
    this.state = MDStateEnum.unspecified,
  });

  final MDStateEnum state;

  MDState copyWith({
    MDStateEnum? state,
  }) =>
      MDState(
        state: state ?? this.state,
      );

  @override
  List<Object?> get props => [state];
}
