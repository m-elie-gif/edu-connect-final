import 'package:flutter/material.dart';

class TeacherDashboardScreen extends StatelessWidget {
  final List<Map<String, dynamic>> tools = [
    {'icon': Icons.class_, 'label': 'My Classes', 'route': '/timetable'},
    {'icon': Icons.assignment, 'label': 'Assignments', 'route': '/assignments'},
    {'icon': Icons.people, 'label': 'Attendance', 'route': '/attendance'},
    {'icon': Icons.message, 'label': 'Messages', 'route': '/direct_messaging'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Teacher Dashboard')),
      body: GridView.builder(
        padding: EdgeInsets.all(16),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2, crossAxisSpacing: 16, mainAxisSpacing: 16),
        itemCount: tools.length,
        itemBuilder: (context, i) {
          final t = tools[i];
          return Card(
            child: InkWell(
              onTap: () => Navigator.pushNamed(context, t['route']),
              child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
                Icon(t['icon'], size: 40, color: Colors.green),
                SizedBox(height: 8),
                Text(t['label']!, style: TextStyle(fontSize: 16)),
              ]),
            ),
          );
        },
      ),
    );
  }
}