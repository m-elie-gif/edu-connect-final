import 'package:flutter/material.dart';

class StoriesScreen extends StatelessWidget {
  final List<Map<String, String>> stories = [
    {'name': 'School A', 'image': 'https://picsum.photos/seed/s1/100/100'},
    {'name': 'School B', 'image': 'https://picsum.photos/seed/s2/100/100'},
    {'name': 'Teacher', 'image': 'https://picsum.photos/seed/s3/100/100'},
    {'name': 'Student', 'image': 'https://picsum.photos/seed/s4/100/100'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Stories')),
      body: ListView(
        children: [
          SizedBox(height: 10),
          Container(
            height: 120,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              padding: EdgeInsets.symmetric(horizontal: 8),
              itemCount: stories.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 6),
                  child: Column(
                    children: [
                      CircleAvatar(
                        radius: 40,
                        backgroundImage: NetworkImage(stories[index]['image']!),
                      ),
                      SizedBox(height: 4),
                      Text(stories[index]['name']!, style: TextStyle(fontSize: 12)),
                    ],
                  ),
                );
              },
            ),
          ),
          Divider(),
          ListTile(title: Text('View all stories'), trailing: Icon(Icons.arrow_forward)),
        ],
      ),
    );
  }
}