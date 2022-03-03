import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'const.dart';

class Functions {
  DateTime formatDate(DateTime dateTime) {
    return DateTime.parse(DateFormat("yyyy-MM-dd").format(dateTime).toString());
  }

  DateTime formatDateFromString(String dateTime) {
    return DateTime.parse(dateTime);
  }

  String formatDateString(DateTime dateTime) {
    return DateFormat("yyyy-MM-dd").format(dateTime).toString();
  }

  Widget amountWidget(double amount, double fontSize) {
    var formatter = NumberFormat('#,###,###.##');
    var formattedAmount = formatter.format(amount);
    return Text(
      '${Const.phpSymbol}$formattedAmount',
      style: TextStyle(
          fontSize: fontSize,
          color: amount < 0
              ? Const.amountColorNegative
              : Const.amountColorPositive),
    );
  }

  Widget amountWidgetSummary(double amount) {
    var formatter = NumberFormat('#,###,###');
    var formattedAmount = formatter.format(amount);
    //formattedAmount = formattedAmount == '000' ? '0.0' : formattedAmount;
    return Text(
      '${Const.phpSymbol}$formattedAmount',
      maxLines: 3,
      style: TextStyle(
          fontSize: Const.amountTotalFontSize,
          color: amount < 0
              ? Const.amountColorNegative
              : Const.amountColorPositive),
    );
  }
}
