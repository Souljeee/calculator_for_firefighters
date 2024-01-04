part of 'calculate_bloc.dart';

@freezed
class CalculateState with _$CalculateState {
  const CalculateState._();

  const factory CalculateState.calculated() = _CalculatedState;

  const factory CalculateState.idle() = _IdleState;
}
