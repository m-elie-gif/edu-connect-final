import 'package:flutter/material.dart';

class CommunityEventsScreen extends StatelessWidget {
  final List<Map<String, String>> events = [
    {'title': 'National Spelling Bee', 'location': 'Kampala', 'date': '15 Aug'},
    {'title': 'STEM Expo', 'location': 'Mbarara', 'date': '22 Sept'},
    {'title': 'Teachers Conference', 'location': 'Jinja', 'date': '10 Oct'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Community Events')),
      body: ListView.builder(
        itemCount: events.length,
        itemBuilder: (context, i) {
          final e = events[i];
          return Card(
            child: ListTile(
              leading: Icon(Icons.event, color: Colors.green),
              title: Text(e['title']!, style: TextStyle(fontWeight: FontWeight.bold)),
              subtitle: Text('${e['location']} • ${e['date']}'),
            ),
          );
        },
      ),
    );
  }
}