import 'package:flutter/material.dart';

class TrendingScreen extends StatelessWidget {
  final List<Map<String, dynamic>> posts = [
    {'title': 'UNEB Releases 2026 Results', 'likes': 234, 'comments': 56},
    {'title': 'STEM Expo 2026 in Kampala', 'likes': 189, 'comments': 32},
    {'title': 'School Sports League Finals', 'likes': 145, 'comments': 28},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Trending Now')),
      body: ListView.builder(
        padding: EdgeInsets.all(12),
        itemCount: posts.length,
        itemBuilder: (context, index) {
          final post = posts[index];
          return Card(
            child: ListTile(
              title: Text(post['title']!, style: TextStyle(fontWeight: FontWeight.bold)),
              subtitle: Row(
                children: [
                  Icon(Icons.thumb_up, size: 16, color: Colors.blue),
                  Text(' ${post['likes']}'),
                  SizedBox(width: 16),
                  Icon(Icons.comment, size: 16, color: Colors.grey),
                  Text(' ${post['comments']}'),
                ],
              ),
              trailing: Icon(Icons.trending_up, color: Colors.orange),
              onTap: () {},
            ),
          );
        },
      ),
    );
  }
}