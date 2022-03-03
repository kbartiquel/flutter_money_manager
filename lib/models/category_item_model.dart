class CategoryItemModel {
  final String categoryId;
  final String categoryName;
  final String iconSvg;
  final bool isExpense;
  final bool isIncome;

  CategoryItemModel(
      {required this.categoryId,
      required this.categoryName,
      required this.iconSvg,
      required this.isExpense,
      required this.isIncome});
}

//get Icon properties
// final IconData _iconOne = Icons.add;
// final int _iconOneCodePoint = _iconOne.codePoint;
// final String _iconOneFontFamily = _iconOne.fontFamily;
// final String _iconOneFontPackage = _iconOne.fontPackage;
// final bool _iconOneDirection = _iconOne.matchTextDirection;

//IconData value
//  IconData(_iconOneCodePoint,
//       fontFamily: _iconOneFontFamily,
//       fontPackage: _iconOneFontPackage,
//       matchTextDirection: _iconOneDirection);