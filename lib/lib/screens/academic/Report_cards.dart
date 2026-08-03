import 'package:flutter/material.dart';

class ReportCardsScreen extends StatelessWidget {
  final List<Map<String, String>> reports = [
    {'term': 'Term 1 2026', 'grade': 'A', 'status': 'Available'},
    {'term': 'Term 2 2025', 'grade': 'B+', 'status': 'Available'},
    {'term': 'Term 1 2025', 'grade': 'A-', 'status': 'Archived'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Report Cards')),
      body: ListView.builder(
        itemCount: reports.length,
        itemBuilder: (context, i) {
          final r = reports[i];
          return ListTile(
            leading: Icon(Icons.picture_as_pdf, color: Colors.red),
            title: Text(r['term']!),
            subtitle: Text('Grade: ${r['grade']} • ${r['status']}'),
            trailing: Icon(Icons.download),
            onTap: () {},
          );
        },
      ),
    );
  }
}