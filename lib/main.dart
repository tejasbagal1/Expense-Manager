import 'package:expence_tracker/transaction.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Expense Tracker App",
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  List<Card> lc = [];

  final List<Transaction> transactions = [
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Expense Tracker"),
      ),
      body: Column(
        // we want to divide homepage into chart and list 1 above other

        children: [
          Container(
            width: double.infinity,
            height: 50,
            child: Card(
              elevation: 5,
              color: Colors.deepPurple.shade400,
              child: Text("CHART!"),
            ),
          ),
          Column(
            children: [
              ...transactions.map((tx) {
                return Card(
                  child: Row(
                    children: [
                      Container(
                        alignment: Alignment.center,
                        margin: EdgeInsets.symmetric(
                          vertical: 10,
                          horizontal: 20,
                        ),
                        padding: EdgeInsets.symmetric(
                          vertical: 10,
                          horizontal: 10,
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(
                            Radius.circular(5),
                          ),
                          color: Colors.purple.shade100,
                        ),
                        //width: 65,
                        child: Text(
                          "\$${tx.amount}",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                            color: Colors.black.withOpacity(0.9),
                          ),
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            tx.title,
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w700,
                              color: Colors.black.withOpacity(0.7),
                            ),
                          ),
                          Text(tx.date.toString(), 
                            style: TextStyle(
                              color: Colors.grey,
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                );
              }).toList(),
            ],
          )
        ],
      ),
    );
  }
}
