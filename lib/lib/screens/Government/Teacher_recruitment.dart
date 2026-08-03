import 'package:flutter/material.dart';

class TeacherRecruitmentScreen extends StatelessWidget {
  final List<Map<String, String>> jobs = [
    {'title': 'Maths Teacher', 'school': 'Kampala High', 'deadline': '30 June'},
    {'title': 'Science Teacher', 'school': 'Gulu Public', 'deadline': '15 July'},
    {'title': 'ICT Instructor', 'school': 'Mbarara Science', 'deadline': '5 Aug'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Teacher Recruitment')),
      body: ListView.builder(
        itemCount: jobs.length,
        itemBuilder: (context, i) {
          final j = jobs[i];
          return Card(
            child: ListTile(
              leading: Icon(Icons.work, color: Colors.green),
              title: Text(j['title']!, style: TextStyle(fontWeight: FontWeight.bold)),
              subtitle: Text('${j['school']} • Deadline: ${j['deadline']}'),
              trailing: ElevatedButton(onPressed: () {}, child: Text('Apply')),
            ),
          );
        },
      ),
    );
  }
}