import 'package:money_manager/utils/enum.dart';

class TransactionItem {
  final String transactionId;
  final DateTime transactionDate;
  final String categoryId;
  final String cateGoryname;
  final String notes;
  final double amount;
  final PaymentMode paymentMode;

  TransactionItem(
      {required this.transactionId,
      required this.transactionDate,
      required this.categoryId,
      required this.cateGoryname,
      required this.notes,
      required this.amount,
      required this.paymentMode});
}
