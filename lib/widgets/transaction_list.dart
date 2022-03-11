// ignore_for_file: import_of_legacy_library_into_null_safe

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:manage_expenses/models/transaction.dart';

class TranscationList extends StatefulWidget {
  final List<Transaction> _transactions;

  TranscationList(this._transactions);

  @override
  State<TranscationList> createState() => _TranscationListState(_transactions);
}

class _TranscationListState extends State<TranscationList> {
  final List<Transaction> _transactions;

  _TranscationListState(this._transactions);

  @override
  Widget build(BuildContext context) {
    return Column(
        children: _transactions.map((tx) {
      return Card(
        child: Row(
          children: [
            Container(
              margin: const EdgeInsets.symmetric(
                vertical: 10,
                horizontal: 15,
              ),
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.purple,
                  width: 2,
                ),
              ),
              padding: const EdgeInsets.all(10),
              child: Text(
                '\$${tx.amount}',
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  color: Colors.purple,
                ),
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  tx.title,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  DateFormat.yMMMEd().format(tx.date),
                  style: const TextStyle(
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
          ],
        ),
      );
    }).toList());
  }
}
