import 'package:flutter/material.dart';

class ChatRoomsScreen extends StatelessWidget {
  final List<Map<String, String>> rooms = [
    {'name': 'Maths Help Room', 'members': '15 online'},
    {'name': 'General Discussion', 'members': '8 online'},
    {'name': 'STEM Club', 'members': '23 online'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Chat Rooms')),
      body: ListView.builder(
        itemCount: rooms.length,
        itemBuilder: (context, i) {
          final r = rooms[i];
          return Card(
            child: ListTile(
              leading: Icon(Icons.group, color: Colors.green),
              title: Text(r['name']!),
              subtitle: Text(r['members']!),
              trailing: Icon(Icons.arrow_forward),
              onTap: () => Navigator.pushNamed(context, '/group_chats'),
            ),
          );
        },
      ),
    );
  }
}