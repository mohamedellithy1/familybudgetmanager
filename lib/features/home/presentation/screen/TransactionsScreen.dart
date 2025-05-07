import 'package:flutter/material.dart';

class TransactionsScreen extends StatelessWidget {
  final List<Map<String, String>> transactions = [
    {'title': 'Groceries', 'date': '12/12/2023', 'amount': '-\$50'},
    {'title': 'Rent', 'date': '01/12/2023', 'amount': '-\$1000'},
    {'title': 'Bills', 'date': '05/12/2023', 'amount': '-\$200'},
    {'title': 'Coffee', 'date': '10/12/2023', 'amount': '-\$5'},
    {'title': 'Gas', 'date': '11/12/2023', 'amount': '-\$40'},
  ];

  TransactionsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Transactions'),
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              // Implement search functionality
            },
          ),
          IconButton(
            icon: Icon(Icons.filter_list),
            onPressed: () {
              // Implement filter functionality
            },
          ),
          IconButton(
            icon: Icon(Icons.sort),
            onPressed: () {
              // Implement sort functionality
            },
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: transactions.length,
        itemBuilder: (context, index) {
          final transaction = transactions[index];
          return Dismissible(
            key: Key(transaction['title']!),
            direction: DismissDirection.endToStart,
            background: Container(
              alignment: Alignment.centerRight,
              padding: EdgeInsets.symmetric(horizontal: 20),
              color: Colors.red,
              child: Icon(Icons.delete, color: Colors.white),
            ),
            onDismissed: (direction) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('${transaction['title']} deleted')),
              );
            },
            child: Card(
              margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
              child: ListTile(
                leading: Icon(Icons.shopping_cart),
                title: Text(transaction['title']!),
                subtitle: Text(transaction['date']!),
                trailing: Text(transaction['amount']!),
              ),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Add new transaction
        },
        backgroundColor: Colors.blue,
        elevation: 5,
        child: Icon(Icons.add),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(
            icon: Icon(Icons.list),
            label: 'Transactions',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.bar_chart),
            label: 'Reports',
          ),
        ],
        currentIndex: 1,
        selectedItemColor: Colors.amber[800],
        onTap: (index) {
          // Handle navigation
        },
      ),
    );
  }
}
