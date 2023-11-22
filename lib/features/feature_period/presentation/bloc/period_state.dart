part of 'period_bloc.dart';

@immutable
sealed class PeriodState {}

final class PeriodInitial extends PeriodState {}

final class OutOfRangeLengthState extends PeriodState {}

final class InputChangedState extends PeriodState {
  // final int? averageLength;
  // final List<DateTime> dates;
  // InputChangedState({required this.averageLength,required this.dates});
}

final class CalculationDoneState extends PeriodState {
  final bool isWarning;
  final String result;
  CalculationDoneState({required this.isWarning, required this.result});
}
