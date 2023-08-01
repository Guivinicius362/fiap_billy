import 'package:billy/features/home/main_screen.dart';
import 'package:flutter/material.dart';

void main() => runApp(FinancialSummaryApp());

class FinancialSummaryApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: FinancialSummaryScreen(),
    );
  }
}

class FinancialSummaryScreen extends StatelessWidget {
  final List<FinancialItem> earnings = [
    FinancialItem(description: 'Salary', amount: 2500.0),
    FinancialItem(description: 'Rent', amount: 1200.0),
    FinancialItem(description: 'Rent', amount: 1200.0),
    FinancialItem(description: 'Rent', amount: 1200.0),
    FinancialItem(description: 'Rent', amount: 1200.0),
    FinancialItem(description: 'Rent', amount: 1200.0),
    FinancialItem(description: 'Rent', amount: 1200.0),
    // Add more earnings as needed
  ];

  final List<FinancialItem> expenses = [
    FinancialItem(description: 'Utilities', amount: -500.0),
    FinancialItem(description: 'Groceries', amount: -300.0),
    FinancialItem(description: 'Groceries', amount: -300.0),
    FinancialItem(description: 'Groceries', amount: -300.0),
    FinancialItem(description: 'Groceries', amount: -300.0),
    FinancialItem(description: 'Groceries', amount: -300.0),
    FinancialItem(description: 'Groceries', amount: -300.0),
    // Add more expenses as needed
  ];

  final List<CreditCard> creditCards = [
    CreditCard(
      bankName: 'Bank A',
      cardNumber: '3456',
      expirationDate: '12/25',
      limit: 5000.0,
      utilization: 3000.0,
    ),
    CreditCard(
      bankName: 'Bank B',
      cardNumber: '7654',
      expirationDate: '09/24',
      limit: 8000.0,
      utilization: 4000.0,
    ),
    // Add more credit cards as needed
  ];

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.all(16.0),
      children: [
        _buildFinancialSection('Earnings', earnings),
        SizedBox(height: 16.0),
        _buildFinancialSection('Expenses', expenses),
        SizedBox(height: 16.0),
        Text(
          'Bank Accounts',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 12.0),
        BankAccountsSummary(),
        SizedBox(height: 16.0),
        _buildCreditCards(creditCards)
      ],
    );
  }

  // ... (same as before)
}

Widget _buildFinancialSection(String title, List<FinancialItem> items) {
  return Expanded(
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          title,
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 12.0),
        Container(
          height: 100.0,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: items.length,
            itemBuilder: (context, index) {
              return _buildFinancialItemCard(items[index]);
            },
          ),
        ),
      ],
    ),
  );
}

Widget _buildFinancialItemCard(FinancialItem item) {
  Color amountColor = item.amount >= 0 ? Colors.green : Colors.red;
  return Card(
    child: Container(
      width: 120.0,
      padding: EdgeInsets.all(12.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Text(
            item.description,
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          Text(
            '\$${item.amount.toStringAsFixed(2)}',
            style: TextStyle(color: amountColor),
          ),
        ],
      ),
    ),
  );
}

Widget _buildCreditCards(List<CreditCard> creditCards) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.stretch,
    children: [
      Text(
        'Credit Cards',
        style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
      ),
      SizedBox(height: 12.0),
      ListView.builder(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        itemCount: creditCards.length,
        itemBuilder: (context, index) {
          CreditCard card = creditCards[index];
          double utilizedPercentage = card.utilization / card.limit;

          return ListTile(
            leading: Icon(Icons.credit_card),
            title: Text('${card.bankName} - ${card.cardNumber}'),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text('Expiration: ${card.expirationDate}'),
                SizedBox(height: 8),
                LinearProgressIndicator(
                  value: utilizedPercentage,
                  backgroundColor: Colors.green,
                  valueColor: AlwaysStoppedAnimation<Color>(Colors.red),
                ),
                SizedBox(height: 8),
                Text('Utilized: \$${card.utilization.toStringAsFixed(2)}'),
              ],
            ),
          );
        },
      ),
    ],
  );
}

class FinancialItem {
  final String description;
  final double amount;

  FinancialItem({required this.description, required this.amount});
}

class BankAccountsSummary extends StatelessWidget {
  final List<BankAccount> bankAccounts = [
    BankAccount(bankName: 'Bank A', accountNumber: '123456', balance: 1500.0),
    BankAccount(bankName: 'Bank B', accountNumber: '789012', balance: 3000.0),
    // Add more bank accounts as needed
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemCount: bankAccounts.length,
      itemBuilder: (context, index) {
        BankAccount account = bankAccounts[index];
        return ListTile(
          leading: Icon(Icons.account_balance),
          title: Text('${account.bankName} - ${account.accountNumber}'),
          subtitle: Text('Balance: \$${account.balance.toStringAsFixed(2)}'),
        );
      },
    );
  }
}

class BankAccount {
  final String bankName;
  final String accountNumber;
  final double balance;

  BankAccount({
    required this.bankName,
    required this.accountNumber,
    required this.balance,
  });
}
