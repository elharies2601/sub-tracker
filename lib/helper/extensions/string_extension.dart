import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:sub_tracker/helper/constants/const_billing_cycle.dart';
import 'package:sub_tracker/helper/extensions/data_time_extension.dart';

extension StringExtension on String {
  DateTime toDateTime({String f = 'yyyy-MM-dd'}) {
    DateFormat format = DateFormat(f, "id_ID");
    return format.parse(this);
  }

  String removeExtraSpaces() {
    return replaceAll(RegExp(r'\s+'), ' ').trim();
  }

  String capitalizeWord() {
    return split(' ').map((word) {
      if (word.isEmpty) return '';
      return '${word[0].toUpperCase()}${word.substring(1).toLowerCase()}';
    }).join(' ');
  }

  String calculateNextPayment({String billingCycle = ConstBillingCycle.bulanan}) {
    var selectedDate = toDateTime();
    final nextWeek = selectedDate.add(const Duration(days: 7));
    final nextYear = DateTime(selectedDate.year+1, selectedDate.month, selectedDate.day);

    DateTime nextMonth;
    if (selectedDate.month == 12) {
      nextMonth = DateTime(selectedDate.year + 1, 1, selectedDate.day);
    } else {
      int nextMonthDays = DateTime(selectedDate.year, selectedDate.month + 2, 0).day;
      int day = selectedDate.day > nextMonthDays ? nextMonthDays : selectedDate.day;
      nextMonth = DateTime(selectedDate.year, selectedDate.month + 1, day);
    }

    if (billingCycle.toLowerCase() == ConstBillingCycle.bulanan.toLowerCase()) {
      return nextMonth.toFormatString();
    } else if (billingCycle.toLowerCase() == ConstBillingCycle.mingguan.toLowerCase()) {
      return nextWeek.toFormatString();
    } else {
      return nextYear.toFormatString();
    }
  }

  int calculateDifferenceDay() {
    var nextDate = toDateTime();
    var dateNow = DateTime.now();
    var diff = dateNow.difference(nextDate);
    return diff.inDays;
  }
}