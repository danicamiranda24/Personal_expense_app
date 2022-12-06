import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/models/transaction.dart';
import 'package:intl/intl.dart';
import './transaction_item.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;
  final Function deleteTx;

  TransactionList(this.transactions, this.deleteTx);

  @override
  Widget build(BuildContext context) {
    print('build() TransactionList');
    return Container(
      height: MediaQuery.of(context).size.height * 0.6,
      child: transactions.isEmpty
          ? LayoutBuilder(builder: (ctx, constraints) {
              return Column(
                children: [
                  Text(
                    'There is no transaction here!',
                    style: Theme.of(context).textTheme.titleSmall,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    height: constraints.maxHeight * 0.6,
                    child: Image.asset(
                      'assets/images/waiting.png',
                      fit: BoxFit.contain,
                    ),
                  )
                ],
              );
            })
          : ListView(
              children: transactions
                  .map(
                    (tx) => TransactionItem(
                        key: ValueKey(tx.id),
                        transaction: tx,
                        deleteTx: deleteTx),
                  )
                  .toList()),
    );
  }
}
