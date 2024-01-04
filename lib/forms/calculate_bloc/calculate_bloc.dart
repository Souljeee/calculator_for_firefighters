import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'calculate_event.dart';

part 'calculate_state.dart';

part 'calculate_bloc.freezed.dart';

class CalculateBloc extends Bloc<CalculateEvent, CalculateState> {
  CalculateBloc() : super(const CalculateState.idle()) {
    on<CalculateEvent>(
      (event, emit) => event.map(
        calculate: (_) => _onCalculateEvent(emit),
      ),
    );
  }

  Future<void> _onCalculateEvent(Emitter<CalculateState> emit) async{
    emit(const CalculateState.calculated());
    emit(const CalculateState.idle());
  }
}
