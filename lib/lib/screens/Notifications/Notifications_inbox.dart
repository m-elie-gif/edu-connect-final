import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class NotificationInboxScreen extends StatelessWidget {
  final List<Map<String, dynamic>> notifications = [
    {'title': 'New message from Teacher Alice', 'time': DateTime.now().subtract(Duration(minutes: 5)), 'read': false},
    {'title': 'Attendance alert: John present', 'time': DateTime.now().subtract(Duration(hours: 1)), 'read': false},
    {'title': 'Grade update: Maths - 85%', 'time': DateTime.now().subtract(Duration(days: 1)), 'read': true},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Notification Inbox'), actions: [IconButton(icon: Icon(Icons.done_all), onPressed: () {})]),
      body: ListView.builder(
        itemCount: notifications.length,
        itemBuilder: (context, i) {
          final n = notifications[i];
          return ListTile(
            leading: n['read'] ? Icon(Icons.notifications_none) : Icon(Icons.notifications_active, color: Colors.blue),
            title: Text(n['title']!, style: TextStyle(fontWeight: n['read'] ? FontWeight.normal : FontWeight.bold)),
            subtitle: Text(DateFormat('dd MMM HH:mm').format(n['time'])),
            trailing: n['read'] ? null : Container(width: 10, height: 10, decoration: BoxDecoration(shape: BoxShape.circle, color: Colors.blue)),
            onTap: () {},
          );
        },
      ),
    );
  }
}