import 'package:flutter/material.dart';
import 'package:money_manager/models/transactions_model.dart';
import 'package:money_manager/screens/choose_categories_screen.dart';
import 'package:money_manager/screens/edit_transaction_screen.dart';
import 'package:money_manager/utils/const.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:money_manager/screens/analysis_screen.dart';
import 'package:money_manager/screens/categories_screen.dart';
import 'package:money_manager/screens/transactions_screen.dart';
import 'package:money_manager/screens/utang_screen.dart';
import 'package:provider/provider.dart';

import 'models/categories_model.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => TransactionsModel()),
        ChangeNotifierProvider(
          create: (context) => CategoriesModel(),
        )
      ],
      child: MaterialApp(
        title: Const.AppName,
        theme: ThemeData(
          appBarTheme: const AppBarTheme(color: Const.primaryColor),
          scaffoldBackgroundColor: Const.scaffoldBgColor,
          textTheme:
              GoogleFonts.sourceSansProTextTheme(Theme.of(context).textTheme)
                  .apply(bodyColor: Const.textColor1),
          canvasColor: Const.primaryColor,
          colorScheme: ColorScheme.fromSwatch()
              .copyWith(secondary: Const.secondaryColor),
        ),
        home: MyHomePage(),
        routes: {
          ChooseCategoriesScreen.routeName: (context) =>
              const ChooseCategoriesScreen(),
          EditTransactionScreen.routeName: (context) =>
              const EditTransactionScreen()
        },
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedIndex = 0;
  final List<Widget> _pages = [
    const Transactions_Screen(),
    const Analysis_Screen(),
    const UtangScreen(),
    const Categories_Screen()
  ];

  void _seletedPage(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(Const.AppName),
      ),
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: _selectedIndex,
          onTap: _seletedPage,
          showUnselectedLabels: true,
          elevation: 2,
          selectedItemColor: Const.selectedItemColor,
          items: [
            BottomNavigationBarItem(
              icon: SvgPicture.asset('assets/icons/transactions.svg',
                  width: 18,
                  color: _selectedIndex == 0 ? Colors.black : Colors.white),
              label: 'Transactions',
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset('assets/icons/analysis.svg',
                  width: 18,
                  color: _selectedIndex == 1 ? Colors.black : Colors.white),
              label: 'Analysis',
            ),
            BottomNavigationBarItem(
              label: 'Utang',
              icon: SvgPicture.asset('assets/icons/utang.svg',
                  width: 18,
                  color: _selectedIndex == 2 ? Colors.black : Colors.white),
            ),
            BottomNavigationBarItem(
              label: 'Categories',
              icon: SvgPicture.asset('assets/icons/category.svg',
                  width: 18,
                  color: _selectedIndex == 3 ? Colors.black : Colors.white),
            )
          ]),
    );
  }
}
