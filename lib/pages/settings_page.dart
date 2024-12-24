import 'package:flutter/material.dart';
import 'package:flutter_application_1/themes/theme_provider.dart';
import 'package:provider/provider.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Settings"),
      ),
      body: Column(children: [
          Center(
            child: ElevatedButton(
              onPressed: () {
                Provider.of<ThemeProvider>(context, listen: false).toggleTheme();
              },
              child:
              const Text("Change Theme",
              style: TextStyle(color: Colors.blue),
              )
            ),
              
          )
          ],
      ),
    );
  }
}