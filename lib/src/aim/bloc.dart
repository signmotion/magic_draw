import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../magic_draw.dart';

part 'widgets/content.dart';

part 'events.dart';
part 'page.dart';
part 'state_enum.dart';
part 'state.dart';

class AimBloc extends Bloc<AimEvent, AimState> {
  AimBloc({
    required AimState state,
  }) : super(state) {
    on<AimEvent>(
      _onEvent,
      transformer: sequential(),
    );
  }

  Future<void> _onEvent(
    AimEvent event,
    Emitter<AimState> emit,
  ) async {
    try {
      return switch (event) {
        InitializingAimEvent e => _onInitializing(e, emit),
        SetTapEffectAimEvent e => _onSetTapEffect(e, emit),
        TapEffectAimEvent e => _onTapEffectAimEvent(e, emit),
        BuildTapEffectAimEvent e => _onBuildTapEffect(e, emit),
        WaitingAimEvent e => _onWaiting(e, emit),

        // unsupported event
        AimEvent e => throw UnsupportedError('$e'),
      };
    } catch (ex) {
      add(const WaitingAimEvent());
      rethrow;
    }
  }

  Future<void> _onInitializing(
    InitializingAimEvent event,
    Emitter<AimState> emit,
  ) async {
    add(const WaitingAimEvent());
  }

  Future<void> _onSetTapEffect(
    SetTapEffectAimEvent event,
    Emitter<AimState> emit,
  ) async {
    emit(state.copyWith(tapEffectBuilder: event.effectBuilder));
  }

  Future<void> _onTapEffectAimEvent(
    TapEffectAimEvent event,
    Emitter<AimState> emit,
  ) async {
    emit(state.copyWith(
      tapEffectPositions: [...state.tapEffectPositions, event.position],
    ));
  }

  Future<void> _onBuildTapEffect(
    BuildTapEffectAimEvent event,
    Emitter<AimState> emit,
  ) async {
    emit(state.copyWith(
      tapEffectWidgets: [...state.tapEffectWidgets, event.widget],
    ));
  }

  Future<void> _onWaiting(
    WaitingAimEvent event,
    Emitter<AimState> emit,
  ) async {
    emit(state.copyWith(state: AimStateEnum.waiting));
  }
}
