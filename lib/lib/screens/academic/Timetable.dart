import 'package:flutter/material.dart';

class TimetableScreen extends StatelessWidget {
  final List<String> periods = ['8:00-8:45', '8:45-9:30', '9:30-10:15', 'Break', '10:30-11:15'];
  final Map<String, List<String>> schedule = {
    'Mon': ['Maths', 'English', 'Science', 'Break', 'Art'],
    'Tue': ['History', 'Maths', 'English', 'Break', 'PE'],
    'Wed': ['Science', 'Art', 'History', 'Break', 'Maths'],
    'Thu': ['English', 'Science', 'PE', 'Break', 'History'],
    'Fri': ['Art', 'Maths', 'English', 'Break', 'Science'],
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Timetable')),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(8),
        child: Table(
          border: TableBorder.all(),
          children: [
            TableRow(children: ['Day / Time', ...periods].map((t) => Padding(padding: EdgeInsets.all(8), child: Text(t, textAlign: TextAlign.center))).toList()),
            ...schedule.entries.map((entry) => TableRow(children: [
              Padding(padding: EdgeInsets.all(8), child: Text(entry.key, textAlign: TextAlign.center, style: TextStyle(fontWeight: FontWeight.bold))),
              ...entry.value.map((s) => Padding(padding: EdgeInsets.all(8), child: Text(s, textAlign: TextAlign.center))),
            ])),
          ],
        ),
      ),
    );
  }
}