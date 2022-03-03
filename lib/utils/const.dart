import 'package:flutter/material.dart';

class Const {
  //text
  static const AppName = 'Pera Manager';
  static String databasePrefix = '/moneymanager';
  static const String phpSymbol = '₱ ';
  static const String addTransactionName = 'Add Transaction';

  //primary colors
  static const primaryColor = Color.fromARGB(255, 123, 82, 245);
  static const secondaryColor = Color.fromARGB(255, 115, 74, 238);
  static const scaffoldBgColor = Colors.white;
  static const textColor1 = Color.fromARGB(255, 1, 18, 34);
  static const textColor2 = Colors.white;
  static const selectedItemColor = Color.fromARGB(255, 1, 18, 34);
  static const summaryAmountsBackground = Colors.white;
  static const unSelectedButtonColor = Color.fromARGB(137, 124, 123, 123);
  static const selectedButtonColor = primaryColor;
  static const buttonDefaultColor = primaryColor;

  //amount colors
  static const amountColorPositive = Color.fromARGB(255, 7, 166, 60);
  static const amountColorNegative = Colors.red;

  //gradient background color
  static const bgColor = Color.fromARGB(255, 173, 68, 243);
  static const bgColor2 = Color.fromARGB(255, 93, 46, 233);
  static const bgColor3 = Color.fromARGB(255, 116, 72, 250);

  //fonts size

  static const double defaultFontSize = 14.0;
  static const double headerFontSize = 16.0;
  static const double amountTotalFontSize = 14.0;
  static const double listTitleFontSize = 14.0;
  static const double listSubTitleFontSize = 12.0;
  static const double transactionFontSizeTitle = 12.0;
  static const double transactionFontSizeSubTitle = 11.0;
  static const double paymentModeButtonFontSize = 9.0;
}
