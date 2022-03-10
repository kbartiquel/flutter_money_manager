import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:money_manager/models/categories_model.dart';
import 'package:money_manager/models/transaction_item_model.dart' as txItem;
import 'package:money_manager/utils/database.dart';
import 'package:money_manager/utils/enum.dart';

import '../utils/app_functions.dart' as func;

class TransactionsModel with ChangeNotifier {
  List<txItem.TransactionItem> transactionList = [
    //   txItem.TransactionItem(
    //       transactionId: '12',
    //       transactionDate: func.Functions().formatDate(DateTime.now()),
    //       categoryId: '1',
    //       cateGoryname: 'Salary',
    //       notes: 'Salary',
    //       amount: 50000,
    //       paymentMode: PaymentMode.cash),
    //   txItem.TransactionItem(
    //       transactionId: '13',
    //       transactionDate:
    //           // ignore: unnecessary_cast
    //           DateTime.parse(
    //               DateFormat("yyyy-MM-dd").format(DateTime.now()).toString()),
    //       categoryId: '1',
    //       cateGoryname: 'Shopping',
    //       notes: 'Bugas',
    //       amount: -100,
    //       paymentMode: PaymentMode.cash),
    //   txItem.TransactionItem(
    //       transactionId: '14',
    //       transactionDate: DateTime.parse(
    //           DateFormat("yyyy-MM-dd").format(DateTime.now()).toString()),
    //       categoryId: '2',
    //       cateGoryname: 'Shopping',
    //       notes: 'Gatas',
    //       amount: -5000,
    //       paymentMode: PaymentMode.cash),
    //   txItem.TransactionItem(
    //       transactionId: '15',
    //       transactionDate: DateTime.parse('2022-02-23'),
    //       categoryId: '3',
    //       cateGoryname: 'Shopping',
    //       notes: 'Gatas',
    //       amount: -50000,
    //       paymentMode: PaymentMode.cash),
    //   txItem.TransactionItem(
    //       transactionId: '16',
    //       transactionDate: DateTime.parse('2022-02-21'),
    //       categoryId: '3',
    //       cateGoryname: 'Bills',
    //       notes: 'Kuryente',
    //       amount: -2000,
    //       paymentMode: PaymentMode.cash),
    //   txItem.TransactionItem(
    //       transactionId: '17',
    //       transactionDate: DateTime.parse('2022-02-21'),
    //       categoryId: '3',
    //       cateGoryname: 'Bills',
    //       notes: 'Kuryente',
    //       amount: -2000,
    //       paymentMode: PaymentMode.cash),
    //   txItem.TransactionItem(
    //       transactionId: '18',
    //       transactionDate: DateTime.parse('2022-02-19'),
    //       categoryId: '3',
    //       cateGoryname: 'Bills',
    //       notes: 'Rent',
    //       amount: -10000,
    //       paymentMode: PaymentMode.cash),
  ];

  Future addTransactionDB(
      {required String transactionDate,
      required String categoryId,
      required String categoryname,
      required String notes,
      required double amount,
      required PaymentMode paymentMode}) async {
    await TransactionDatabase().add({
      'transactionId': Random().nextInt(10000).toString(),
      'transactionDate': transactionDate,
      'categoryId': categoryId,
      'categoryName': categoryname,
      'notes': notes,
      'amount': amount,
      'paymentmode': getPaymentModeName(paymentMode)
    });
  }

  void addTransaction(
      {required DateTime transactionDate,
      required String categoryId,
      required String categoryname,
      required String notes,
      required double amount,
      required PaymentMode paymentMode}) async {
    addTransactionDB(
            transactionDate:
                func.AppFunctions().formatDateString(transactionDate),
            categoryId: categoryId,
            categoryname: categoryname,
            notes: notes,
            amount: amount,
            paymentMode: paymentMode)
        .then((value) {
      transactionList.add(txItem.TransactionItem(
          transactionId: Random().nextInt(10000).toString(),
          transactionDate: transactionDate,
          categoryId: categoryId,
          cateGoryname: categoryname,
          notes: notes,
          amount: amount,
          paymentMode: paymentMode));
      notifyListeners();
    });
  }

  Future<List> allTransactionListDB() async {
    List l = await TransactionDatabase().listAll();
    return l;
  }

  Future<bool> alltransactionList() async {
    List<txItem.TransactionItem>? transactionListTemp = [];

    List l = await allTransactionListDB();
    for (var element in l) {
      transactionListTemp.add(txItem.TransactionItem(
          transactionId: element['transactionId'],
          transactionDate: func.AppFunctions()
              .formatDateFromString(element['transactionDate']),
          categoryId: element['categoryId'],
          cateGoryname: element['categoryName'],
          notes: element['notes'],
          amount: element['amount'],
          paymentMode: element['paymentmode'].toString().contains('Cash')
              ? PaymentMode.cash
              : PaymentMode.online));
    }

    transactionList = transactionListTemp;
    return true;
  }

  List<DateTime> get getUniqueDates {
    var seen = <DateTime>{};
    List<txItem.TransactionItem> uniqueDates =
        transactionList.where((a) => seen.add(a.transactionDate)).toList();

    return [...seen];
  }

  void test() {}
  List<txItem.TransactionItem> transactionsByDate(DateTime dateTime) {
    return [
      ...transactionList.where((element) => dateTime == element.transactionDate)
    ];
  }

  double totalAmountBySingleDate(DateTime dateTime) {
    double totalAmount = 0;
    List<txItem.TransactionItem> tempList = transactionsByDate(dateTime);
    for (var element in tempList) {
      totalAmount += element.amount;
    }
    return totalAmount;
  }

  double allNetAmount() {
    double totalAmount = 0;
    for (var element in transactionList) {
      totalAmount += element.amount;
    }
    return totalAmount;
  }

  double allTotalExpenses() {
    double totalAmount = 0;
    for (var element in transactionList) {
      if (CategoriesModel().isExpense(element.categoryId)) {
        totalAmount += element.amount;
      }
    }
    return totalAmount;
  }

  double allTotalIncome() {
    double totalAmount = 0;
    for (var element in transactionList) {
      if (CategoriesModel().isIncome(element.categoryId)) {
        totalAmount += element.amount;
      }
    }
    return totalAmount;
  }
}
