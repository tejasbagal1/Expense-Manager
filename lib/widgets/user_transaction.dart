import 'package:expence_tracker/models/transaction.dart';
import 'package:expence_tracker/widgets/new_transaction.dart';
import 'package:expence_tracker/widgets/transaction_list.dart';
import 'package:flutter/material.dart';

class UserTransaction extends StatefulWidget {
  @override
  _UserTransactionState createState() => _UserTransactionState();
}

class _UserTransactionState extends State<UserTransaction> {
  final List<Transaction> userTransactions = [
    Transaction(
      id: "t1",
      title: "Milk",
      amount: 85,
      date: DateTime.now(),
    ),
    Transaction(
      id: "t2",
      title: "Juice",
      amount: 30,
      date: DateTime.now(),
    ),
  ];

 
  void addNewTransaction(String title, double amount) {
    Transaction newTx = Transaction(
      id: DateTime.now().toString(),
      title: title,
      amount: amount,
      date: DateTime.now(),
    );

    setState(() {
      userTransactions.add(newTx);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        NewTransaction(addNewTransaction),
        TransactionList(userTransactions),
      ],
    );
  }
}
