import 'package:flutter/material.dart';

class PrivacySettingsScreen extends StatefulWidget {
  @override
  _PrivacySettingsScreenState createState() => _PrivacySettingsScreenState();
}

class _PrivacySettingsScreenState extends State<PrivacySettingsScreen> {
  bool _profileVisible = true;
  bool _postsVisible = true;
  bool _onlineStatus = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Privacy Settings')),
      body: ListView(
        children: [
          SwitchListTile(title: Text('Profile Visibility'), subtitle: Text('Show to everyone'), value: _profileVisible, onChanged: (v) => setState(() => _profileVisible = v)),
          SwitchListTile(title: Text('Posts Visibility'), subtitle: Text('Show to connections'), value: _postsVisible, onChanged: (v) => setState(() => _postsVisible = v)),
          SwitchListTile(title: Text('Online Status'), subtitle: Text('Show when active'), value: _onlineStatus, onChanged: (v) => setState(() => _onlineStatus = v)),
        ],
      ),
    );
  }
}