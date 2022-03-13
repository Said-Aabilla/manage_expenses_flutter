import 'package:flutter/material.dart';

class ChartBar extends StatelessWidget {
  String label;
  double spendingAmount;
  double spendedPctOfTotal;

  ChartBar(this.label, this.spendingAmount, this.spendedPctOfTotal);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        FittedBox(child: Text('\$${spendingAmount.toStringAsFixed(0)}')),
        const SizedBox(
          height: 4,
        ),
        Container(
          height: 60,
          width: 10,
          child: Stack(
            children: [
              Container(
                decoration: BoxDecoration(
                    color: const Color.fromRGBO(220, 220, 220, 1),
                    border: Border.all(color: Colors.grey, width: 1),
                    borderRadius: BorderRadius.circular(10)),
                child: FractionallySizedBox(
                  heightFactor: spendedPctOfTotal,
                  child: Container(
                    decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.primary,
                        borderRadius: BorderRadius.circular(10)),
                  ),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 4,
        ),
        Text(label)
      ],
    );
  }
}
