import 'dart:async';

import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:dart_helpers/dart_helpers.dart' hide Colors, Sphere;
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../share/share.dart';

part 'layouts/layout.dart';
part 'layouts/wrap.dart';

part 'widgets/content.dart';

part 'events.dart';
part 'page.dart';
part 'pool.dart';
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
        InitializingManaEvent e => _onInitializing(e, emit),
        SetNumberManaEvent e => _onSetNumber(e, emit),
        SetLayoutManaEvent e => _onSetLayout(e, emit),
        FillManaEvent e => _onFill(e, emit),
        DrainManaEvent e => _onDrain(e, emit),
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

  Future<void> _onSetNumber(
    SetNumberManaEvent event,
    Emitter<ManaState> emit,
  ) async {
    emit(state.copyWith(limitCount: event.number));
  }

  Future<void> _onSetLayout(
    SetLayoutManaEvent event,
    Emitter<ManaState> emit,
  ) async {
    emit(state.copyWith(layout: event.layout));
  }

  Future<void> _onFill(
    FillManaEvent event,
    Emitter<ManaState> emit,
  ) async {
    // splitting by 1
    if (event.count > 1) {
      var delay = 0;
      for (var i = 0; i < event.count; ++i) {
        delay += i * randomIntRange(60, 120);
        Future.delayed(delay.ms, () => add(const FillManaEvent()));
      }
      return;
    }

    // always 1 mana
    final freeCells = state.pool.freeCells();
    if (freeCells.isEmpty) {
      // all cells filled, just skip this event
      return;
    }

    // fill a random cell
    state.pool.data[freeCells.first] = SphereData();
    emit(state.copyWith(pool: ManaPool.filled(data: state.pool.data)));
  }

  Future<void> _onDrain(
    DrainManaEvent event,
    Emitter<ManaState> emit,
  ) async {
    // splitting by 1
    if (event.count > 1) {
      var delay = 0;
      for (var i = 0; i < event.count; ++i) {
        delay += i * randomIntRange(60, 120);
        Future.delayed(delay.ms, () => add(const DrainManaEvent()));
      }
      return;
    }

    // always 1 mana
    final filledCells = state.pool.filledCells();
    if (filledCells.isEmpty) {
      // all cells empty, just skip this event
      return;
    }

    // free a random cell
    state.pool.data[filledCells.first] = null;
    emit(state.copyWith(pool: ManaPool.filled(data: state.pool.data)));
  }

  Future<void> _onWaiting(
    WaitingManaEvent event,
    Emitter<ManaState> emit,
  ) async {
    emit(state.copyWith(state: ManaStateEnum.waiting));
  }
}
