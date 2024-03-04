part of 'bloc.dart';

typedef TapEffectBuilder = Widget Function({
  required BuildContext context,
});

class AimState extends Equatable {
  const AimState({
    this.state = AimStateEnum.unspecified,
    this.tapEffectBuilder,
    this.tapEffectPositions = const [],
    this.tapEffectWidgets = const [],
  });

  final AimStateEnum state;

  final TapEffectBuilder? tapEffectBuilder;
  final List<Offset> tapEffectPositions;
  final List<Widget> tapEffectWidgets;

  AimState copyWith({
    AimStateEnum? state,
    TapEffectBuilder? tapEffectBuilder,
    List<Offset>? tapEffectPositions,
    List<Widget>? tapEffectWidgets,
  }) =>
      AimState(
        state: state ?? this.state,
        tapEffectBuilder: tapEffectBuilder ?? this.tapEffectBuilder,
        tapEffectPositions: tapEffectPositions ?? this.tapEffectPositions,
        tapEffectWidgets: tapEffectWidgets ?? this.tapEffectWidgets,
      );

  @override
  List<Object?> get props => [
        state,
        tapEffectBuilder,
        tapEffectPositions,
        tapEffectWidgets,
      ];
}
