import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../aim/bloc.dart';
import '../background/bloc.dart';
import '../mana/bloc.dart';
import '../path/bloc.dart';

part 'widgets/content.dart';
part 'widgets/gesture_layer.dart';

part 'events.dart';
part 'page.dart';
part 'state_enum.dart';
part 'state.dart';

/// MagicDrawBloc
class MDBloc extends Bloc<MDEvent, MDState> {
  MDBloc({
    required MDState state,
    required this.backgroundBloc,
    required this.aimBloc,
    required this.pathBloc,
    required this.manaBloc,
  }) : super(state) {
    on<MDEvent>(
      _onEvent,
      transformer: sequential(),
    );
  }

  final BackgroundBloc backgroundBloc;
  final AimBloc aimBloc;
  final PathBloc pathBloc;
  final ManaBloc manaBloc;

  Future<void> _onEvent(
    MDEvent event,
    Emitter<MDState> emit,
  ) async {
    try {
      return switch (event) {
        InitializingMDEvent e => _onInitializing(e, emit),
        WaitingMDEvent e => _onWaiting(e, emit),

        // unsupported event
        MDEvent e => throw UnsupportedError('$e'),
      };
    } catch (ex) {
      add(const WaitingMDEvent());
      rethrow;
    }
  }

  Future<void> _onInitializing(
    InitializingMDEvent event,
    Emitter<MDState> emit,
  ) async {
    add(const WaitingMDEvent());
  }

  Future<void> _onWaiting(
    WaitingMDEvent event,
    Emitter<MDState> emit,
  ) async {
    emit(state.copyWith(state: MDStateEnum.waiting));
  }
}
