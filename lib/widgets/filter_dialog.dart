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
              child: Text('Filter Date'),
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
          Padding(
            padding: const EdgeInsets.only(top: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                InkWell(
                  onTap: (() {}),
                  child: Card(
                    child: SizedBox(
                      width: 120,
                      child: Column(
                        children: const [Icon(Icons.add), Text('All Time')],
                      ),
                    ),
                  ),
                ),
                InkWell(
                  onTap: (() {}),
                  child: Card(
                    child: SizedBox(
                      width: 120,
                      child: Column(
                        children: const [Icon(Icons.add), Text('Daily')],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                InkWell(
                  onTap: (() {}),
                  child: Card(
                    child: SizedBox(
                      width: 120,
                      child: Column(
                        children: const [Icon(Icons.add), Text('Weekly')],
                      ),
                    ),
                  ),
                ),
                InkWell(
                  onTap: (() {}),
                  child: Card(
                    child: SizedBox(
                      width: 120,
                      child: Column(
                        children: const [Icon(Icons.add), Text('Monthly')],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
