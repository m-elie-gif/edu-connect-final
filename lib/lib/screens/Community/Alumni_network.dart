import 'package:flutter/material.dart';

class AlumniNetworkScreen extends StatelessWidget {
  final List<Map<String, String>> alumni = [
    {'name': 'John P.', 'year': 'Class of 2015', 'occupation': 'Engineer'},
    {'name': 'Mary N.', 'year': 'Class of 2018', 'occupation': 'Doctor'},
    {'name': 'Peter O.', 'year': 'Class of 2012', 'occupation': 'Teacher'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Alumni Network')),
      body: ListView.builder(
        itemCount: alumni.length,
        itemBuilder: (context, i) {
          final a = alumni[i];
          return Card(
            child: ListTile(
              leading: CircleAvatar(child: Text(a['name']![0])),
              title: Text(a['name']!),
              subtitle: Text('${a['year']} • ${a['occupation']}'),
              trailing: Icon(Icons.arrow_forward),
            ),
          );
        },
      ),
    );
  }
}