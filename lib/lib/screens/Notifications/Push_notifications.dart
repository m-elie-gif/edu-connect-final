import 'package:flutter/material.dart';

class PushNotificationsScreen extends StatefulWidget {
  @override
  _PushNotificationsScreenState createState() => _PushNotificationsScreenState();
}

class _PushNotificationsScreenState extends State<PushNotificationsScreen> {
  bool _messages = true;
  bool _grades = true;
  bool _attendance = true;
  bool _announcements = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Push Notifications')),
      body: ListView(
        children: [
          SwitchListTile(title: Text('Messages'), subtitle: Text('New chat messages'), value: _messages, onChanged: (v) => setState(() => _messages = v)),
          SwitchListTile(title: Text('Grades'), subtitle: Text('Grade updates'), value: _grades, onChanged: (v) => setState(() => _grades = v)),
          SwitchListTile(title: Text('Attendance'), subtitle: Text('Attendance alerts'), value: _attendance, onChanged: (v) => setState(() => _attendance = v)),
          SwitchListTile(title: Text('Announcements'), subtitle: Text('School broadcasts'), value: _announcements, onChanged: (v) => setState(() => _announcements = v)),
        ],
      ),
    );
  }
}