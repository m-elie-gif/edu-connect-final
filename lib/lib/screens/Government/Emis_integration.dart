import 'package:flutter/material.dart';

class EmisIntegrationScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('EMIS Integration')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Card(child: ListTile(title: Text('Data Sync'), subtitle: Text('Last synced: Today 10:00 AM'), trailing: Icon(Icons.sync, color: Colors.green))),
            Card(child: ListTile(title: Text('Student Records'), subtitle: Text('1,200 students synced'), trailing: Icon(Icons.check_circle, color: Colors.green))),
            Card(child: ListTile(title: Text('Teacher Records'), subtitle: Text('30 teachers synced'), trailing: Icon(Icons.check_circle, color: Colors.green))),
            ElevatedButton(onPressed: () {}, child: Text('Sync Now'), style: ElevatedButton.styleFrom(minimumSize: Size(double.infinity, 50))),
          ],
        ),
      ),
    );
  }
}