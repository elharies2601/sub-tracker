import 'package:intl/intl.dart';

extension DataTimeExtension on DateTime {
  String toFormatString({String format = 'yyyy-MM-dd'}) {
    return DateFormat(format, "id_ID").format(this);
  }
}