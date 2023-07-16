import 'package:flutter/material.dart';

import '../Widgets/ChartBar.dart';
import '../Models/Transection.dart';

class Chart extends StatelessWidget {
  List<Transaction> recentTransactions;
  Chart(this.recentTransactions);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(15),
      child: Card(
        elevation: 5,
        shape: BeveledRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(12))),
        child: Row(
          children: [
            ChartBar(),
          ],
        ),
      ),
    );
  }
}
