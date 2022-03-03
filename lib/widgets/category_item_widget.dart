import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:money_manager/screens/edit_transaction_screen.dart';
import 'package:money_manager/utils/arguments.dart';
import '../models/category_item_model.dart' as catItem;

class CategoryItemWidget extends StatelessWidget {
  catItem.CategoryItemModel categoryItem;
  CategoryItemWidget(this.categoryItem);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Navigator.of(context).pushReplacementNamed(
          EditTransactionScreen.routeName,
          arguments: Arguments(categoryItem.isExpense, categoryItem.categoryId,
              categoryItem.categoryName, categoryItem.iconSvg)),
      child: Card(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SvgPicture.asset(
                'assets/icons/categories/${categoryItem.iconSvg}',
                width: 20,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8, bottom: 2),
              child: Text(categoryItem.categoryName),
            ),
          ],
        ),
      ),
    );
  }
}
