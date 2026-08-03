import 'package:flutter/material.dart';

class PolicyLibraryScreen extends StatelessWidget {
  final List<Map<String, String>> policies = [
    {'title': 'National Curriculum Framework', 'date': '2026'},
    {'title': 'Education Act 2025', 'date': '2025'},
    {'title': 'Teachers Service Commission Rules', 'date': '2024'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Policy Library')),
      body: ListView.builder(
        itemCount: policies.length,
        itemBuilder: (context, i) {
          final p = policies[i];
          return ListTile(
            leading: Icon(Icons.policy, color: Colors.green),
            title: Text(p['title']!),
            subtitle: Text(p['date']!),
            trailing: Icon(Icons.download),
            onTap: () {},
          );
        },
      ),
    );
  }
}