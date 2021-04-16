import 'package:expence_tracker/widgets/chart.dart';
import 'package:expence_tracker/widgets/new_transaction.dart';
import 'package:expence_tracker/widgets/transaction_list.dart';
import 'package:flutter/material.dart';
import 'models/transaction.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Expense Tracker App",
      home: MyHomePage(),
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          primarySwatch: Colors.green,
          accentColor: Colors.amber,
          fontFamily: 'Nunito'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
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

  void addNewTransaction(String title, double amount, DateTime date) {
    Transaction newTx = Transaction(
      id: DateTime.now().toString(),
      title: title,
      amount: amount,
      date: date,
    );

    setState(() {
      userTransactions.add(newTx);
    });
  }

  void deleteTransaction(String id) {
    setState(() {
      userTransactions.removeWhere((tx) => tx.id == id);
    });
  }

  void startAddNewTransaction(BuildContext ctx) {
    showModalBottomSheet(
      context: ctx,
      builder: (_) {
        return NewTransaction(addNewTransaction);
      },
      enableDrag: true,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      backgroundColor: Colors.white,
    );
  }

  List<Transaction> get recentTransactions {
    return userTransactions.where((tx) {
      return tx.date.isAfter(DateTime.now().subtract(Duration(days: 7)));
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Expense Tracker"),
        actions: [
          IconButton(
            onPressed: () {
              startAddNewTransaction(context);
            },
            icon: const Icon(
              Icons.add,
              color: Colors.white,
            ),
            color: Colors.white,
            iconSize: 30,
          )
        ],
      ),
      body: Column(
        // we want to divide homepage into chart and list 1 above other

        children: [
          Chart(recentTransactions),
          TransactionList(userTransactions, deleteTransaction),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          startAddNewTransaction(context);
        },
      ),
    );
  }
}
