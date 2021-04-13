import 'package:flutter/material.dart';

class NewTransaction extends StatelessWidget {
  final titleController = TextEditingController();
  final amountController = TextEditingController();

  final Function addNewTransaction;

  void submitData() {
    final titleInput = titleController.text;
    final amountInput = double.parse((amountController.text));

    if (titleInput.isEmpty || amountInput <= 0) {
      return;
    }
    addNewTransaction(
      titleInput,
      amountInput,
    );
  }

  NewTransaction(this.addNewTransaction);

  @override
  Widget build(BuildContext context) {
    return Card(
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
                    MaterialStateProperty.all(Colors.purple.shade500),
              ),
              child: const Text("Add Transaction"),
            ),
          ],
        ),
      ),
    );
  }
}
