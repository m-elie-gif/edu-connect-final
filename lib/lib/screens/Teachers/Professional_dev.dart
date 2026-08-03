import 'package:flutter/material.dart';

class ProfessionalDevScreen extends StatelessWidget {
  final List<Map<String, String>> trainings = [
    {'title': 'ICT Skills Workshop', 'duration': '2 hours', 'status': 'Start Now'},
    {'title': 'Pedagogy Training', 'duration': '1.5 hours', 'status': 'Upcoming'},
    {'title': 'Classroom Management', 'duration': '1 hour', 'status': 'Completed'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Professional Development')),
      body: ListView.builder(
        itemCount: trainings.length,
        itemBuilder: (context, i) {
          final t = trainings[i];
          return Card(
            child: ListTile(
              leading: Icon(Icons.play_circle_filled, color: Colors.green),
              title: Text(t['title']!),
              subtitle: Text(t['duration']!),
              trailing: Chip(label: Text(t['status']!), backgroundColor: Colors.grey[200]),
              onTap: () {},
            ),
          );
        },
      ),
    );
  }
}