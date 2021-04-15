import 'package:expence_tracker/models/transaction.dart';
import 'package:expence_tracker/widgets/chart_bar.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Chart extends StatelessWidget {
  Chart(this.recentTransactions);
  final List<Transaction> recentTransactions;

  List<Map<String, Object>> get allTransactionsOfTheDayGrouped {
    return List.generate(
      7,
      (index) {
        double totalSum = 0.0;
        final weekDay = DateTime.now().subtract(
            Duration(days: index)); //subtracts the index days from current day
        for (int i = 0; i < recentTransactions.length; i++) {
          if (recentTransactions[i].date.day == weekDay.day &&
              recentTransactions[i].date.month == weekDay.month &&
              recentTransactions[i].date.year == weekDay.year) {
            totalSum += recentTransactions[i].amount;
          }
        }
        return {'day': DateFormat.E().format(weekDay), 'totalAmount': totalSum};
      },
    );
  }

  double get totalSpendingOfLast7Days {
    double tot = 0.0;
    for (int i = 0; i < allTransactionsOfTheDayGrouped.length; i++) {
      tot += double.parse(
          allTransactionsOfTheDayGrouped[i]['totalAmount'].toString());
    }
    return tot;
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 6,
      margin: EdgeInsets.all(20),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            ...allTransactionsOfTheDayGrouped.map((wtx) {
              return ChartBar(
                wtx['day'].toString(),
                wtx['totalAmount'] as double,
                (wtx['totalAmount'] as double)/totalSpendingOfLast7Days,
              );
            }).toList()
          ],
        ),
      ),
    );
  }
}
