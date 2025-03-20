import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class TransactionScreen extends StatefulWidget {
  final String accountType;
  TransactionScreen({required this.accountType});

  @override
  _TransactionScreenState createState() => _TransactionScreenState();
}

class _TransactionScreenState extends State<TransactionScreen> {
  List transactions = [];

  @override
  void initState() {
    super.initState();
    loadTransactions();
  }

  Future<void> loadTransactions() async {
    String data = await rootBundle.loadString('assets/transactions.json');
    Map<String, dynamic> jsonData = jsonDecode(data);
    
    setState(() {
      transactions = jsonData['transactions'][widget.accountType] ?? [];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("${widget.accountType} Transactions")),
      body: ListView.builder(
        itemCount: transactions.length,
        itemBuilder: (context, index) {
          var transaction = transactions[index];
          return Card(
            child: ListTile(
              title: Text(transaction['description']),
              subtitle: Text(transaction['date']),
              trailing: Text(
                "\$${transaction['amount']}",
                style: TextStyle(
                  color: transaction['amount'] >= 0 ? Colors.green : Colors.red,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.arrow_back),
        onPressed: () {
          Navigator.pop(context);
        },
      ),
    );
  }
}
