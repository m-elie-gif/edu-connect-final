import 'package:flutter/material.dart';

class DiscussionForumsScreen extends StatelessWidget {
  final List<Map<String, String>> topics = [
    {'title': 'How to solve quadratic equations?', 'replies': '5 replies'},
    {'title': 'Best tips for UNEB exam', 'replies': '12 replies'},
    {'title': 'Science project ideas', 'replies': '3 replies'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Forums'), actions: [IconButton(icon: Icon(Icons.add), onPressed: () {})]),
      body: ListView.builder(
        itemCount: topics.length,
        itemBuilder: (context, i) {
          final t = topics[i];
          return Card(
            child: ListTile(
              title: Text(t['title']!),
              subtitle: Text(t['replies']!),
              leading: Icon(Icons.forum, color: Colors.green),
            ),
          );
        },
      ),
    );
  }
}