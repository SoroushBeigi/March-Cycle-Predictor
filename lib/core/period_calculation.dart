import 'package:march_cycle_predictor/core/constants.dart';

class PeriodCalculation{
  static DateTime calculate(List<DateTime> lastCycles, int averageLength){
    return DateTime.now();
  }

  static String? datesError(List<DateTime> chosenDates,int averageLength, maximumDifference){
    for (int i = 0; i < chosenDates.length - 1; i++) {
      DateTime current = chosenDates[i];
      DateTime next = chosenDates[i + 1];

      // Calculate the difference in days between current and next, which is the cycle length.
      int cycleLength = next.difference(current).inDays;

      
      final int difference = (cycleLength - averageLength).abs();
      if (difference > maximumDifference) {
        return Constants.cycleLengthWarning(difference);
      }
    }
    return null;
  }
}