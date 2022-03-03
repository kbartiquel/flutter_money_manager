import 'package:flutter/cupertino.dart';
import 'package:money_manager/models/category_item_model.dart' as catItem;

class CategoriesModel with ChangeNotifier {
  List<catItem.CategoryItemModel> categoriesList = [
    catItem.CategoryItemModel(
        categoryId: 'x12',
        categoryName: 'Shopping',
        iconSvg: 'shopping.svg',
        isExpense: true,
        isIncome: false),
    catItem.CategoryItemModel(
        categoryId: 'x1',
        categoryName: 'Grocery',
        iconSvg: 'grocery.svg',
        isExpense: true,
        isIncome: false),
    catItem.CategoryItemModel(
        categoryId: 'x2',
        categoryName: 'Bills',
        iconSvg: 'bills.svg',
        isExpense: true,
        isIncome: false),
    catItem.CategoryItemModel(
        categoryId: 'x3',
        categoryName: 'Clothing',
        iconSvg: 'clothing.svg',
        isExpense: true,
        isIncome: false),
    catItem.CategoryItemModel(
        categoryId: 'x4',
        categoryName: 'Entertainment',
        iconSvg: 'entertainment.svg',
        isExpense: true,
        isIncome: false),
    catItem.CategoryItemModel(
        categoryId: 'x5',
        categoryName: 'Education',
        iconSvg: 'education.svg',
        isExpense: true,
        isIncome: false),
    catItem.CategoryItemModel(
        categoryId: 'x6',
        categoryName: 'Fitness',
        iconSvg: 'fitness.svg',
        isExpense: true,
        isIncome: false),
    catItem.CategoryItemModel(
        categoryId: 'x7',
        categoryName: 'Food & Beverage',
        iconSvg: 'food.svg',
        isExpense: true,
        isIncome: false),
    catItem.CategoryItemModel(
        categoryId: 'x8',
        categoryName: 'Gifts',
        iconSvg: 'gifts.svg',
        isExpense: true,
        isIncome: false),
    catItem.CategoryItemModel(
        categoryId: 'x9',
        categoryName: 'Health',
        iconSvg: 'health.svg',
        isExpense: true,
        isIncome: false),
    catItem.CategoryItemModel(
        categoryId: 'x10',
        categoryName: 'Furniture',
        iconSvg: 'furniture.svg',
        isExpense: true,
        isIncome: false),
    catItem.CategoryItemModel(
        categoryId: 'x11',
        categoryName: 'Rent',
        iconSvg: 'rent.svg',
        isExpense: true,
        isIncome: false),
    catItem.CategoryItemModel(
        categoryId: 'x13',
        categoryName: 'Transportation',
        iconSvg: 'transportation.svg',
        isExpense: true,
        isIncome: false),
    catItem.CategoryItemModel(
        categoryId: 'x14',
        categoryName: 'Travel',
        iconSvg: 'travel.svg',
        isExpense: true,
        isIncome: false),
    catItem.CategoryItemModel(
        categoryId: 'x14',
        categoryName: 'Other Expense',
        iconSvg: 'others.svg',
        isExpense: true,
        isIncome: false),
    //Income

    catItem.CategoryItemModel(
        categoryId: 'i1',
        categoryName: 'Sales',
        iconSvg: 'sales.svg',
        isIncome: true,
        isExpense: false),
    catItem.CategoryItemModel(
        categoryId: 'i2',
        categoryName: 'Salary',
        iconSvg: 'salary.svg',
        isIncome: true,
        isExpense: false),
    catItem.CategoryItemModel(
        categoryId: 'i3',
        categoryName: 'Allowance',
        iconSvg: 'allowance.svg',
        isIncome: true,
        isExpense: false),
    catItem.CategoryItemModel(
        categoryId: 'i3',
        categoryName: 'Rental',
        iconSvg: 'rental.svg',
        isIncome: true,
        isExpense: false),
    catItem.CategoryItemModel(
        categoryId: 'i4',
        categoryName: 'Investment',
        iconSvg: 'investment.svg',
        isIncome: true,
        isExpense: false),
    catItem.CategoryItemModel(
        categoryId: 'i5',
        categoryName: 'Tips',
        iconSvg: 'tips.svg',
        isIncome: true,
        isExpense: false),
    catItem.CategoryItemModel(
        categoryId: 'i6',
        categoryName: 'Other Income',
        iconSvg: 'others.svg',
        isIncome: true,
        isExpense: false),
  ];

  List<catItem.CategoryItemModel> get listExpensesCategories {
    return [...categoriesList.where((element) => element.isExpense == true)];
  }

  List<catItem.CategoryItemModel> get listIncomeCategories {
    return [...categoriesList.where((element) => element.isIncome == true)];
  }

  bool isExpense(String categoryId) {
    List<catItem.CategoryItemModel> listItem = [
      ...listExpensesCategories
          .where((element) => element.categoryId == categoryId)
    ];
    if (listItem.isNotEmpty) {
      return true;
    } else {
      return false;
    }
  }

  bool isIncome(String categoryId) {
    List<catItem.CategoryItemModel> listItem = [
      ...listIncomeCategories
          .where((element) => element.categoryId == categoryId)
    ];
    if (listItem.isNotEmpty) {
      return true;
    } else {
      return false;
    }
  }
}
