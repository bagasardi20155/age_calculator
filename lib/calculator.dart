import 'package:intl/intl.dart';
import 'package:age_calculator/age_calculator.dart';
class Calculator {
  Calculator(
      {required this.dateTime1, required this.dateTime2,});

  DateTime? dateTime1;
  DateTime? dateTime2;
  DateDuration? totalTime;

  DateDuration? result() {
    totalTime = AgeCalculator.age(dateTime1!, today: dateTime2);
  }
}
