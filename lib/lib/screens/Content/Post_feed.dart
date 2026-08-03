import 'package:flutter/material.dart';

class PostFeedScreen extends StatelessWidget {
  final List<Map<String, dynamic>> posts = [
    {'author': 'Teacher Alice', 'text': 'Exam tips: Focus on past papers!', 'likes': 5, 'comments': 2},
    {'author': 'Kampala High', 'text': 'Sports day tomorrow at 8AM.', 'likes': 12, 'comments': 4},
    {'author': 'Student Grace', 'text': 'Anyone for the study group?', 'likes': 3, 'comments': 1},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Post Feed'), actions: [IconButton(icon: Icon(Icons.add), onPressed: () {})]),
      body: ListView.builder(
        itemCount: posts.length,
        itemBuilder: (context, i) {
          final p = posts[i];
          return Card(
            margin: EdgeInsets.all(8),
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(p['author']!, style: TextStyle(fontWeight: FontWeight.bold)),
                  SizedBox(height: 4),
                  Text(p['text']!),
                  SizedBox(height: 8),
                  Row(children: [Icon(Icons.thumb_up, size: 16), Text(' ${p['likes']}'), SizedBox(width: 16), Icon(Icons.comment, size: 16), Text(' ${p['comments']}')]),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}