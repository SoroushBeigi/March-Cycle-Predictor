part of 'period_bloc.dart';

@immutable
sealed class PeriodState {}

final class PeriodInitial extends PeriodState {}

final class ChosenDatesChangedState extends PeriodState{
  final List<DateTime> dates;

  ChosenDatesChangedState({required this.dates});
}
