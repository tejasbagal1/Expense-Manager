import 'package:flutter/material.dart';

// if the data of the title and the amount is getting lost when clicked on the
// other then make this widget a stateful widget.
// 
// this will add widget. before addNewTransaction,
// this widget is a special thing to access the class
class NewTransaction extends StatefulWidget {
  final Function addNewTransaction;

  NewTransaction(this.addNewTransaction);

  @override
  _NewTransactionState createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final titleController = TextEditingController();

  final amountController = TextEditingController();

  void submitData() {
    final titleInput = titleController.text;
    final amountInput = double.parse((amountController.text));

    if (titleInput.isEmpty || amountInput <= 0) {
      return;
    }
    widget.addNewTransaction(
      titleInput,
      amountInput,
    );
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      // elevation: 0,
      child: Container(
        padding: EdgeInsets.all(15),
        child: Column(
          children: [
            TextField(
              decoration: InputDecoration(
                labelText: 'Title',
              ),
              controller: titleController,
              onSubmitted: (_) => submitData(),
            ),
            TextField(
              decoration: InputDecoration(labelText: 'Amount'),
              controller: amountController,
              keyboardType: TextInputType.number,
              onSubmitted: (_) => submitData(),
            ),
            OutlinedButton(
              onPressed: submitData,
              style: ButtonStyle(
                shape: MaterialStateProperty.all(
                  RoundedRectangleBorder(
                    // borderRadius: BorderRadius.circular(8),
                    side: BorderSide(
                      color: Colors.purple.shade300,
                      style: BorderStyle.solid,
                    ),
                  ),
                ),
                foregroundColor:
                    MaterialStateProperty.all(Theme.of(context).primaryColor),
              ),
              child: const Text("Add Transaction"),
            ),
          ],
        ),
      ),
    );
  }
}
