part of 'calculate_bloc.dart';

@freezed
class CalculateEvent with _$CalculateEvent {
  const CalculateEvent._();

  const factory CalculateEvent.calculate() = _CalculateEvent;
}
