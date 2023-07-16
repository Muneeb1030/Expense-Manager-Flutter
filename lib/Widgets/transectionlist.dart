import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../Models/Transection.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;
  final Function deleteTransaction;

  TransactionList(this.transactions, this.deleteTransaction);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 450,
      child: ListView.builder(
        itemBuilder: (ctx, index) {
          return ListTile(
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
              onPressed: () => deleteTransaction(transactions[index].id),
            ),
          );
        },
        itemCount: transactions.length,
      ),
    );
  }
}
