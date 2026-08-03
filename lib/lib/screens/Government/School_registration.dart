import 'package:flutter/material.dart';

class SchoolRegistrationScreen extends StatefulWidget {
  @override
  _SchoolRegistrationScreenState createState() => _SchoolRegistrationScreenState();
}

class _SchoolRegistrationScreenState extends State<SchoolRegistrationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('School Registration')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              TextField(decoration: InputDecoration(labelText: 'School Name')),
              TextField(decoration: InputDecoration(labelText: 'District')),
              DropdownButtonFormField<String>(
                items: ['Primary', 'Secondary', 'Tertiary', 'Vocational'].map((t) => DropdownMenuItem(value: t, child: Text(t))).toList(),
                onChanged: (v) {},
                decoration: InputDecoration(labelText: 'Level'),
              ),
              TextField(decoration: InputDecoration(labelText: 'Contact Email')),
              TextField(decoration: InputDecoration(labelText: 'Phone Number')),
              SizedBox(height: 20),
              ElevatedButton(onPressed: () {}, child: Text('Submit Registration'), style: ElevatedButton.styleFrom(minimumSize: Size(double.infinity, 50))),
            ],
          ),
        ),
      ),
    );
  }
}