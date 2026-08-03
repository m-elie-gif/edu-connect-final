import 'package:flutter/material.dart';

class CollaborativeUploadsScreen extends StatefulWidget {
  @override
  _CollaborativeUploadsScreenState createState() => _CollaborativeUploadsScreenState();
}

class _CollaborativeUploadsScreenState extends State<CollaborativeUploadsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Collaborative Uploads')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(decoration: InputDecoration(labelText: 'Resource Title')),
            SizedBox(height: 16),
            TextField(decoration: InputDecoration(labelText: 'Description'), maxLines: 3),
            SizedBox(height: 16),
            DropdownButtonFormField<String>(
              items: ['Lesson Plan', 'Video', 'Assessment', 'Notes'].map((t) => DropdownMenuItem(value: t, child: Text(t))).toList(),
              onChanged: (v) {},
              decoration: InputDecoration(labelText: 'Resource Type'),
            ),
            SizedBox(height: 20),
            ElevatedButton(onPressed: () {}, child: Text('Upload Resource'), style: ElevatedButton.styleFrom(minimumSize: Size(double.infinity, 50))),
          ],
        ),
      ),
    );
  }
}