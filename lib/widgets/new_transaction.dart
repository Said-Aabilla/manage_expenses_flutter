import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class NewTransaction extends StatefulWidget {
  final Function _addNewTransaction;

  NewTransaction(this._addNewTransaction);

  @override
  State<NewTransaction> createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final titleController = TextEditingController();
  final amountController = TextEditingController();
  DateTime? _selectedDate;

  void _submitHandler() {
    final String enteredTitle = titleController.text;
    final double enteredAmount = double.parse(amountController.text);

    if (enteredTitle.isEmpty || enteredAmount <= 0 || _selectedDate == null)
      return;

    widget._addNewTransaction(enteredTitle, enteredAmount, _selectedDate);

    Navigator.of(context).pop();
  }

  void _showDatePicker() {
    showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime(2022),
            lastDate: DateTime.now())
        .then((date) {
      if (date == null) return;
      setState(() {
        _selectedDate = date;
      });
    });
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
          Container(
            height: 70,
            child: Row(
              children: [
                Text(_selectedDate == null
                    ? "No date chosen !"
                    : DateFormat.yMd().format(_selectedDate)),
                FlatButton(
                  onPressed: _showDatePicker,
                  child: Text("Choose date"),
                  textColor: Theme.of(context).colorScheme.primary,
                )
              ],
            ),
          ),
          RaisedButton(
            child: Text("Add transaction"),
            color: Theme.of(context).colorScheme.primary,
            textColor: Colors.white,
            onPressed: _submitHandler,
          )
        ]),
      ),
    );
  }
}
