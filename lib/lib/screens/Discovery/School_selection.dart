import 'package:flutter/material.dart';

class SchoolSelectionScreen extends StatelessWidget {
  final List<Map<String, String>> schools = [
    {'name': 'Kampala High', 'level': 'Secondary', 'district': 'Kampala'},
    {'name': 'Gulu Public', 'level': 'Primary', 'district': 'Gulu'},
    {'name': 'Mbarara Science', 'level': 'Tertiary', 'district': 'Mbarara'},
    {'name': 'Jinja College', 'level': 'Secondary', 'district': 'Jinja'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Select Your School')),
      body: GridView.builder(
        padding: EdgeInsets.all(12),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2, childAspectRatio: 1.2, crossAxisSpacing: 8, mainAxisSpacing: 8),
        itemCount: schools.length,
        itemBuilder: (context, index) {
          final s = schools[index];
          return Card(
            child: InkWell(
              onTap: () => Navigator.pushReplacementNamed(context, '/'),
              child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
                Icon(Icons.school, size: 40, color: Colors.green),
                Text(s['name']!, style: TextStyle(fontWeight: FontWeight.bold)),
                Text(s['level']!, style: TextStyle(fontSize: 12, color: Colors.grey[600])),
                Text(s['district']!, style: TextStyle(fontSize: 10, color: Colors.grey[500])),
              ]),
            ),
          );
        },
      ),
    );
  }
}