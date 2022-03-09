import 'package:flutter/material.dart';

import '../utils/const.dart';

class FilterDialog extends StatelessWidget {
  const FilterDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      elevation: 0,
      backgroundColor: Colors.transparent,
      child: contentBox(context),
    );
  }

  contentBox(context) {
    return Container(
      width: 300,
      decoration: BoxDecoration(
        shape: BoxShape.rectangle,
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Container(
            child: const Center(
              child: Text(
                'Filter Date',
                style: TextStyle(color: Const.textColor2),
              ),
            ),
            decoration: const BoxDecoration(
              shape: BoxShape.rectangle,
              color: Const.primaryColor,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(15), topRight: Radius.circular(15)),
            ),
            width: double.infinity,
            height: 30,
          ),
          Container(
            decoration: const BoxDecoration(
                border: Border.symmetric(
                    horizontal: BorderSide(width: 0, color: Colors.grey))),
            padding: const EdgeInsets.only(left: 8, right: 8),
            child: IntrinsicHeight(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: () {},
                      child: Column(
                        children: const [
                          SizedBox(
                            height: 10,
                          ),
                          Icon(Icons.timelapse),
                          Text('All Time'),
                          SizedBox(
                            height: 10,
                          ),
                        ],
                      ),
                    ),
                  ),
                  const VerticalDivider(
                    color: Colors.grey,
                  ),
                  Expanded(
                    child: GestureDetector(
                      child: Column(
                        children: const [
                          SizedBox(
                            height: 10,
                          ),
                          Icon(Icons.looks_one),
                          Text('Today'),
                          SizedBox(
                            height: 10,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(
            decoration: const BoxDecoration(
                border: Border.symmetric(
                    horizontal: BorderSide(width: 0, color: Colors.grey))),
            padding: const EdgeInsets.only(
              right: 8,
              left: 8,
            ),
            child: IntrinsicHeight(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Expanded(
                    child: GestureDetector(
                      child: Column(
                        children: const [
                          SizedBox(
                            height: 10,
                          ),
                          Icon(Icons.calendar_view_day_outlined),
                          Text('Select Day'),
                          SizedBox(
                            height: 10,
                          ),
                        ],
                      ),
                    ),
                  ),
                  const VerticalDivider(
                    color: Colors.grey,
                  ),
                  Expanded(
                    child: GestureDetector(
                      child: Column(
                        children: const [
                          SizedBox(
                            height: 10,
                          ),
                          Icon(Icons.calendar_view_week),
                          Text('Weekly'),
                          SizedBox(
                            height: 10,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 8, left: 8),
            child: IntrinsicHeight(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Expanded(
                    child: GestureDetector(
                      child: Column(
                        children: const [
                          SizedBox(
                            height: 10,
                          ),
                          Icon(Icons.calendar_view_month),
                          Text('Monthly'),
                          SizedBox(
                            height: 10,
                          ),
                        ],
                      ),
                    ),
                  ),
                  const VerticalDivider(color: Colors.grey),
                  Expanded(
                    child: GestureDetector(
                      child: Column(
                        children: const [
                          SizedBox(
                            height: 10,
                          ),
                          Icon(Icons.calendar_today),
                          Text('Yearly'),
                          SizedBox(
                            height: 10,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
