import 'package:flutter/material.dart';

class HelpPage extends StatelessWidget {
  const HelpPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Help'),
      ),
      body: const Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'How to Use the App',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 16),
            Text(
              '1. Use the Home page to navigate to different dictionary languages.',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 16),
            Text(
              '2. Select the language you want to translate to from the bottom navigation.',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 16),
            Text(
              '3. You can also access the settings and other pages from the menu.',
              style: TextStyle(fontSize: 18),
            ),
          ],
        ),
      ),
    );
  }
}
