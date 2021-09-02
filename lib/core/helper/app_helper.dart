import 'package:data_connection_checker/data_connection_checker.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';


class AppHelper {
  static String getDateFromDateTime(String dateFormat, DateTime dateTime) {
    var formatter = new DateFormat(dateFormat);
    return formatter.format(dateTime);
  }

  static DateTime getDateTimeFromStringDate(String strDate) {
    if (strDate.isEmpty) return null;
    return DateTime.parse(strDate);
  }

  static String getDateFromStringDate(String dateFormat, String strDate) {
    if (strDate.isEmpty || strDate == null) return strDate;
    debugPrint("strDate===>$strDate");
    var date = DateTime.parse(strDate);
    debugPrint("parse strDate===>$date");
    var formatter = new DateFormat(dateFormat);
    return formatter.format(date);
  }


  static Future<bool> isInternetConnectionAvailable() async {
    return await DataConnectionChecker().hasConnection;
  }

}
