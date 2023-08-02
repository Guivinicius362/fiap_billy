import 'package:flutter/material.dart';

class StartFlowScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Billy - Your Financial AI'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'Meet Billy - Your Financial AI',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16.0),
            Text(
              'Hi there! I am Billy, your personal financial AI assistant. I can help you manage your money, set financial goals, and make better financial decisions.',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 24.0),
            Text(
              'How can I help you today?',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pushNamed('economy_flow');
              },
              child: Text('Quero economizar'),
            ),
            ElevatedButton(
              onPressed: () {
                // Implement the action for "Quero começar a investir"
                // For example, show a confirmation or navigate to a specific screen
              },
              child: Text('Quero começar a investir'),
            ),
            ElevatedButton(
              onPressed: () {
                // Implement the action for "Quero ter um objetivo"
                // For example, show a confirmation or navigate to a specific screen
              },
              child: Text('Quero ter um objetivo'),
            ),
          ],
        ),
      ),
    );
  }
}
