import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:money_manager/models/transactions_model.dart';
import 'package:money_manager/screens/choose_categories_screen.dart';
import 'package:money_manager/utils/const.dart';
import 'package:money_manager/utils/enum.dart';
import 'package:money_manager/widgets/transaction_item_widget.dart';
import 'package:provider/provider.dart';

import '../models/transaction_item_model.dart';
import '../utils/app_functions.dart' as func;
import '../widgets/filter_dialog.dart';

class Transactions_Screen extends StatefulWidget {
  const Transactions_Screen({Key? key}) : super(key: key);

  @override
  State<Transactions_Screen> createState() => _TransactionsState();
}

class _TransactionsState extends State<Transactions_Screen> {
  bool isAlltime = false;
  bool isToday = false;
  bool isMonthly = true;
  bool isYearly = false;
  bool isSelectDay = false;
  bool isWeekly = false;

  List<TransactionItem> list = [];
  void resetFilterValue() {
    isAlltime = false;
    isToday = false;
    isMonthly = false;
    isYearly = false;
    isSelectDay = false;
    isWeekly = false;
  }

  void setFilter(DateFilter filter) {
    setState(() {
      resetFilterValue();
      switch (filter) {
        case DateFilter.alltime:
          isAlltime = true;
          break;
        case DateFilter.today:
          isToday = true;
          break;
        case DateFilter.selectday:
          isSelectDay = true;
          break;
        case DateFilter.weekly:
          isWeekly = true;
          break;
        case DateFilter.monthly:
          isMonthly = true;
          break;
        case DateFilter.yearly:
          isYearly = true;
          break;
        default:
      }
    });
  }

  String showFilterDate() {
    if (isAlltime) return 'All Time';
    if (isToday) return 'Today';
    if (isSelectDay) return 'Selected Date Here';
    if (isWeekly) return 'Weekly Range';
    if (isMonthly) return func.AppFunctions().dateToMonthYear(DateTime.now());
    if (isYearly) return DateFormat('yyyy').format(DateTime.now()).toString();
    return '';
  }

  getList() async {
    var t = Provider.of<TransactionsModel>(context, listen: false);
    t.alltransactionList().then((value) {
      setState(() {});
    });
  }

  @override
  void initState() {
    getList();
    super.initState();
  }

  void onDialogClick(DateFilter filter) {
    setFilter(filter);
  }

  //?filter dialog
  void showCustomDialog(BuildContext context) {
    showGeneralDialog(
      context: context,
      barrierLabel: "Barrier",
      barrierDismissible: true,
      barrierColor: Colors.black.withOpacity(0.5),
      transitionDuration: const Duration(milliseconds: 200),
      pageBuilder: (_, __, ___) {
        return FilterDialog(
          onDialogClick,
        );
      },
      transitionBuilder: (_, anim, __, child) {
        Tween<Offset> tween;
        if (anim.status == AnimationStatus.reverse) {
          tween = Tween(begin: const Offset(-1, 0), end: Offset.zero);
        } else {
          tween = Tween(begin: const Offset(1, 0), end: Offset.zero);
        }

        return SlideTransition(
          position: tween.animate(anim),
          child: FadeTransition(
            opacity: anim,
            child: child,
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    var transactionsModelP = Provider.of<TransactionsModel>(context);
    print(func.AppFunctions().dateToMonthYear(DateTime.now()));
    //?date sort
    Widget dateSort = Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Spacer(),
        const Spacer(),
        const IconButton(onPressed: null, icon: Icon(Icons.navigate_before)),
        const Spacer(),
        TextButton(
            onPressed: null,
            child: Text(
              showFilterDate(),
              style: const TextStyle(color: Const.textColor2),
            )),
        const Spacer(),
        const IconButton(onPressed: null, icon: Icon(Icons.navigate_next)),
        const Spacer(),
        IconButton(
            onPressed: () => showCustomDialog(context),
            icon: const Icon(Icons.sort))
      ],
    );

    //?total summary
    Widget summary = Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8),
          child: Container(
            decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(15)),
                gradient: LinearGradient(
                  begin: Alignment.topRight,
                  end: Alignment.bottomLeft,
                  colors: [Const.bgColor, Const.bgColor2, Const.bgColor3],
                )),
            child: Column(
              children: [
                dateSort,
                const Divider(height: 10),
                Padding(
                  padding:
                      const EdgeInsets.only(bottom: 15, right: 10, left: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Padding(
                              padding: EdgeInsets.only(bottom: 5),
                              child: Text('Expenses',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: Const.headerFontSize,
                                      color: Const.textColor2)),
                            ),
                            Container(
                                decoration: const BoxDecoration(
                                  color: Const.summaryAmountsBackground,
                                  borderRadius: BorderRadius.only(
                                      topRight: Radius.circular(20)),
                                ),
                                width: MediaQuery.of(context).size.width * .25,
                                child: Padding(
                                  padding:
                                      const EdgeInsets.only(left: 3, right: 3),
                                  child: func.AppFunctions()
                                      .amountWidgetSummary(transactionsModelP
                                          .allTotalExpenses()),
                                ))
                          ],
                        ),
                      ),
                      const Spacer(),
                      Padding(
                        padding: const EdgeInsets.all(10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Padding(
                              padding: EdgeInsets.only(bottom: 5),
                              child: Text(
                                'Income',
                                style: TextStyle(
                                    fontSize: Const.headerFontSize,
                                    fontWeight: FontWeight.bold,
                                    color: Const.textColor2),
                              ),
                            ),
                            Container(
                                decoration: const BoxDecoration(
                                  color: Const.summaryAmountsBackground,
                                  borderRadius: BorderRadius.only(
                                      topRight: Radius.circular(20)),
                                ),
                                width: MediaQuery.of(context).size.width * .25,
                                child: Padding(
                                  padding:
                                      const EdgeInsets.only(left: 3, right: 3),
                                  child: func.AppFunctions()
                                      .amountWidgetSummary(
                                          transactionsModelP.allTotalIncome()),
                                ))
                          ],
                        ),
                      ),
                      const Spacer(),
                      Padding(
                        padding: const EdgeInsets.all(10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Padding(
                              padding: EdgeInsets.only(bottom: 5),
                              child: Text('Net',
                                  style: TextStyle(
                                      fontSize: Const.headerFontSize,
                                      fontWeight: FontWeight.bold,
                                      color: Const.textColor2)),
                            ),
                            Container(
                                decoration: const BoxDecoration(
                                  color: Const.summaryAmountsBackground,
                                  borderRadius: BorderRadius.only(
                                      topRight: Radius.circular(20)),
                                ),
                                width: MediaQuery.of(context).size.width * .25,
                                child: Padding(
                                  padding:
                                      const EdgeInsets.only(left: 3, right: 3),
                                  child: func.AppFunctions()
                                      .amountWidgetSummary(
                                          transactionsModelP.allNetAmount()),
                                ))
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                // addButtons
              ],
            ),
          ),
        ),
      ],
    );

    //?transaction list
    Widget transactionListWidget = Column(
      children: <Widget>[
        ...transactionsModelP.getUniqueDates
            .map((e) => TransactionItemWidget(e))
            .toList()
      ],
    );

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            summary,
            const Divider(),
            Padding(
              padding: const EdgeInsets.only(bottom: 56),
              child: transactionListWidget,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).pushNamed(ChooseCategoriesScreen.routeName);
          // transactionsModelP.addTransaction(
          //     func.Functions().formatDate(DateTime.now()),
          //     'categoryId',
          //     'categoryname',
          //     'notes',
          //     5000.00,
          //     PaymentMode.online);
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
