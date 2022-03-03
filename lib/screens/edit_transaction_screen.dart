import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:money_manager/models/transactions_model.dart';
import 'package:money_manager/utils/arguments.dart';
import 'package:flutter_svg/svg.dart';
import 'package:money_manager/utils/enum.dart';
import 'package:money_manager/utils/functions.dart';
import '../utils/const.dart';
import 'package:provider/provider.dart';

class EditTransactionScreen extends StatefulWidget {
  static const routeName = '/edit-transaction-screen';
  const EditTransactionScreen();

  @override
  State<EditTransactionScreen> createState() => _EditTransactionScreenState();
}

class _EditTransactionScreenState extends State<EditTransactionScreen> {
  final noteController = TextEditingController();
  DateTime? selectedDate = DateTime.now();
  final amountController = TextEditingController();
  bool isCashSelected = true;

  void cashSelected() {
    setState(() {
      isCashSelected = true;
    });
  }

  void onlineSelected() {
    setState(() {
      isCashSelected = false;
    });
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(2021, 8),
        lastDate: DateTime.now());
    setState(() {
      selectedDate = picked;
    });
  }

  @override
  Widget build(BuildContext context) {
    var transactionProvider =
        Provider.of<TransactionsModel>(context, listen: false);
    final Arguments args =
        ModalRoute.of(context)!.settings.arguments as Arguments;
    bool isExpense = args.isExpense;
    String categoryId = args.categoryId;
    String categoryName = args.categoryName;
    String iconSvg = args.iconSvg;

    submitData() {
      if (amountController.text.isNotEmpty) {
        String note = noteController.text == '' ? '' : noteController.text;

        if (double.tryParse(amountController.text) != null) {
          transactionProvider.addTransaction(
              transactionDate: Functions().formatDate(selectedDate!),
              categoryId: categoryId,
              categoryname: categoryName,
              notes: note,
              amount: isExpense
                  ? double.parse(amountController.text) -
                      (double.parse(amountController.text) * 2)
                  : double.parse(amountController.text),
              paymentMode:
                  isCashSelected ? PaymentMode.cash : PaymentMode.online);
        }
      }
      Navigator.of(context).pop(); //?this will close the bottom sheet
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(isExpense ? 'Add Expense' : 'Add Income'),
      ),
      body: Container(
        padding:
            const EdgeInsets.only(top: 10, left: 10, right: 10, bottom: 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                Row(
                  children: [
                    const Spacer(),
                    Row(
                      children: [
                        SvgPicture.asset(
                          'assets/icons/categories/$iconSvg',
                          width: 25,
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Text(
                          categoryName,
                          style:
                              const TextStyle(fontSize: Const.headerFontSize),
                        )
                      ],
                    ),
                    const Spacer()
                  ],
                ),
                TextField(
                  style: const TextStyle(fontSize: Const.defaultFontSize),
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(labelText: 'Amount'),
                  controller: amountController,
                ),
                TextField(
                  style: const TextStyle(fontSize: Const.defaultFontSize),
                  decoration: const InputDecoration(labelText: 'Note'),
                  controller: noteController,
                ),
                Row(
                  children: [
                    const Text('Date: '),
                    Text(selectedDate == null
                        ? 'No Date Choosen'
                        : DateFormat.yMd().format(selectedDate!)),
                    TextButton.icon(
                        onPressed: () {
                          _selectDate(context);
                        },
                        icon: const Icon(Icons.date_range_rounded),
                        label: const Text('Choose Date'))
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    const Text('Payment Mode:'),
                    const SizedBox(
                      width: 10,
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.17,
                      child: FittedBox(
                        child: ElevatedButton(
                            style: ButtonStyle(
                                backgroundColor: MaterialStateProperty.all(
                                    isCashSelected
                                        ? Const.selectedButtonColor
                                        : Const.unSelectedButtonColor),
                                textStyle: MaterialStateProperty.all(
                                    const TextStyle(
                                        fontSize:
                                            Const.paymentModeButtonFontSize)),
                                shape: MaterialStateProperty.all(
                                    RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(15)))),
                            onPressed: () {
                              cashSelected();
                            },
                            child: const Text('Cash')),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 5),
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width * 0.17,
                        child: FittedBox(
                          child: ElevatedButton(
                              style: ButtonStyle(
                                  backgroundColor: MaterialStateProperty.all(
                                      !isCashSelected
                                          ? Const.selectedButtonColor
                                          : Const.unSelectedButtonColor),
                                  textStyle: MaterialStateProperty.all(
                                      const TextStyle(
                                          fontSize:
                                              Const.paymentModeButtonFontSize)),
                                  shape: MaterialStateProperty.all(
                                      RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(15)))),
                              onPressed: () {
                                onlineSelected();
                              },
                              child: const Text('Online')),
                        ),
                      ),
                    )
                  ],
                )
              ],
            ),
            const Spacer(),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.8,
              child: ElevatedButton(
                style: ButtonStyle(
                    shape: MaterialStateProperty.all(RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15))),
                    backgroundColor: MaterialStateProperty.all<Color>(
                        Const.buttonDefaultColor)),
                onPressed: () => submitData(),
                child: const Text('Save Transaction'),
              ),
            )
          ],
        ),
      ),
    );
  }
}
