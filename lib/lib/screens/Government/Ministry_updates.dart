import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class MinistryUpdatesScreen extends StatelessWidget {
  final List<Map<String, dynamic>> updates = [
    {'title': 'New Curriculum Guidelines', 'date': DateTime.now().subtract(Duration(days: 2)), 'ref': 'Circular 2026/07'},
    {'title': 'Teacher Recruitment Portal', 'date': DateTime.now().subtract(Duration(days: 5)), 'ref': 'Circular 2026/05'},
    {'title': 'School Calendar 2027', 'date': DateTime.now().subtract(Duration(days: 10)), 'ref': 'Circular 2026/03'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Ministry Updates')),
      body: ListView.builder(
        itemCount: updates.length,
        itemBuilder: (context, i) {
          final u = updates[i];
          return Card(
            child: ListTile(
              leading: Icon(Icons.announcement, color: Colors.blue),
              title: Text(u['title']!, style: TextStyle(fontWeight: FontWeight.bold)),
              subtitle: Text('${u['ref']} • ${DateFormat('dd MMM').format(u['date'])}'),
              trailing: Icon(Icons.arrow_forward),
            ),
          );
        },
      ),
    );
  }
}