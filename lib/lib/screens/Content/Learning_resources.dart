import 'package:flutter/material.dart';

class LearningResourcesScreen extends StatelessWidget {
  final List<Map<String, String>> resources = [
    {'name': 'UNEB Past Papers 2025', 'type': 'PDF'},
    {'name': 'Primary Syllabus', 'type': 'PDF'},
    {'name': 'Secondary Math Notes', 'type': 'DOC'},
    {'name': 'Science Video Playlist', 'type': 'Video'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Learning Resources')),
      body: ListView.builder(
        itemCount: resources.length,
        itemBuilder: (context, i) {
          final r = resources[i];
          return ListTile(
            leading: Icon(Icons.insert_drive_file, color: Colors.blue),
            title: Text(r['name']!),
            subtitle: Text(r['type']!),
            trailing: Icon(Icons.download),
            onTap: () {},
          );
        },
      ),
    );
  }
}