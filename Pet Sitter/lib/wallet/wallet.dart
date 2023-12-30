// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, use_key_in_widget_constructors, sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'wallet_model.dart';
import 'package:intl/intl.dart';

class WalletPage extends StatelessWidget {
  get transactions => null;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: WalletCard(), // Use the WalletCard class
          ),
          Expanded(
            child: AddCard(), // Use another custom section class
          ),
          Expanded(
            child: Optioncard(), // Use another custom section class
          ),
          Expanded(
            // Pass a valid instance of Transactions here, not null
            child: HistoryScreen(),
          ),
        ],
      ),
    );
  }
}

class WalletCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Align(
        alignment: Alignment.topCenter,
        child: Container(
            width: 450, // Set the desired width here
            height: 250, // Set the desired height here
            child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25),
                ),
                color: Color.fromARGB(255, 71, 61, 129),
                elevation: 5,
                child: Center(
                    child: Row(children: [
                  // Left side (title and subtitle)
                  Expanded(
                    child: ListTile(
                      title: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons
                                .account_balance_wallet, // Replace with your desired icon
                            size: 30,
                            color: Colors.white,
                          ),
                          SizedBox(
                              height:
                                  8), // Add some spacing between the icon and text
                          Text(
                            "My Balance",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.normal,
                              color: Colors.white,
                            ),
                          ),
                          Text(
                            "250฿",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  // Right side (ClipRRect and image)
                  ClipRRect(
                    borderRadius: BorderRadius.circular(0), // Square shape
                    child: Image.asset(
                      "images/chamber card.png",
                      fit: BoxFit.cover,
                    ),
                  )
                ])))));
  }
}

//class transaction
class AddCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Align(
        alignment: Alignment.topCenter,
        child: Container(
            width: 450, // Set the desired width here
            height: 90, // Set the desired height here
            child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25),
                ),
                color: Color.fromARGB(255, 71, 61, 129),
                elevation: 5,
                child: Center(
                    child: Row(children: [
                  // Left side (title and subtitle)
                  Expanded(
                    child: ListTile(
                      title: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Icon(
                            Icons.credit_card, // Replace with your desired icon
                            size: 25,
                            color: Colors.white,
                          ),
                          SizedBox(
                              height:
                                  8), // Add some spacing between the icon and text
                          Text(
                            "Add a card",
                            textAlign: TextAlign.start,
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                          Text(
                            "A credit card or debit card",
                            textAlign: TextAlign.start,
                            style: TextStyle(
                              fontSize: 10,
                              fontWeight: FontWeight.normal,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                ])))));
  }
}

//class optioncard
class Optioncard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        mainAxisAlignment:
            MainAxisAlignment.center, // Center the buttons horizontally
        children: [
          ...List.generate(walletData.length, (index) {
            return Container(
              margin: const EdgeInsets.only(
                top: 5,
                left: 12,
                right: 5,
                bottom: 5,
              ),
              child: Column(
                children: [
                  Stack(
                    alignment: Alignment.center,
                    children: [
                      ElevatedButton.icon(
                        onPressed: () {
                          // Handle button click here
                        },
                        icon: Image.asset(
                          "${walletData[index]["img"]}",
                          width: 65.0,
                          height: 65.0,
                        ),
                        label: Text(
                          "", // Replace with your button text
                        ),
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(
                            const Color.fromARGB(255, 251, 251, 251),
                          ),
                        ),
                      )
                    ],
                  ),
                  const SizedBox(height: 8),
                  Text(walletData[index]["name"])
                ],
              ),
            );
          })
        ],
      ),
    );
  }
}

class Transaction {
  final String title;
  final String detailtran;
  final String date;
  final double amount;

  Transaction({
    required this.title,
    required this.detailtran,
    required this.date,
    required this.amount,
  });

  String getFormattedAmount() {
    final currencyFormat = NumberFormat.currency(symbol: '฿', decimalDigits: 2);
    return currencyFormat.format(amount);
  }
}

