import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class AnnouncementsScreen extends StatelessWidget {
  final List<Map<String, dynamic>> announcements = [
    {'title': 'School closed on 10th June', 'from': 'Admin', 'time': DateTime.now().subtract(Duration(hours: 2))},
    {'title': 'Parent meeting on Friday 5PM', 'from': 'Principal', 'time': DateTime.now().subtract(Duration(days: 1))},
    {'title': 'Sports Day rescheduled', 'from': 'Sports Dept', 'time': DateTime.now().subtract(Duration(days: 2))},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Announcements')),
      body: ListView.builder(
        itemCount: announcements.length,
        itemBuilder: (context, i) {
          final a = announcements[i];
          return Card(
            child: ListTile(
              title: Text(a['title']!, style: TextStyle(fontWeight: FontWeight.bold)),
              subtitle: Text('From: ${a['from']}'),
              trailing: Text(DateFormat('dd MMM HH:mm').format(a['time']), style: TextStyle(fontSize: 10, color: Colors.grey)),
            ),
          );
        },
      ),
    );
  }
}