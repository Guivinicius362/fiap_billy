import 'package:billy/features/finance/finance_screen.dart';
import 'package:flutter/material.dart';

class MonthSummary {
  final String currentMonth;
  final String nextMonth;
  final List<FinancialItem> earnings;
  final List<FinancialItem> expenses;

  MonthSummary({
    required this.currentMonth,
    required this.nextMonth,
    required this.earnings,
    required this.expenses,
  });

  double get totalEarnings =>
      earnings.map((item) => item.amount).fold(0, (a, b) => a + b);

  double get totalExpenses =>
      expenses.map((item) => item.amount).fold(0, (a, b) => a + b);

  double get totalBalance => totalEarnings - totalExpenses;
}

class MouthSummaryScreen extends StatelessWidget {
  // Sample earnings and expenses lists (replace with your own data)
  final List<FinancialItem> earnings = [
    FinancialItem(description: 'Salary', amount: 2500.0),
    FinancialItem(description: 'Freelance', amount: 1200.0),
    FinancialItem(description: 'Freelance', amount: 1200.0),
    FinancialItem(description: 'Freelance', amount: 1200.0),
    FinancialItem(description: 'Freelance', amount: 1200.0),
    FinancialItem(description: 'Freelance', amount: 1200.0),
    FinancialItem(description: 'Freelance', amount: 1200.0),
    // Add more earnings as needed
  ];

  final List<FinancialItem> expenses = [
    FinancialItem(description: 'Rent', amount: -1000.0),
    FinancialItem(description: 'Utilities', amount: -300.0),
    FinancialItem(description: 'Utilities', amount: -300.0),
    FinancialItem(description: 'Utilities', amount: -300.0),
    FinancialItem(description: 'Utilities', amount: -300.0),
    FinancialItem(description: 'Utilities', amount: -300.0),
    FinancialItem(description: 'Utilities', amount: -300.0),
    // Add more expenses as needed
  ];

  final List<MonthSummary> monthSummaries = [
    MonthSummary(
      currentMonth: 'July',
      nextMonth: 'August',
      earnings: [
        FinancialItem(description: 'Salary', amount: 3000.0),
        FinancialItem(description: 'Bonus', amount: 500.0),
        FinancialItem(description: 'Bonus', amount: 500.0),
        FinancialItem(description: 'Bonus', amount: 500.0),
        FinancialItem(description: 'Bonus', amount: 500.0),
        FinancialItem(description: 'Bonus', amount: 500.0),
        // Add more earnings for July as needed
      ],
      expenses: [
        FinancialItem(description: 'Rent', amount: -1200.0),
        FinancialItem(description: 'Utilities', amount: -300.0),
        FinancialItem(description: 'Utilities', amount: -300.0),
        FinancialItem(description: 'Utilities', amount: -300.0),
        FinancialItem(description: 'Utilities', amount: -300.0),
        FinancialItem(description: 'Utilities', amount: -300.0),
        // Add more expenses for July as needed
      ],
    ),
    MonthSummary(
      currentMonth: 'August',
      nextMonth: 'September',
      earnings: [
        FinancialItem(description: 'Salary', amount: 3500.0),
        FinancialItem(description: 'Freelance', amount: 1000.0),
        // Add more earnings for August as needed
      ],
      expenses: [
        FinancialItem(description: 'Rent', amount: -1100.0),
        FinancialItem(description: 'Utilities', amount: -250.0),
        // Add more expenses for August as needed
      ],
    ),
    // Add more month summaries as needed
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Financial Summary'),
      ),
      body: ListView.builder(
        itemCount: monthSummaries.length,
        itemBuilder: (context, index) {
          MonthSummary summary = monthSummaries[index];
          return _buildMonthItem(summary);
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).pushNamed('start_flow');
        },
        child: Icon(Icons.chat_bubble),
      ),
    );
  }

  Widget _buildMonthItem(MonthSummary summary) {
    return Card(
      child: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  summary.currentMonth,
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                Text(
                  summary.nextMonth,
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            SizedBox(height: 12.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildSummaryList(summary.earnings),
                _buildSummaryList(summary.expenses),
              ],
            ),
            SizedBox(height: 12.0),
            Divider(),
            SizedBox(height: 12.0),
            Text(
              'Total Earnings: \$${summary.totalEarnings.toStringAsFixed(2)}',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8.0),
            Text(
              'Total Expenses: \$${summary.totalExpenses.toStringAsFixed(2)}',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8.0),
            Text(
              'Total Balance: \$${summary.totalBalance.toStringAsFixed(2)}',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSummaryList(List<FinancialItem> items) {
    return Expanded(
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: items.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(items[index].description),
            trailing: Text('\$${items[index].amount.toStringAsFixed(2)}'),
          );
        },
      ),
    );
  }
}
