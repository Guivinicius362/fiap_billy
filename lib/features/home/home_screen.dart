import 'package:flutter/material.dart';

void main() => runApp(HomeScreenApp());

class HomeScreenApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  final String username = "Fulano"; // Replace with the actual username

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('Olá $username')),
        actions: [
          IconButton(
            icon: Icon(Icons.account_circle),
            onPressed: () {},
          ),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: MediaQuery.of(context).size.height * 0.3,
            child: NotificationCarousel(), // Custom carousel widget
          ),
          SizedBox(height: 24.0),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.0),
            child: Text(
              'Resumo',
              style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SizedBox(height: 12.0),
          Expanded(
            child: BankAccountsSummary(), // Custom bank accounts summary widget
          ),
        ],
      ),
    );
  }
}

class NotificationCarousel extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Replace this with the actual carousel implementation
    // For example, you can use the "carousel_slider" package
    return Container(
      color: Colors.blueGrey,
      child: Center(
        child: Text(
          'Notification Carousel',
          style: TextStyle(color: Colors.white, fontSize: 20.0),
        ),
      ),
    );
  }
}

class BankAccountsSummary extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 5,
      itemBuilder: (context, index) {
        double balance = 1000.00;

        return ListTile(
          title: Text('$balance'),
          subtitle: Text('Saldo'),
          trailing: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [Icon(Icons.account_balance)],
          ),
        );
      },
    );
  }
}
