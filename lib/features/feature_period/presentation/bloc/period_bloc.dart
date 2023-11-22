import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:march_cycle_predictor/core/period_calculation.dart';

part 'period_event.dart';
part 'period_state.dart';

class PeriodBloc extends Bloc<PeriodEvent, PeriodState> {
  List<DateTime> chosenDates = [];
  int averageInputLength = 0;
  PeriodBloc() : super(PeriodInitial()) {
    on<AddDateEvent>(_addDate);
    on<DeleteDateEvent>(_deleteDate);
    on<CalculateCyclesEvent>(_calculate);
    on<TextFieldChangedEvent>(_validateTextfield);
  }

  void _addDate(AddDateEvent event, Emitter<PeriodState> emit) {
    chosenDates.add(event.date);
    emit(InputChangedState());
  }

  void _deleteDate(DeleteDateEvent event, Emitter<PeriodState> emit) {
    chosenDates.removeAt(event.index);
    emit(InputChangedState());
  }

  void _calculate(CalculateCyclesEvent event, Emitter<PeriodState> emit) {
    //Validating the given average length
    final averageCycle = event.averageCycle;
    if (averageCycle < 21 || averageCycle > 35) {
      emit(OutOfRangeLengthState());
      return;
    }

//Sorting the list to avoid negative durations later
    chosenDates.sort();

    //I'm using 6 as the maximumDifference,
    //It means that if one of the user's recent cycles is 7 days longer or shorter than her average cycle length, she should consult a doctor
    String? error = PeriodCalculation.datesError(chosenDates, averageCycle, 6);
    if (error == null) {
      final output = PeriodCalculation.calculate(chosenDates, event.averageCycle);
      print(output);
    } else {
      emit(CalculationDoneState(
        isWarning: true,
        result: error,
      ));
    }
  }

  void _validateTextfield(
      TextFieldChangedEvent event, Emitter<PeriodState> emit) {
    averageInputLength = event.value.length;
    emit(InputChangedState());
  }
}
