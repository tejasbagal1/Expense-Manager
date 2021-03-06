import 'package:expence_tracker/models/transaction.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> userTransactions;
  final Function deleteTransaction;
  static const int $chi = 0x03C7;
  TransactionList(this.userTransactions, this.deleteTransaction);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 380,
      child: userTransactions.isEmpty
          ? Column(
              children: [
                Text(
                  "No transactions yet!",
                  style: TextStyle(
                    fontSize: 30,
                    color: Colors.grey,
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Container(
                  height: 200,
                  child: Image.asset(
                    'assets/images/sleep.png',
                    fit: BoxFit.cover,
                  ),
                ),
              ],
            )
          : ListView.builder(
              itemCount: userTransactions.length,
              itemBuilder: (ctx, ind) {
                return Card(
                  elevation: 5,
                  margin: EdgeInsets.symmetric(vertical: 5, horizontal: 3),
                  child: ListTile(
                    leading: FittedBox(
                      child: CircleAvatar(
                        radius: 40,
                        backgroundColor: Theme.of(context).primaryColorLight,
                        child: Text(
                          "\$${userTransactions[ind].amount.toStringAsFixed(2)}",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w700,
                            color: Colors.black.withOpacity(0.9),
                          ),
                        ),
                      ),
                    ),
                    title: Text(
                      userTransactions[ind].title,
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w700,
                        color: Colors.black.withOpacity(0.7),
                      ),
                    ),
                    subtitle: Text(
                      DateFormat.yMMMEd()
                          .add_jm()
                          .format(userTransactions[ind].date),
                      style: TextStyle(
                        color: Colors.grey,
                        fontFamily: 'Meta',
                      ),
                    ),
                    trailing: IconButton(
                      icon: Icon(Icons.delete),
                      onPressed: () {
                        deleteTransaction(userTransactions[ind].id);
                      },
                      color: Theme.of(context).errorColor,
                    ),
                  ),
                );
              },
            ),
    );
  }
}



// child: Row(
//   children: [
//     Container(
//       alignment: Alignment.center,
//       margin: EdgeInsets.symmetric(
//         vertical: 10,
//         horizontal: 20,
//       ),
//       padding: EdgeInsets.symmetric(
//         vertical: 10,
//         horizontal: 10,
//       ),
//       decoration: BoxDecoration(
//         borderRadius: BorderRadius.all(
//           Radius.circular(5),
//         ),
//         color: Theme.of(context).primaryColorLight,
//       ),
//       //width: 65,
//       child: Text(
//         "\$${userTransactions[ind].amount.toStringAsFixed(2)}",
//         style: TextStyle(
//           fontSize: 16,
//           fontWeight: FontWeight.w700,
//           color: Colors.black.withOpacity(0.9),
//         ),
//       ),
//     ),
//     Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Text(
//           userTransactions[ind].title,
//           style: TextStyle(
//             fontSize: 14,
//             fontWeight: FontWeight.w700,
//             color: Colors.black.withOpacity(0.7),
//           ),
//         ),
//         Text(
//           DateFormat.yMMMEd().add_jm().format(DateTime.now()),
//           style: TextStyle(
//             color: Colors.grey,
//             fontFamily: 'Meta',
//           ),
//         ),
//       ],
//     )
//   ],
// ),