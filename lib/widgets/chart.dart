import 'package:flutter/material.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:intl/intl.dart';
import 'package:manage_expenses/models/transaction.dart';
import 'package:manage_expenses/widgets/chart_bar.dart';

class Chart extends StatelessWidget {
  final List<Transaction> _recentTransactions;

  const Chart(this._recentTransactions);

  List<Map<String, Object>> get groupedTransactionsValues {
    return List.generate(7, (index) {
      final weekDay = DateTime.now().subtract(Duration(days: index));
      double totalSum = 0.0;
      for (var i = 0; i < _recentTransactions.length; i++) {
        final Transaction trans = _recentTransactions.elementAt(i);
        if (trans.date.day == weekDay.day &&
            trans.date.month == weekDay.month &&
            trans.date.year == weekDay.year) {
          totalSum += trans.amount;
        }
      }
      return {
        'day': DateFormat.E().format(weekDay).substring(0, 1),
        'amount': totalSum,
      };
    });
  }

  double get totalSpending {
    return _recentTransactions.fold(0.0, (sum, item) {
      return sum + item.amount;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 6,
      margin: const EdgeInsets.all(20),
      child: Container(
        padding: const EdgeInsets.all(10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: groupedTransactionsValues.map((data) {
            return Flexible(
              fit: FlexFit.tight,
              child: ChartBar(
                  data['day'].toString(),
                  data['amount'] as double,
                  totalSpending == 0.0
                      ? 0.0
                      : (data['amount'] as double) / totalSpending),
            );
          }).toList(),
        ),
      ),
    );
  }
}
