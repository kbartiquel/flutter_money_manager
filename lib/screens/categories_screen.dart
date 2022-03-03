import 'package:flutter/material.dart';

class Categories_Screen extends StatefulWidget {
  const Categories_Screen({Key? key}) : super(key: key);

  @override
  State<Categories_Screen> createState() => _Categories_ScreenState();
}

class _Categories_ScreenState extends State<Categories_Screen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: const Text('Categories'),
    );
  }
}
