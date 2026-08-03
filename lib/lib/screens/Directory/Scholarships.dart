import 'package:flutter/material.dart';

class ScholarshipsScreen extends StatelessWidget {
  final List<Map<String, String>> scholarships = [
    {'title': 'STEM Scholarship', 'desc': 'For top science students', 'deadline': 'Deadline: Dec 2026'},
    {'title': 'Girls in Tech Bursary', 'desc': 'For female students in ICT', 'deadline': 'Apply now'},
    {'title': 'Sports Talent Award', 'desc': 'For outstanding athletes', 'deadline': 'Deadline: Aug 2026'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Scholarships')),
      body: ListView.builder(
        padding: EdgeInsets.all(16),
        itemCount: scholarships.length,
        itemBuilder: (context, i) {
          final s = scholarships[i];
          return Card(
            child: ListTile(
              title: Text(s['title']!, style: TextStyle(fontWeight: FontWeight.bold)),
              subtitle: Text(s['desc']!),
              trailing: Text(s['deadline']!, style: TextStyle(fontSize: 12, color: Colors.green)),
              onTap: () {},
            ),
          );
        },
      ),
    );
  }
}