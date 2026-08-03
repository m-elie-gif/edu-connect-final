import 'package:flutter/material.dart';

class PerformanceTrackingScreen extends StatelessWidget {
  final List<Map<String, dynamic>> subjects = [
    {'name': 'Maths', 'score': 85},
    {'name': 'English', 'score': 72},
    {'name': 'Science', 'score': 90},
    {'name': 'History', 'score': 65},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Performance Tracking')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: subjects.map((s) {
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(s['name'], style: TextStyle(fontWeight: FontWeight.bold)),
                  Row(children: [
                    Expanded(child: LinearProgressIndicator(value: s['score'] / 100, backgroundColor: Colors.grey[200], color: s['score'] > 70 ? Colors.green : Colors.orange)),
                    SizedBox(width: 8),
                    Text('${s['score']}%'),
                  ]),
                ],
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}