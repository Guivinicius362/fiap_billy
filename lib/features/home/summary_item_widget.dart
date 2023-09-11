import 'package:flutter/material.dart';

class SummaryItemWidget extends StatelessWidget {
  final String title;
  final double percentageChange;
  final double totalAmount;

  SummaryItemWidget({
    required this.title,
    required this.percentageChange,
    required this.totalAmount,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 8),
        Text(
          'Total: \$${totalAmount.toStringAsFixed(2)}',
          style: TextStyle(fontSize: 14, fontWeight: FontWeight.w700),
        ),
        Text(
          'Variação: ${percentageChange.toStringAsFixed(2)}%',
          style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
        ),
        SizedBox(height: 16),
      ],
    );
  }
}
