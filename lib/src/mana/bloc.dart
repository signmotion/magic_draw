import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:dart_helpers/dart_helpers.dart' hide Colors;
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'widgets/content.dart';

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
        AddManaEvent e => _onAdd(e, emit),
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

  Future<void> _onAdd(
    AddManaEvent event,
    Emitter<ManaState> emit,
  ) async {
    emit(state.copyWith(count: state.count + event.count));
  }

  Future<void> _onWaiting(
    WaitingManaEvent event,
    Emitter<ManaState> emit,
  ) async {
    emit(state.copyWith(state: ManaStateEnum.waiting));
  }
}
