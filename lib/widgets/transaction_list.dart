// ignore_for_file: import_of_legacy_library_into_null_safe

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:manage_expenses/models/transaction.dart';

class TranscationList extends StatefulWidget {
  final List<Transaction> _transactions;
  final Function _deleteTransaction;

  TranscationList(this._transactions, this._deleteTransaction);

  @override
  State<TranscationList> createState() => _TranscationListState(_transactions);
}

class _TranscationListState extends State<TranscationList> {
  final List<Transaction> _transactions;

  _TranscationListState(this._transactions);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 500,
      child: _transactions.isEmpty
          ? Column(
              children: [
                Text(
                  "No expenses found !",
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                Container(
                  height: 200,
                  margin: const EdgeInsets.all(20),
                  child: Image.asset(
                    "assets/images/waiting.png",
                    fit: BoxFit.cover,
                  ),
                )
              ],
            )
          : ListView.builder(
              itemBuilder: (ctx, index) {
                return Card(
                  elevation: 5,
                  margin: const EdgeInsets.symmetric(
                    vertical: 8,
                    horizontal: 5,
                  ),
                  child: ListTile(
                    leading: CircleAvatar(
                      backgroundColor: Theme.of(context).colorScheme.primary,
                      radius: 30,
                      child: Padding(
                        padding: EdgeInsets.all(6),
                        child: FittedBox(
                          child: Text('\$${_transactions[index].amount}'),
                        ),
                      ),
                    ),
                    title: Text(
                      _transactions[index].title,
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    subtitle: Text(
                      DateFormat.yMMMd().format(_transactions[index].date),
                    ),
                    trailing: IconButton(
                      onPressed: () =>
                          widget._deleteTransaction(_transactions[index].id),
                      icon: const Icon(Icons.delete),
                      color: Colors.red,
                    ),
                  ),
                );
              },
              itemCount: _transactions.length,
            ),
    );
  }
}
