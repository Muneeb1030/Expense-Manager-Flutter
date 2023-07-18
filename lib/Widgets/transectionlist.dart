import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../Models/Transection.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;
  final Function deleteTransaction;
  final double Height;

  TransactionList(this.transactions, this.deleteTransaction, this.Height);

  @override
  Widget build(BuildContext context) {
    final _mediaQuery = MediaQuery.of(context);
    final _height = Height;
    return transactions.isEmpty
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
        : ClipRRect(
            borderRadius: BorderRadius.circular(25.0),
            child: Container(
              height: _height * 0.7,
              child: ListView.builder(
                itemBuilder: (ctx, index) {
                  return Card(
                    elevation: 5,
                    margin: EdgeInsets.symmetric(vertical: 5, horizontal: 8),
                    color: Color.fromARGB(255, 236, 236, 234),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    child: ListTile(
                      leading: CircleAvatar(
                        backgroundColor: Theme.of(context).colorScheme.primary,
                        foregroundColor: Color.fromARGB(255, 236, 236, 234),
                        radius: 30,
                        child: Padding(
                          padding: EdgeInsets.all(6),
                          child: FittedBox(
                            child: Text(
                              '\$${transactions[index].amount.toStringAsFixed(2)}',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                              ),
                            ),
                          ),
                        ),
                      ),
                      title: Text(
                        transactions[index].title,
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      subtitle: Text(
                        DateFormat.yMMMd().format(transactions[index].date),
                        style: TextStyle(
                          fontSize: 18,
                          color: Theme.of(context).colorScheme.tertiary,
                        ),
                      ),
                      trailing: IconButton(
                        icon: Icon(Icons.delete),
                        color: Theme.of(context).colorScheme.primary,
                        onPressed: () =>
                            deleteTransaction(transactions[index].id),
                      ),
                    ),
                  );
                },
                itemCount: transactions.length,
              ),
            ),
          );
  }
}
