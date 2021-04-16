import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

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
  DateTime chosenDate = DateTime.now();

  void submitData() {
    final titleInput = titleController.text;
    final amountInput = double.parse((amountController.text));
    final dateInput = chosenDate;
    if (titleInput.isEmpty || amountInput <= 0) {
      return;
    }
    widget.addNewTransaction(
      titleInput,
      amountInput,
      dateInput,
    );
    Navigator.of(context).pop();
  }

  void _selectDate() {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2021, 1, 1),
      lastDate: DateTime.now(),
    ).then((selectedDate) {
      if (selectedDate == null) {
        return;
      }
      setState(() {
        // very important as if not wrapped in setState, no changes are reflected in thr text fiels
        chosenDate = selectedDate;
      });
    });
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
            SizedBox(
              height: 20,
            ),
            Row(
              children: [
                Text(DateFormat.yMd().format(chosenDate)),
                IconButton(
                  onPressed: _selectDate,
                  icon: Icon(Icons.date_range_rounded),
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            FloatingActionButton(
              onPressed: submitData,
              child: Icon(Icons.check_rounded),
              backgroundColor: Theme.of(context).primaryColor,
              foregroundColor: Colors.white,
            ),
          ],
        ),
      ),
    );
  }
}
