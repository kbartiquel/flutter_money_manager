import 'dart:math';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import '../models/transaction_item_model.dart' as txItem;
import '../models/transactions_model.dart';
import '../utils/const.dart';
import '../utils/app_functions.dart' as func;

class TransactionItemWidget extends StatefulWidget {
  DateTime transactionDate;
  TransactionItemWidget(this.transactionDate);

  @override
  State<TransactionItemWidget> createState() => _TransactionItemState();
}

class _TransactionItemState extends State<TransactionItemWidget> {
  bool expanded = false;
  void onExpand() {
    setState(() {
      expanded = !expanded;
    });
  }

  @override
  Widget build(BuildContext context) {
    var transactionsModelP = Provider.of<TransactionsModel>(context);
    String dateStr =
        DateFormat.yMMMEd().format(widget.transactionDate).toString();
    double totalAmount =
        transactionsModelP.totalAmountBySingleDate(widget.transactionDate);

    void transactionClick() {}

    Widget expandedWidget(txItem.TransactionItem transactionItem) {
      return InkWell(
        onTap: transactionClick,
        child: Padding(
          padding: const EdgeInsets.only(left: 15, right: 10, bottom: 15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    transactionItem.cateGoryname,
                    style: const TextStyle(
                        fontSize: Const.transactionFontSizeTitle),
                  ),
                  Text(
                    transactionItem.notes,
                    style: const TextStyle(
                        fontSize: Const.transactionFontSizeTitle,
                        fontStyle: FontStyle.italic),
                  ),
                ],
              ),
              func.AppFunctions().amountWidget(
                  transactionItem.amount, Const.transactionFontSizeSubTitle),
            ],
          ),
        ),
      );
    }

    int transactionsCount =
        transactionsModelP.transactionsByDate(widget.transactionDate).length;
    return Padding(
      padding: const EdgeInsets.all(5),
      child: Card(
        child: Column(
          children: [
            ListTile(
              title: Text(
                dateStr,
                style: const TextStyle(
                  fontSize: Const.listTitleFontSize,
                ),
              ),
              subtitle: Row(children: [
                const Text(
                  'Total: ',
                  style: TextStyle(fontSize: Const.listSubTitleFontSize),
                ),
                func.AppFunctions()
                    .amountWidget(totalAmount, Const.listSubTitleFontSize),
              ]),
              trailing: IconButton(
                  onPressed: () {
                    onExpand();
                  },
                  icon: expanded
                      ? const Icon(Icons.expand_less)
                      : const Icon(Icons.expand_more)),
            ),
            expanded ? const Divider() : Container(),
            expanded
                ? SizedBox(
                    height: min(transactionsCount * 30.0 + 50, 400),
                    child: ListView.builder(
                        itemCount: transactionsCount,
                        itemBuilder: (ctx, index) => expandedWidget(
                            transactionsModelP.transactionsByDate(
                                widget.transactionDate)[index])),
                  )
                : Container()
          ],
        ),
      ),
    );
  }
}
