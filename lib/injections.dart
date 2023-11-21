import 'package:get_it/get_it.dart';
import 'package:march_cycle_predictor/features/feature_period/presentation/bloc/period_bloc.dart';

GetIt locator = GetIt.I;

setup() async {
  //bloc class
  locator.registerLazySingleton<PeriodBloc>(
    () => PeriodBloc(),
  );
}
