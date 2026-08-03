import 'package:flutter/material.dart';

class AssignmentsScreen extends StatelessWidget {
  final List<Map<String, String>> tasks = [
    {'title': 'Maths Homework', 'subject': 'Maths', 'due': 'Due: 15 June', 'status': 'Pending'},
    {'title': 'Science Project', 'subject': 'Science', 'due': 'Due: 20 June', 'status': 'Submitted'},
    {'title': 'History Essay', 'subject': 'History', 'due': 'Due: 5 July', 'status': 'Pending'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Assignments')),
      body: ListView.builder(
        itemCount: tasks.length,
        itemBuilder: (context, i) {
          final t = tasks[i];
          return Card(
            child: ListTile(
              title: Text(t['title']!),
              subtitle: Text('${t['subject']} • ${t['due']}'),
              trailing: Chip(label: Text(t['status']!), backgroundColor: t['status'] == 'Submitted' ? Colors.green[100] : Colors.orange[100]),
            ),
          );
        },
      ),
    );
  }
}