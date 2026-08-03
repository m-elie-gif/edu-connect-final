import 'package:flutter/material.dart';

class CommunityFeedScreen extends StatelessWidget {
  final List<Map<String, String>> posts = [
    {'author': 'Gulu High', 'text': 'Celebrating 10 years of excellence!', 'likes': '24'},
    {'author': 'Teacher David', 'text': 'Free tutoring for P.7 students.', 'likes': '15'},
    {'author': 'Mbarara Science', 'text': 'Open day this Saturday.', 'likes': '31'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Community Feed')),
      body: ListView.builder(
        itemCount: posts.length,
        itemBuilder: (context, i) {
          final p = posts[i];
          return Card(
            child: ListTile(
              title: Text(p['text']!, style: TextStyle(fontWeight: FontWeight.bold)),
              subtitle: Text('@${p['author']}'),
              trailing: Row(mainAxisSize: MainAxisSize.min, children: [Icon(Icons.thumb_up, size: 16), Text(' ${p['likes']}')]),
            ),
          );
        },
      ),
    );
  }
}