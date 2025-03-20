import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'transaction_screen.dart';

class AccountListScreen extends StatefulWidget {
  @override
  _AccountListScreenState createState() => _AccountListScreenState();
}

class _AccountListScreenState extends State<AccountListScreen> {
  List accounts = [];

  @override
  void initState() {
    super.initState();
    loadAccounts();
  }

  Future<void> loadAccounts() async {
    String data = await rootBundle.loadString('assets/accounts.json');
    setState(() {
      accounts = jsonDecode(data)['accounts'];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Accounts")),
      body: ListView.builder(
        itemCount: accounts.length,
        itemBuilder: (context, index) {
          var account = accounts[index];
          return Card(
            child: ListTile(
              title: Text(account['type']),
              subtitle: Text("Account: ${account['account_number']}\nBalance: \$${account['balance']}"),
              trailing: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => TransactionScreen(accountType: account['type']),
                    ),
                  );
                },
                child: Text("View Transactions"),
              ),
            ),
          );
        },
      ),
    );
  }
}
