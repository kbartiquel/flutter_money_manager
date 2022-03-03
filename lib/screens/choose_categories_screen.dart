import 'package:flutter/material.dart';
import 'package:money_manager/widgets/category_item_widget.dart';
import 'package:provider/provider.dart';
import '../models/categories_model.dart';
import '../utils/const.dart';

class ChooseCategoriesScreen extends StatefulWidget {
  const ChooseCategoriesScreen({Key? key}) : super(key: key);
  static const String routeName = '/Choose-Categories-Screen';
  @override
  State<ChooseCategoriesScreen> createState() => _ChooseCategoriesScreenState();
}

class _ChooseCategoriesScreenState extends State<ChooseCategoriesScreen> {
  bool isExpenseSelected = true;
  bool isIncomeSelected = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    void selectExpense() {
      setState(() {
        isExpenseSelected = true;
        isIncomeSelected = false;
      });
    }

    void selectIncome() {
      setState(() {
        isExpenseSelected = false;
        isIncomeSelected = true;
      });
    }

    var categoryP = Provider.of<CategoriesModel>(context);
    return Scaffold(
      appBar: AppBar(title: const Text(Const.addTransactionName)),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Container(
              decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(15)),
                  gradient: LinearGradient(
                    begin: Alignment.topRight,
                    end: Alignment.bottomLeft,
                    colors: [Const.bgColor, Const.bgColor2, Const.bgColor3],
                  )),
              padding: const EdgeInsets.all(8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.4,
                    child: ElevatedButton(
                        style: ButtonStyle(
                          shape: MaterialStateProperty.all(
                              RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15))),
                          backgroundColor: isExpenseSelected
                              ? MaterialStateProperty.all<Color>(
                                  Const.amountColorNegative)
                              : MaterialStateProperty.all<Color>(
                                  Const.unSelectedButtonColor),
                        ),
                        onPressed: selectExpense,
                        child: isExpenseSelected
                            ? Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: const [
                                    Icon(Icons.check),
                                    Text('Expense')
                                  ])
                            : const Text('Expense')),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.4,
                    child: ElevatedButton(
                        style: ButtonStyle(
                          shape: MaterialStateProperty.all(
                              RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15))),
                          backgroundColor: isIncomeSelected
                              ? MaterialStateProperty.all<Color>(
                                  Const.amountColorPositive)
                              : MaterialStateProperty.all<Color>(
                                  Const.unSelectedButtonColor),
                        ),
                        onPressed: selectIncome,
                        child: isIncomeSelected
                            ? Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: const [
                                    Icon(Icons.check),
                                    Text('Income')
                                  ])
                            : const Text('Income')),
                  ),
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text('Please Select a Category: '),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 4,
                    crossAxisSpacing: 2,
                    mainAxisSpacing: 0,
                  ),
                  itemCount: isExpenseSelected
                      ? categoryP.listExpensesCategories.length
                      : categoryP.listIncomeCategories.length,
                  itemBuilder: (BuildContext context, int index) {
                    return CategoryItemWidget(isExpenseSelected
                        ? categoryP.listExpensesCategories[index]
                        : categoryP.listIncomeCategories[index]);
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
