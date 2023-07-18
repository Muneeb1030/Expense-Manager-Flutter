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
  bool _showChart = true;
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
      isScrollControlled: true,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(10), topRight: Radius.circular(10))),
      builder: (context) => Padding(
        padding: MediaQuery.of(context).viewInsets,
        child: Container(
          height: 300,
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
    final _mediaQuery = MediaQuery.of(context);

    bool _isLandscape = _mediaQuery.orientation == Orientation.landscape;
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
    final double _height = _mediaQuery.size.height -
        _appBar.preferredSize.height -
        _mediaQuery.padding.top;
    return Scaffold(
      appBar: _appBar,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            if (_isLandscape)
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Toggle Chart",
                    style: TextStyle(fontSize: 20),
                  ),
                  Switch(
                    value: _showChart,
                    onChanged: (val) {
                      setState(() {
                        _showChart = val;
                      });
                    },
                  ),
                ],
              ),
            if (!_isLandscape)
              Container(
                height: _height * 0.3,
                child: Chart(_recentTranactions),
              ),
            if (!_isLandscape)
              TransactionList(userTransactions, _DeleteTransaction, _height),
            if (_isLandscape)
              _showChart
                  ? Container(
                      height: _height * 0.8,
                      child: Chart(_recentTranactions),
                    )
                  : TransactionList(
                      userTransactions, _DeleteTransaction, _height),
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