class HistoryScreen extends StatelessWidget {
  final List<Transaction> transactions = [
    Transaction(title: 'Top up', detailtran:"From Credit Card" ,date: 'Sep 20, 2023', amount: 100.0),
    Transaction(title: 'Payment', detailtran: "To Johnson(PetSitter)",date: 'Sep 19, 2023', amount: -100.0),
    Transaction(title: 'Top up', detailtran: "From True Money",date: 'Sep 18, 2023', amount: 250.0),
    Transaction(title: 'Payment',detailtran:  "To Elenor (Pet Adoption)",date: 'Sep 15, 2023', amount: -50.0),
    Transaction(title: 'Payment', detailtran: "To Amit (Pet Supplies)",date: 'Sep 12, 2023', amount: -100.0),
    Transaction(title: 'Top up', detailtran: "From True Money",date: 'Sep 10, 2023', amount: 300.0),
    Transaction(title: 'Payment', detailtran: "To Pet Lab",date: 'Sep 5, 2023', amount: -80.0),
    Transaction(title: 'Top up', detailtran: "From True Money",date: 'Sep 2, 2023', amount: 150.0),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: transactions.length,
        itemBuilder: (BuildContext context, int index) {
          final transaction = transactions[index];
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      TransactionDetailScreen(transaction: transaction),
                  fullscreenDialog: true,
                ),
              );
            },
            child: Card(
              elevation: 2,
              margin: EdgeInsets.fromLTRB(220, 3, 220, 3),
              child: ListTile(
                leading: Icon(
                  transaction.amount > 0
                      ? Icons.arrow_upward
                      : Icons.arrow_downward,
                  color: transaction.amount > 0 ? Colors.green : Colors.red,
                ),
                title: Text(transaction.title),
                subtitle: Text(transaction.detailtran),
                trailing: Column(
                  children: [
                    Text(
                      transaction.getFormattedAmount(), // Use the formatted amount
                      style: TextStyle(
                        color: transaction.amount > 0 ? Colors.green : Colors.red,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  Text(transaction.date)
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

class TransactionDetailScreen extends StatelessWidget {
  final Transaction transaction;

  TransactionDetailScreen({required this.transaction});

  @override
  Widget build(BuildContext context) {
  return Scaffold(
    appBar: AppBar(
      title: Text('Transaction Detail'),
    ),
    body: Center(
      child: Card(
        margin: EdgeInsets.fromLTRB(200, 100, 200, 100), // Adjust the margin as needed
        elevation: 4.0, // Adds a shadow to the card
        child: Padding(
          padding: const EdgeInsets.all(16.0), // Padding inside the card
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "TRANSACTION DETAILS",
                style: TextStyle(
                  fontSize: 30,
                  color: Colors.black87,
                ),
              ),
              Row(
                children: [
                  Image.asset(
                    "images/dialog_success_image.png",
                    height: 45,
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  Text(
                    "STATUS: Successful",
                    style: TextStyle(
                      fontSize: 18,
                      color: Color.fromARGB(126, 0, 0, 0),
                    ),
                  ),
                ],
              ),
              ListTile(
                title: Text(
                  'TRANSACTION TYPE:',
                  style: TextStyle(
                    fontSize: 18,
                    color: Color.fromARGB(145, 0, 0, 0),
                  ),
                ),
                trailing: Text(
                  '${transaction.title}',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                    color: Colors.black,
                  ),
                ),
              ),
              ListTile(
                title: Text(
                  'DETAIL:',
                  style: TextStyle(
                    fontSize: 18,
                    color: Color.fromARGB(145, 0, 0, 0),
                  ),
                ),
                trailing: Text(
                  '${transaction.detailtran}',
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.black,
                  ),
                ),
              ),
              ListTile(
                title: Text(
                  'DATE:',
                  style: TextStyle(
                    fontSize: 18,
                    color: Color.fromARGB(145, 0, 0, 0),
                  ),
                ),
                trailing: Text(
                  '${transaction.date}',
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.black,
                  ),
                ),
              ),
              Divider(),
              ListTile(
                title: Text(
                  'AMOUNT:',
                  style: TextStyle(
                    fontSize: 18,
                    color: Color.fromARGB(145, 0, 0, 0),
                  ),
                ),
                trailing: Text(
                  '${transaction.getFormattedAmount()}',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 21,
                    color: transaction.amount > 0 ? Colors.green : Colors.red,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    ),
  );
}
}