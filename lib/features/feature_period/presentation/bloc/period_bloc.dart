import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';


part 'period_event.dart';
part 'period_state.dart';

class PeriodBloc extends Bloc<PeriodEvent, PeriodState> {
  PeriodBloc() : super(PeriodInitial()) {
    on<PeriodEvent>((event, emit) {
      
    });
  }
}
