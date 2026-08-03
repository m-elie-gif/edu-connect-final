import 'package:flutter/material.dart';

class ChildDashboardScreen extends StatelessWidget {
  final List<Map<String, String>> children = [
    {'name': 'John Doe', 'class': 'S.3', 'school': 'Kampala High', 'avg': '85%'},
    {'name': 'Mary Doe', 'class': 'P.7', 'school': 'Gulu Primary', 'avg': '78%'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Child Dashboard')),
      body: ListView.builder(
        itemCount: children.length,
        itemBuilder: (context, i) {
          final c = children[i];
          return Card(
            child: ListTile(
              leading: CircleAvatar(child: Text(c['name']![0])),
              title: Text(c['name']!, style: TextStyle(fontWeight: FontWeight.bold)),
              subtitle: Text('${c['class']} • ${c['school']}'),
              trailing: Column(mainAxisAlignment: MainAxisAlignment.center, children: [Text('Avg: ${c['avg']}'), Icon(Icons.trending_up, color: Colors.green)]),
              onTap: () {},
            ),
          );
        },
      ),
    );
  }
}