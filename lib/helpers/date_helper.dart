import 'package:intl/intl.dart';

class DateHelper {
  static String formatDate(DateTime dateTime, {String format = 'dd/MM/yyyy'}) {
    final dateFormat = DateFormat(format);
    return dateFormat.format(dateTime).toString();
  }
}
