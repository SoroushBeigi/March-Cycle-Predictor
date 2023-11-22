import 'package:march_cycle_predictor/core/constants.dart';

class PeriodCalculation {
  static List<DateTime> calculate(
      List<DateTime> lastCycles, int averageLength) {
    lastCycles.sort();
    List<Duration> cycleDurations = [];
    //We are starting from second element to calculate the length between dates
    for (int i = 1; i < lastCycles.length; i++) {
      Duration cycle = lastCycles[i - 1].difference(lastCycles[i]);
      cycleDurations.add(cycle);
    }
    final List<int> cycleLengths =
        cycleDurations.map((duration) => duration.inDays.abs()).toList();

    //We calculate the weighted averageof the last cycles.
    //The weights should be determined by testing with real-world data
    final weightedAverage = calculateWeightedAverage(
        cycleLengths.map((e) => e.toDouble()).toList(), [1, 5.2]);

    //In my experiments, involving the user's average length resulted in an output closer to real-world data.
    final calculatedAverage = (weightedAverage + averageLength) / 2;
    final roundedAverage = calculatedAverage.round();
    DateTime firstNextDate =
        lastCycles.last.add(Duration(days: roundedAverage));
    List<DateTime> outputList = [firstNextDate];
    for (int i = 1; i < lastCycles.length; i++) {
      outputList.add(outputList[i - 1].add(Duration(days: roundedAverage)));
    }
    return outputList;
  }

  static String? datesError(
      List<DateTime> chosenDates, int averageLength, maximumDifference) {
    chosenDates.sort();
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

  static double calculateWeightedAverage(
      List<double> values, List<double> weights) {
    if (values.length != weights.length || values.isEmpty || weights.isEmpty) {
      throw ArgumentError(
          "Values and weights must have the same length and not be empty.");
    }

    double sumValuesTimesWeights = 0;
    double sumWeights = 0;

    for (int i = 0; i < values.length; i++) {
      sumValuesTimesWeights += values[i] * weights[i];
      sumWeights += weights[i];
    }

    if (sumWeights == 0) {
      throw ArgumentError("Sum of weights cannot be zero.");
    }

    return sumValuesTimesWeights / sumWeights;
  }
}
