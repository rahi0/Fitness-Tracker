import 'package:intl/intl.dart';
import 'package:timezone/standalone.dart' as tz;

class CustomDateTimeFormatter {
  static final dateFormatterYMD =
      DateFormat('yyyy-MM-dd'); // example: 2020-09-20
  static final dateFormatterDMY =
      DateFormat('dd-MM-yyyy'); // example: 20-09-2020
  static final dateFormatterDMYslash =
      DateFormat('dd/MM/yyyy'); // example: 20/09/2020
  static final dateFormatterDMY2 =
      DateFormat('dd-MM-yy'); // example: 20-09-2020
  static final timeFormatter = DateFormat('HH:mm'); // example: 23:59
  static final timeFormatterHMS = DateFormat('HH:mm:ss'); // example: 23:59
  static final timeAMPMFormatter = DateFormat('hh:mm a'); // example: 11:59
  static final dateTimeFormatter =
      DateFormat('yyyy-MM-dd HH:mm'); // example: 2020-09-20 23:59
  static final dateTimeSecondFormatter =
      DateFormat('yyyy-MM-dd HH:mm:ss'); // example: 2021-09-16 23:59:59
  static final dateTimeFormatter2 =
      DateFormat('dd-MM-yyyy HH:mm'); // example: 20-09-2020 23:59
  static final dateTimeFormatter3 =
      DateFormat('d MMM, yyyy, HH:mm'); // example: 20 Feb, 2020 23:59
  static final dateMonthNameFormatter = DateFormat('MMM d'); // example: Sep 22
  static final dateYearMonthNameFormatter =
      DateFormat('MMM d yyyy'); // example: Sep 22 2020
  static final dateYearMonthNameCommaFormatter =
      DateFormat('MMM d, yyyy'); // example: Sep 22, 2020
  static final expiryDateFormatter = DateFormat('MM-yy'); // example: 09-20
  static final yearFormatter = DateFormat('yyyy'); // example: 2020
  static final monthFormatter = DateFormat('MM'); // example: 09
  static final monthNameFormatter = DateFormat('MMM'); // example: Oct
  static final dayNameFormatter = DateFormat('EEEE'); // example: Thursday
  static final dayNameTimeFormatter =
      DateFormat('EEEE, HH:mm'); // example: Thursday, 23:59
  static final dayNameShortTimeFormatter =
      DateFormat('E, HH:mm'); // example: Wed, 12:05
  static final dateFormatterMMDD = DateFormat('MMdd'); // example:
  static final londonTime =
      tz.getLocation('Europe/London'); // to get time in Uk timezone
  // *** to use it
  // DateTime currentDate = DateTime.now();
  // final localizedDateTime = tz.TZDateTime.from(currentDate, CustomDateTimeFormatter.londonTime);
  // String curTime = CustomDateTimeFormatter.dateTimeSecondFormatter.format(localizedDateTime);

  getLondonTime({required DateTime currentDate}) async {
    return tz.TZDateTime.from(currentDate, CustomDateTimeFormatter.londonTime);
  }

  // CustomDateTimeFormatter.dateTimeSecondFormatter.format(DateTime.now()),
  // ***

  // *** to check date time expiration and validation
  // final now = DateTime.now();
  // final expirationDate = DateTime(2021, 1, 10);
  // final bool isExpired = expirationDate.isBefore(now);
  // final bool isFuture = expirationDate.isAfter(now);
}
