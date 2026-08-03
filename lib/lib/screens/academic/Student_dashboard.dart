import 'package:flutter/material.dart';

class StudentDashboardScreen extends StatelessWidget {
  final Map<String, dynamic> _stats = {
    'attendance': 92,
    'averageGrade': 78,
    'assignmentsDone': 8,
    'assignmentsTotal': 12,
    'subjects': ['Maths', 'English', 'Science', 'History', 'Art'],
    'grades': [85, 72, 90, 65, 78],
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Student Dashboard'), actions: [
        IconButton(icon: Icon(Icons.refresh), onPressed: () {}),
      ]),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              // Stats Row
              Row(
                children: [
                  Expanded(child: _statCard('Attendance', '${_stats['attendance']}%', Icons.calendar_today, Colors.blue)),
                  Expanded(child: _statCard('Avg. Grade', '${_stats['averageGrade']}%', Icons.grade, Colors.green)),
                ],
              ),
              SizedBox(height: 12),
              Row(
                children: [
                  Expanded(child: _statCard('Assignments', '${_stats['assignmentsDone']}/${_stats['assignmentsTotal']}', Icons.assignment, Colors.orange)),
                  Expanded(child: _statCard('Subjects', '${_stats['subjects'].length}', Icons.menu_book, Colors.purple)),
                ],
              ),
              SizedBox(height: 16),
              // Subject performance
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Subject Performance', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                      SizedBox(height: 8),
                      ...List.generate(_stats['subjects'].length, (index) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(vertical: 4),
                          child: Row(
                            children: [
                              SizedBox(width: 70, child: Text(_stats['subjects'][index])),
                              Expanded(
                                child: LinearProgressIndicator(
                                  value: _stats['grades'][index] / 100,
                                  backgroundColor: Colors.grey[200],
                                  color: _stats['grades'][index] > 70 ? Colors.green : Colors.orange,
                                ),
                              ),
                              SizedBox(width: 8),
                              Text('${_stats['grades'][index]}%'),
                            ],
                          ),
                        );
                      }),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 12),
              // Quick actions
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  _actionButton(Icons.book, 'Timetable', () => Navigator.pushNamed(context, '/timetable')),
                  _actionButton(Icons.assignment, 'Assignments', () => Navigator.pushNamed(context, '/assignments')),
                  _actionButton(Icons.attach_money, 'Fees', () => Navigator.pushNamed(context, '/fee_management')),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _statCard(String label, String value, IconData icon, Color color) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            Icon(icon, color: color, size: 30),
            SizedBox(height: 4),
            Text(value, style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            Text(label, style: TextStyle(fontSize: 12, color: Colors.grey[600])),
          ],
        ),
      ),
    );
  }

  Widget _actionButton(IconData icon, String label, VoidCallback onTap) {
    return InkWell(
      onTap: onTap,
      child: Column(
        children: [
          CircleAvatar(backgroundColor: Colors.green[100], radius: 30, child: Icon(icon, color: Colors.green)),
          SizedBox(height: 4),
          Text(label, style: TextStyle(fontSize: 12)),
        ],
      ),
    );
  }
}