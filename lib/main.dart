import 'package:expence_tracker/widgets/user_transaction.dart';
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
        debugShowCheckedModeBanner: false);
  }
}

class MyHomePage extends StatelessWidget {
  // late String titleInput;
  // late String amountInput;
  // instead use this->

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Expense Tracker"),
        actions: [
          IconButton(
            onPressed: () {},
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
          Container(
            width: double.infinity,
            height: 50,
            child: Center(
              child: Card(
                elevation: 5,
                color: Colors.deepPurple.shade400,
                child: Text("CHART!"),
              ),
            ),
          ),
          UserTransaction(),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {},
      ),
    );
  }
}
