import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:weincoders_app/mocks/TransactionMocks.dart';

class TransactionPage extends StatefulWidget {
  const TransactionPage({super.key});
  @override
  _TransactionPageState createState() => _TransactionPageState();
}

class _TransactionPageState extends State<TransactionPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('All Transactions')),
      body: Center(
        child: ListView.builder(
          itemBuilder: (context, indice) {
            print(indice);
            return Container(
              height: 144,
              width: 300,
              margin: EdgeInsets.all(16),
              decoration: BoxDecoration(color: Colors.deepPurple),
              child: Text(Transactions[indice]),
            );
          },
          itemCount: Transactions.length,
        ),
      ),
    );
  }
}
