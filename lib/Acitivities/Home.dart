import 'package:expensemanager/Widgets/Chart.dart';
import 'package:flutter/material.dart';

import '../Models/Transection.dart';
import '../Widgets/Newtransection.dart';
import '../Widgets/transectionlist.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final List<Transaction> userTransactions = [];
  List<Transaction> get _recentTranactions {
    return userTransactions.where(
      (element) {
        return element.date.isAfter(
          DateTime.now().subtract(
            Duration(days: 7),
          ),
        );
      },
    ).toList();
  }

  void _addNewTransaction(
      String txTitle, double txAmount, DateTime pickedDate) {
    final newTx = Transaction(
      title: txTitle,
      amount: txAmount,
      date: pickedDate,
      id: DateTime.now().toString(),
    );

    setState(() {
      userTransactions.add(newTx);
    });
  }

  void _StartAddNewTransaction(BuildContext ctx) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true, // only work on showModalBottomSheet function
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(10), topRight: Radius.circular(10))),
      builder: (context) => Padding(
        padding: MediaQuery.of(context).viewInsets,
        child: Container(
          height: 300, //height or you can use Get.width-100 to set height
          child: NewTransaction(_addNewTransaction),
        ),
      ),
    );
  }

  void _DeleteTransaction(String id) {
    setState(() {
      userTransactions.removeWhere((element) => element.id == id);
    });
  }

  @override
  Widget build(BuildContext context) {
    final _appBar = AppBar(
      title: Text(
        'Expense Manager',
        style: TextStyle(
          fontSize: 28,
        ),
      ),
      actions: <Widget>[
        IconButton(
          icon: Icon(Icons.add),
          onPressed: () => _StartAddNewTransaction(context),
        ),
      ],
    );
    final _mediaQuery = MediaQuery.of(context);
    final double _height = _mediaQuery.size.height -
        _appBar.preferredSize.height -
        _mediaQuery.padding.top;
    return Scaffold(
      appBar: _appBar,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Container(
              height: _height * 0.3,
              child: Chart(_recentTranactions, _height),
            ),
            userTransactions.length == 0
                ? Container(
                    padding: EdgeInsets.only(top: _height * 0.05),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "No Transections",
                          style: TextStyle(fontSize: 28),
                        ),
                        SizedBox(
                          height: _height * 0.05,
                        ),
                        Image(
                          image: AssetImage("images/waiting.png"),
                          height: _height * 0.3,
                        ),
                      ],
                    ),
                  )
                : TransactionList(userTransactions, _DeleteTransaction, _height)
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () => _StartAddNewTransaction(context),
        shape: BeveledRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(9),
          ),
        ),
      ),
    );
  }
}
