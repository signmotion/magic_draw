import 'dart:async';
import 'dart:math';

import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:dart_helpers/dart_helpers.dart' hide Colors, NumDurationExt;
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'widgets/content.dart';
part 'widgets/sphere.dart';
part 'widgets/wrapped_sphere.dart';

part 'events.dart';
part 'page.dart';
part 'state_enum.dart';
part 'state.dart';

class ManaBloc extends Bloc<ManaEvent, ManaState> {
  ManaBloc({
    required ManaState state,
  }) : super(state) {
    on<ManaEvent>(
      _onEvent,
      transformer: sequential(),
    );

    logi('$runtimeType created with state `$state`.');
  }

  Future<void> _onEvent(
    ManaEvent event,
    Emitter<ManaState> emit,
  ) async {
    logi('$event');

    try {
      return switch (event) {
        // initializing events
        InitializingManaEvent e => _onInitializing(e, emit),
        SetLimitCountManaEvent e => _onSetLimitCountManaEvent(e, emit),
        IncrementManaEvent e => _onIncrement(e, emit),
        DecrementManaEvent e => _onDecrement(e, emit),
        WaitingManaEvent e => _onWaiting(e, emit),

        // unsupported event
        ManaEvent e => throw UnsupportedError('$e'),
      };
    } catch (ex) {
      loge(ex);
      add(const WaitingManaEvent());
    }
  }

  Future<void> _onInitializing(
    InitializingManaEvent event,
    Emitter<ManaState> emit,
  ) async {
    add(const WaitingManaEvent());
  }

  Future<void> _onSetLimitCountManaEvent(
    SetLimitCountManaEvent event,
    Emitter<ManaState> emit,
  ) async {
    emit(state.copyWith(limitCount: event.limitCount));
  }

  Future<void> _onIncrement(
    IncrementManaEvent event,
    Emitter<ManaState> emit,
  ) async {
    if (event.count == 1) {
      emit(state.copyWith(
        count: (state.count + 1).clamp(0, state.limitCount),
      ));
      return;
    }

    // splitting by 1
    var p = 0;
    for (var i = 0; i < event.count; ++i) {
      p += i * randomIntRange(60, 120);
      Future.delayed(p.ms, () => add(const IncrementManaEvent()));
    }
  }

  Future<void> _onDecrement(
    DecrementManaEvent event,
    Emitter<ManaState> emit,
  ) async {
    emit(state.copyWith(
      count: (state.count - event.count).clamp(0, state.limitCount),
    ));
  }

  Future<void> _onWaiting(
    WaitingManaEvent event,
    Emitter<ManaState> emit,
  ) async {
    emit(state.copyWith(state: ManaStateEnum.waiting));
  }
}
