import 'package:flutter/material.dart';

class NewTransaction extends StatelessWidget {
  final titleController = TextEditingController();
  final amountController = TextEditingController();
  final Function _addNewTransaction;

  NewTransaction(this._addNewTransaction);

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
            // onChanged: (val) => titleInput = val,
          ),
          TextField(
            decoration: const InputDecoration(
              labelText: "Amount",
            ),
            controller: amountController,
            // onChanged: (val) => amountInput = val,
          ),
          FlatButton(
            child: Text("Add transaction"),
            textColor: Colors.purple,
            onPressed: () {
              _addNewTransaction(
                  titleController.text, double.parse(amountController.text));
            },
          )
        ]),
      ),
    );
  }
}
