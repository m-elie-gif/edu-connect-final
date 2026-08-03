import 'package:flutter/material.dart';

class SchoolStatsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('School Statistics')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            _statCard('Total Students', '1,200', Icons.people, Colors.blue),
            _statCard('Teachers', '30', Icons.person, Colors.green),
            _statCard('Classrooms', '24', Icons.room, Colors.orange),
            _statCard('Pass Rate', '82%', Icons.trending_up, Colors.purple),
          ],
        ),
      ),
    );
  }
  Widget _statCard(String label, String value, IconData icon, Color color) {
    return Card(child: ListTile(leading: Icon(icon, color: color), title: Text(value, style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)), subtitle: Text(label)));
  }
}