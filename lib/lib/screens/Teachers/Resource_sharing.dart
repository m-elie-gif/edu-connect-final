import 'package:flutter/material.dart';

class ResourceSharingScreen extends StatefulWidget {
  @override
  _ResourceSharingScreenState createState() => _ResourceSharingScreenState();
}

class _ResourceSharingScreenState extends State<ResourceSharingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Resource Sharing')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(decoration: InputDecoration(labelText: 'Lesson Title')),
            TextField(decoration: InputDecoration(labelText: 'Subject / Class'), maxLines: 3),
            SizedBox(height: 20),
            ElevatedButton(onPressed: () {}, child: Text('Share with other teachers'), style: ElevatedButton.styleFrom(minimumSize: Size(double.infinity, 50))),
            Divider(),
            Text('Recently shared: Algebra Notes', style: TextStyle(fontWeight: FontWeight.bold)),
          ],
        ),
      ),
    );
  }
}