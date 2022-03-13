import 'package:flutter/material.dart';

class NewTransaction extends StatefulWidget {
  final Function _addNewTransaction;

  NewTransaction(this._addNewTransaction);

  @override
  State<NewTransaction> createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final titleController = TextEditingController();
  final amountController = TextEditingController();

  void submitHandler() {
    final String enteredTitle = titleController.text;
    final double enteredAmount = double.parse(amountController.text);

    if (enteredTitle.isEmpty || enteredAmount <= 0) return;

    widget._addNewTransaction(enteredTitle, enteredAmount);

    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: SizedBox(
        width: double.infinity,
        child: Column(crossAxisAlignment: CrossAxisAlignment.end, children: [
          TextField(
            decoration: const InputDecoration(
              labelText: "Title",
            ),
            controller: titleController,
            keyboardType: TextInputType.text,
            // onChanged: (val) => titleInput = val,
          ),
          TextField(
            decoration: const InputDecoration(
              labelText: "Amount",
            ),
            keyboardType: const TextInputType.numberWithOptions(decimal: true),
            controller: amountController,
            // onChanged: (val) => amountInput = val,
          ),
          FlatButton(
            child: Text("Add transaction"),
            textColor: Colors.purple,
            onPressed: submitHandler,
          )
        ]),
      ),
    );
  }
}
