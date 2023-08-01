import 'package:flutter/material.dart';

class MainScreen extends StatelessWidget {
  final String username = "Fulano"; // Replace with the actual username

  final List<CreditCard> creditCards = [
    CreditCard(
      bankName: 'Bank A',
      cardNumber: '3456',
      expirationDate: '12/25',
      limit: 1000.0,
      utilization: 300.0,
    ),
    CreditCard(
      bankName: 'Bank B',
      cardNumber: '7654',
      expirationDate: '09/24',
      limit: 5000.0,
      utilization: 2500.0,
    ),
  ];
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
            padding: EdgeInsets.symmetric(horizontal: 16.0),
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
          SizedBox(height: 12.0),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            child: Text(
              'Cartões',
              style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SizedBox(height: 12.0),
          Expanded(
              child: ListView.builder(
            itemCount: creditCards.length,
            itemBuilder: (context, index) {
              return CreditCardItem(creditCard: creditCards[index]);
            },
          ))
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
          title: Text('Saldo'),
          subtitle: Text('$balance'),
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

class CreditCard {
  final String bankName;
  final String cardNumber;
  final String expirationDate;
  final double limit;
  final double utilization;

  CreditCard({
    required this.bankName,
    required this.cardNumber,
    required this.expirationDate,
    required this.limit,
    required this.utilization,
  });

  double get utilizationPercentage {
    return utilization / limit;
  }
}

class CreditCardItem extends StatelessWidget {
  final CreditCard creditCard;

  CreditCardItem({required this.creditCard});

  @override
  Widget build(BuildContext context) {
    print(creditCard.utilizationPercentage);

    return Padding(
      padding: EdgeInsets.all(16.0),
      child: Card(
        elevation: 4.0,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              height: 10,
              child: Stack(
                children: [
                  Container(
                    color: Colors.green,
                    width: creditCard.limit,
                  ),
                  Container(
                    color: Colors.red,
                    width: creditCard.utilizationPercentage *
                        MediaQuery.of(context).size.width,
                  ),
                ],
              ),
            ),
            ListTile(
              title: Text('Limit: \$${creditCard.limit.toStringAsFixed(2)}'),
              subtitle: Text(
                  'Utilized: \$${creditCard.utilization.toStringAsFixed(2)}'),
              trailing: Icon(Icons.account_balance),
            ),
            ListTile(
              title: Text('Expiration: ${creditCard.expirationDate}'),
              subtitle: Text('Card Number: ${creditCard.cardNumber}'),
              trailing: TextButton(
                onPressed: () {
                  // Implement the "Pay Now" functionality here
                  // Replace with your actual payment logic
                },
                style: TextButton.styleFrom(
                  foregroundColor: Colors.white,
                  backgroundColor: Color.fromARGB(255, 203, 3, 183),
                  padding: EdgeInsets.symmetric(horizontal: 24, vertical: 10),
                ),
                child: Text('Pay Now with Billy'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}