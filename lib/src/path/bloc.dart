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

class PathBloc extends Bloc<PathEvent, PathState> {
  PathBloc({
    required PathState state,
  }) : super(state) {
    on<PathEvent>(
      _onEvent,
      transformer: sequential(),
    );

    logi('$runtimeType created with state `$state`.');
  }

  Future<void> _onEvent(
    PathEvent event,
    Emitter<PathState> emit,
  ) async {
    logi('$event');

    try {
      return switch (event) {
        // initializing events
        InitializingPathEvent e => _onInitializing(e, emit),
        WaitingPathEvent e => _onWaiting(e, emit),

        // unsupported event
        PathEvent e => throw UnsupportedError('$e'),
      };
    } catch (ex) {
      loge(ex);
      add(const WaitingPathEvent());
    }
  }

  Future<void> _onInitializing(
    InitializingPathEvent event,
    Emitter<PathState> emit,
  ) async {
    add(const WaitingPathEvent());
  }

  Future<void> _onWaiting(
    WaitingPathEvent event,
    Emitter<PathState> emit,
  ) async {
    emit(state.copyWith(state: PathStateEnum.waiting));
  }
}
