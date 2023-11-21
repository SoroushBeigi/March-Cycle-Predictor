import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

part 'period_event.dart';
part 'period_state.dart';

class PeriodBloc extends Bloc<PeriodEvent, PeriodState> {

  List<DateTime> chosenDates=[];

  PeriodBloc() : super(PeriodInitial()) {
    on<AddDateEvent>(_addDate);
    on<DeleteDateEvent>(_deleteDate);
  }

  Future<void> _addDate(AddDateEvent event, Emitter<PeriodState> emit)async {
    chosenDates.add(event.date);
    emit(ChosenDatesChangedState(dates:chosenDates));
  }

  void _deleteDate(DeleteDateEvent event, Emitter<PeriodState> emit) {
    chosenDates.removeAt(event.index);
    emit(ChosenDatesChangedState(dates:chosenDates));
  }
}
