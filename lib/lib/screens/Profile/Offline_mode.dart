import 'package:flutter/material.dart';

class OfflineModeScreen extends StatefulWidget {
  @override
  _OfflineModeScreenState createState() => _OfflineModeScreenState();
}

class _OfflineModeScreenState extends State<OfflineModeScreen> {
  bool _offlineMode = false;
  final List<Map<String, String>> downloads = [
    {'name': 'Maths Lesson 1', 'size': '12 MB'},
    {'name': 'UNEB Past Papers', 'size': '8 MB'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Offline Mode')),
      body: Column(
        children: [
          SwitchListTile(title: Text('Enable Offline Mode'), subtitle: Text('Use downloaded content'), value: _offlineMode, onChanged: (v) => setState(() => _offlineMode = v)),
          Divider(),
          Expanded(
            child: ListView.builder(
              itemCount: downloads.length,
              itemBuilder: (context, i) {
                final d = downloads[i];
                return ListTile(title: Text(d['name']!), subtitle: Text(d['size']!), trailing: Icon(Icons.download_done, color: Colors.green));
              },
            ),
          ),
        ],
      ),
    );
  }
}