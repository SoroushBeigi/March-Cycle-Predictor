import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

part 'period_event.dart';
part 'period_state.dart';

class PeriodBloc extends Bloc<PeriodEvent, PeriodState> {
  List<DateTime> chosenDates = [];

  PeriodBloc() : super(PeriodInitial()) {
    on<AddDateEvent>(_addDate);
    on<DeleteDateEvent>(_deleteDate);
    on<CalculateCyclesEvent>(_calculate);
  }

  void _addDate(AddDateEvent event, Emitter<PeriodState> emit) {
    chosenDates.add(event.date);
    emit(ChosenDatesChangedState(dates: chosenDates));
  }

  void _deleteDate(DeleteDateEvent event, Emitter<PeriodState> emit) {
    chosenDates.removeAt(event.index);
    emit(ChosenDatesChangedState(dates: chosenDates));
  }

  void _calculate(CalculateCyclesEvent event, Emitter<PeriodState> emit) {
    //Validating the given dates before doing the calculations
    for (int i = 0; i < chosenDates.length - 1; i++) {
      DateTime current = chosenDates[i];
      DateTime next = chosenDates[i + 1];

      //Sorting the list to avoid negative durations later
      chosenDates.sort();

      // Calculate the difference in days between current and next
      int dayDifference = next.difference(current).inDays;

      // Check if the day difference is within the desired range
      if (dayDifference < 23 || dayDifference > 35) {
        //Error
      } 
    }
    //Do the calculations here
  }
}
