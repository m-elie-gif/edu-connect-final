import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class EventsCalendarScreen extends StatelessWidget {
  final List<Map<String, dynamic>> events = [
    {'title': 'Parent-Teacher Meeting', 'date': DateTime.now().add(Duration(days: 5)), 'time': '5:00 PM'},
    {'title': 'Sports Day', 'date': DateTime.now().add(Duration(days: 12)), 'time': '8:00 AM'},
    {'title': 'End of Term Break', 'date': DateTime.now().add(Duration(days: 20)), 'time': 'All Day'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Events Calendar')),
      body: ListView.builder(
        itemCount: events.length,
        itemBuilder: (context, i) {
          final e = events[i];
          return Card(
            child: ListTile(
              leading: Icon(Icons.event, color: Colors.green),
              title: Text(e['title']!),
              subtitle: Text('${DateFormat('dd MMM').format(e['date'])} • ${e['time']}'),
              trailing: Icon(Icons.arrow_forward),
            ),
          );
        },
      ),
    );
  }
}