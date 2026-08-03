import 'package:flutter/material.dart';

class ReviewsScreen extends StatelessWidget {
  final List<Map<String, dynamic>> reviews = [
    {'name': 'John P.', 'rating': 5, 'text': 'Excellent environment for learning.'},
    {'name': 'Mary K.', 'rating': 4, 'text': 'Good, but fees are a bit high.'},
    {'name': 'David L.', 'rating': 3, 'text': 'Average facilities.'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Reviews')),
      body: ListView.builder(
        padding: EdgeInsets.all(16),
        itemCount: reviews.length,
        itemBuilder: (context, i) {
          final r = reviews[i];
          return Card(
            child: ListTile(
              leading: CircleAvatar(child: Text(r['name'][0])),
              title: Text(r['name']),
              subtitle: Text(r['text']),
              trailing: Text('⭐' * r['rating']),
            ),
          );
        },
      ),
    );
  }
}