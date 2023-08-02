import 'package:billy/features/finance/finance_screen.dart';
import 'package:flutter/material.dart';

class EconomyFlowScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Sample data for the table (replace with your own data)
    final List<FinancialItem> originalExpenses = [
      FinancialItem(description: 'Rent', amount: -1000.0),
      FinancialItem(description: 'Utilities', amount: -300.0),
      FinancialItem(description: 'Delivery', amount: -200.0),
      // Add more original expenses as needed
    ];

    final List<FinancialItem> modifiedExpenses = [
      FinancialItem(description: 'Rent', amount: -1000.0),
      FinancialItem(description: 'Utilities', amount: -300.0),
      // No delivery in the modified expenses
      // Add more modified expenses as needed
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text('Quero economizar'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'Baseado nos seus gastos, poderíamos diminuir a quantidade de delivery.',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 24.0),
            Text(
              'Gastos e Ganhos (Sem Delivery)',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16.0),
            _buildFinancialTable(modifiedExpenses),
            SizedBox(height: 24.0),
            ElevatedButton(
              onPressed: () {
                // Implement the action for "Quero economizar ainda mais"
                // For example, show a confirmation or navigate to a specific screen
              },
              child: Text('Quero economizar ainda mais'),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFinancialTable(List<FinancialItem> items) {
    return Table(
      border: TableBorder.all(),
      children: [
        TableRow(
          children: [
            TableCell(child: Text('Description')),
            TableCell(child: Text('Amount')),
          ],
        ),
        ...items.map(
          (item) => TableRow(
            children: [
              TableCell(child: Text(item.description)),
              TableCell(child: Text('\$${item.amount.toStringAsFixed(2)}')),
            ],
          ),
        ),
      ],
    );
  }
}
