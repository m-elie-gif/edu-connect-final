import 'package:flutter/material.dart';

class DataUsageScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Data Usage')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Card(child: ListTile(title: Text('Total Used'), subtitle: Text('1.2 GB this month'), trailing: Text('75%', style: TextStyle(color: Colors.green)))),
            Card(child: ListTile(title: Text('Videos'), subtitle: Text('800 MB'), trailing: Text('66%'))),
            Card(child: ListTile(title: Text('Images'), subtitle: Text('300 MB'), trailing: Text('25%'))),
            Card(child: ListTile(title: Text('Messages'), subtitle: Text('100 MB'), trailing: Text('9%'))),
          ],
        ),
      ),
    );
  }
}