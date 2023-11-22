part of 'period_bloc.dart';

@immutable
sealed class PeriodEvent {}

class AddDateEvent extends PeriodEvent {
  final DateTime date;
  AddDateEvent({required this.date});
}

class DeleteDateEvent extends PeriodEvent {
  final int index;
  DeleteDateEvent({required this.index});
}

class CalculateCyclesEvent extends PeriodEvent {
  final int averageCycle;
  CalculateCyclesEvent({required this.averageCycle});
}
