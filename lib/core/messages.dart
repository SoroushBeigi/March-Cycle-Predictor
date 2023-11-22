import 'package:intl/intl.dart';

class Messages {
  static String cycleLengthWarning(int difference) =>
      'There is a $difference day difference between your average cycle length and one of your recent cycles.\nPlease consult a doctor soon.';

  static String resultMessage(List<DateTime> dates) {
    String message = 'Your next three cycles will propably start at these dates:\n\n';
    for(DateTime date in dates){
      message += ' -${DateFormat.yMMMMd().format(date)}\n';
    }
    return message;
  }
}
