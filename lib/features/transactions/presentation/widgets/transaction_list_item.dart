import 'package:flutter/material.dart';
import 'package:flutter_appwrite/core/presentation/routes.dart';
import 'package:flutter_appwrite/features/transactions/data/model/transaction.dart';
import 'package:intl/intl.dart';

class TransactionListItem extends StatelessWidget {
  const TransactionListItem({
    Key key,
    @required this.transaction,
  }) : super(key: key);

  final Transaction transaction;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(transaction.transactionType == 1
          ? Icons.account_balance_wallet
          : Icons.view_list),
      title: Text(transaction.title),
      subtitle: Text(DateFormat.yMMMEd().format(transaction.transactionDate)),
      trailing: Text(transaction.amount.toString()),
      onTap: () {
        Navigator.pushNamed(context, AppRoutes.transactionDetails,
            arguments: transaction);
      },
      onLongPress: () {
        Navigator.pushNamed(context, AppRoutes.editTransaction,
            arguments: transaction);
      },
    );
  }
}
