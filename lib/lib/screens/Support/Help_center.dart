import 'package:flutter/material.dart';

class HelpCenterScreen extends StatelessWidget {
  final List<Map<String, String>> faqs = [
    {'q': 'How to reset password?', 'a': 'Go to login and tap "Forgot Password".'},
    {'q': 'How to add a child?', 'a': 'Go to Parent Portal and tap "Add Child".'},
    {'q': 'Is the app free?', 'a': 'Yes, basic features are free.'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Help Center')),
      body: ListView.builder(
        itemCount: faqs.length,
        itemBuilder: (context, i) {
          final f = faqs[i];
          return Card(
            child: ExpansionTile(
              title: Text(f['q']!, style: TextStyle(fontWeight: FontWeight.bold)),
              children: [Padding(padding: const EdgeInsets.all(16.0), child: Text(f['a']!))],
            ),
          );
        },
      ),
    );
  }
}