import 'package:flutter/material.dart';

class AppointmentsScreen extends StatefulWidget {
  @override
  _AppointmentsScreenState createState() => _AppointmentsScreenState();
}

class _AppointmentsScreenState extends State<AppointmentsScreen> {
  DateTime? _selectedDate;
  String? _selectedTeacher;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Appointments')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            DropdownButtonFormField<String>(
              items: ['Teacher Alice', 'Mr. Mugisha', 'Madam Grace'].map((t) => DropdownMenuItem(value: t, child: Text(t))).toList(),
              onChanged: (v) => setState(() => _selectedTeacher = v),
              decoration: InputDecoration(labelText: 'Select Teacher'),
            ),
            SizedBox(height: 16),
            ListTile(
              leading: Icon(Icons.calendar_today),
              title: Text(_selectedDate == null ? 'Pick Date' : DateFormat('dd MMM yyyy').format(_selectedDate!)),
              onTap: () async {
                final date = await showDatePicker(context: context, initialDate: DateTime.now(), firstDate: DateTime.now(), lastDate: DateTime(2027));
                if (date != null) setState(() => _selectedDate = date);
              },
            ),
            SizedBox(height: 30),
            ElevatedButton(onPressed: () {}, child: Text('Book Appointment'), style: ElevatedButton.styleFrom(minimumSize: Size(double.infinity, 50))),
          ],
        ),
      ),
    );
  }
}