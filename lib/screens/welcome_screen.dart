import 'package:flutter/material.dart';
import 'account_list_screen.dart';
import 'package:intl/intl.dart';

class WelcomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    String todayDate = DateFormat.yMMMMd().format(DateTime.now());

    return Scaffold(
      backgroundColor: Colors.white, // Set background color
      appBar: AppBar(
        title: Text("Welcome"),
        backgroundColor: Colors.blue.shade900, // Professional dark blue header
        elevation: 0,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Gradient Header
          Container(
            width: double.infinity,
            height: 250,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.blue.shade900, Colors.blue.shade600],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(40),
                bottomRight: Radius.circular(40),
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset('assets/logo.png', height: 100), // Bank Logo
                SizedBox(height: 10),
                Text(
                  "Welcome to My Bank",
                  style: TextStyle(
                    fontSize: 26,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                SizedBox(height: 5),
                Text(
                  "Today's Date: $todayDate",
                  style: TextStyle(fontSize: 16, color: Colors.white70),
                ),
              ],
            ),
          ),

          SizedBox(height: 50),

          // Welcome Message
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Text(
              "Manage your accounts and transactions with ease.",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 18,
                color: Colors.blue.shade900,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),

          SizedBox(height: 30),

          // View Accounts Button
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => AccountListScreen()),
              );
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.blue.shade900,
              padding: EdgeInsets.symmetric(horizontal: 40, vertical: 15),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
              ),
            ),
            child: Text(
              "View Accounts",
              style: TextStyle(fontSize: 18, color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}
