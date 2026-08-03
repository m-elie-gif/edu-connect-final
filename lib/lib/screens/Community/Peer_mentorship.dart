import 'package:flutter/material.dart';

class PeerMentorshipScreen extends StatelessWidget {
  final List<Map<String, String>> mentors = [
    {'name': 'Alice K.', 'subject': 'Maths', 'rating': '4.8'},
    {'name': 'James M.', 'subject': 'Science', 'rating': '4.5'},
    {'name': 'Grace T.', 'subject': 'English', 'rating': '4.9'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Peer Mentorship')),
      body: ListView.builder(
        itemCount: mentors.length,
        itemBuilder: (context, i) {
          final m = mentors[i];
          return Card(
            child: ListTile(
              leading: CircleAvatar(child: Text(m['name']![0])),
              title: Text(m['name']!),
              subtitle: Text('${m['subject']} • ⭐ ${m['rating']}'),
              trailing: ElevatedButton(onPressed: () {}, child: Text('Connect')),
            ),
          );
        },
      ),
    );
  }
}