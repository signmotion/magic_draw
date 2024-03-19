import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../share/share.dart';

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
  }

  Future<void> _onEvent(
    PathEvent event,
    Emitter<PathState> emit,
  ) async {
    try {
      return switch (event) {
        InitializingPathEvent e => _onInitializing(e, emit),
        ConstructPathEvent e => _onConstruct(e, emit),
        WaitingPathEvent e => _onWaiting(e, emit),

        // unsupported event
        PathEvent e => throw UnsupportedError('$e'),
      };
    } catch (ex) {
      add(const WaitingPathEvent());
      rethrow;
    }
  }

  Future<void> _onInitializing(
    InitializingPathEvent event,
    Emitter<PathState> emit,
  ) async {
    add(const WaitingPathEvent());
  }

  Future<void> _onConstruct(
    ConstructPathEvent event,
    Emitter<PathState> emit,
  ) async {
    final from = event.fromPosition;
    final to = event.toPosition;
    // final middle = to - from;
    // final path = Path()
    //   ..moveTo(from.dx, from.dy)
    //   ..quadraticBezierTo(middle.dx, middle.dy, to.dx, to.dy);
    emit(state.copyWith(
      pathData: [
        ...state.pathData,
        PathData(from: from, to: to, path: null),
      ],
    ));
  }

  Future<void> _onWaiting(
    WaitingPathEvent event,
    Emitter<PathState> emit,
  ) async {
    emit(state.copyWith(state: PathStateEnum.waiting));
  }
}
