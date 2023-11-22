import 'package:flutter_test/flutter_test.dart';
import 'package:march_cycle_predictor/core/period_calculation.dart';

void main() {
  group('PeriodCalculation', () {
    test('A logical analysis', () {
      //If the average length is 31 days and the last three cycles started at 22th of each months,
      //It makes sense to expect the next cycles to start around 22th of the nexts months (greater than 20 and less that 24)
      List<DateTime> lastCycles = [
        DateTime(2023, 11, 22),
        DateTime(2023, 12, 22),
        DateTime(2023, 10, 22),
      ];
      int averageLength = 31;

      List<DateTime> result =
          PeriodCalculation.calculate(lastCycles, averageLength);

      expect(
          result, hasLength(3)); // Check if the result list's length is correct

      expect(result[0].month, equals(1)); //Checking the month
      expect(result[0].day, greaterThanOrEqualTo(20)); //Cheking days range
      expect(result[0].day, lessThanOrEqualTo(24)); //Cheking days range

      expect(result[1].month, equals(2)); //Checking the month
      expect(result[1].day, greaterThanOrEqualTo(20)); //Cheking days range
      expect(result[1].day, lessThanOrEqualTo(24)); //Cheking days range

      expect(result[2].month, equals(3)); //Checking the month
      expect(result[2].day, greaterThanOrEqualTo(20)); //Cheking days range
      expect(result[2].day, lessThanOrEqualTo(24)); //Cheking days range
    });

    test('Using real-world data', () {
      //This test's data is collected from a female user from Clue's app 
      List<DateTime> lastCycles = [
        DateTime(2023, 9, 5),
        DateTime(2023, 10, 2),
        DateTime(2023, 11, 8),
      ];
      int averageLength = 32;

      List<DateTime> result =
          PeriodCalculation.calculate(lastCycles, averageLength);

      expect(
          result, hasLength(3)); // Check if the result list's length is correct

      //The actual predicted day by Clue's app was 13th of December    
      expect(result[0].month, equals(12)); //Check the month
      expect(result[0].day, greaterThanOrEqualTo(11)); 
      expect(result[0].day, lessThanOrEqualTo(15)); 

      //The actual predicted day by Clue's app was 15th of January
      expect(result[1].month, equals(1)); //Check the month
      expect(result[1].day, greaterThanOrEqualTo(13)); //Cheking days range
      expect(result[1].day, lessThanOrEqualTo(17)); //Cheking days range

      //The actual predicted day by Clue's app was 19th of February
      expect(result[2].month, equals(2)); //Check the month
      expect(result[2].day, greaterThanOrEqualTo(17)); //Cheking days range
      expect(result[2].day, lessThanOrEqualTo(21)); //Cheking days range
    });
  });
}
