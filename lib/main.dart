import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'screens/welcome_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  
  // Verify JSON file accessibility
  try {
    String accountsData = await rootBundle.loadString('assets/accounts.json');
    String transactionsData = await rootBundle.loadString('assets/transactions.json');
    print("Accounts JSON Loaded Successfully: ${jsonDecode(accountsData)}");
    print("Transactions JSON Loaded Successfully: ${jsonDecode(transactionsData)}");
  } catch (e) {
    print("Error loading JSON: $e");
  }
  
  runApp(MyBankApp());
}

class MyBankApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Mobile Banking App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: WelcomeScreen(),
    );
  }
}
