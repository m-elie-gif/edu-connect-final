import 'package:flutter/material.dart';

class PreferenceSettingsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Notification Preferences')),
      body: ListView(
        children: [
          ListTile(title: Text('Email Notifications'), trailing: Switch(value: true, onChanged: (v) {})),
          ListTile(title: Text('SMS Alerts'), trailing: Switch(value: false, onChanged: (v) {})),
          ListTile(title: Text('Sound'), trailing: Switch(value: true, onChanged: (v) {})),
          ListTile(title: Text('Vibration'), trailing: Switch(value: true, onChanged: (v) {})),
        ],
      ),
    );
  }
}