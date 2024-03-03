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

class BackgroundBloc extends Bloc<BackgroundEvent, BackgroundState> {
  BackgroundBloc({
    required BackgroundState state,
  }) : super(state) {
    on<BackgroundEvent>(
      _onEvent,
      transformer: sequential(),
    );

    logi('$runtimeType created with state `$state`.');
  }

  Future<void> _onEvent(
    BackgroundEvent event,
    Emitter<BackgroundState> emit,
  ) async {
    logi('$event');

    try {
      return switch (event) {
        // initializing events
        InitializingBackgroundEvent e => _onInitializing(e, emit),
        SetContentBackgroundEvent e => _onSetContent(e, emit),
        WaitingBackgroundEvent e => _onWaiting(e, emit),

        // unsupported event
        BackgroundEvent e => throw UnsupportedError('$e'),
      };
    } catch (ex) {
      loge(ex);
      add(const WaitingBackgroundEvent());
    }
  }

  Future<void> _onInitializing(
    InitializingBackgroundEvent event,
    Emitter<BackgroundState> emit,
  ) async {
    add(const WaitingBackgroundEvent());
  }

  Future<void> _onSetContent(
    SetContentBackgroundEvent event,
    Emitter<BackgroundState> emit,
  ) async {
    emit(state.copyWith(child: event.child));
  }

  Future<void> _onWaiting(
    WaitingBackgroundEvent event,
    Emitter<BackgroundState> emit,
  ) async {
    emit(state.copyWith(state: BackgroundStateEnum.waiting));
  }
}
