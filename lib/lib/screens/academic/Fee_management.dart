import 'package:flutter/material.dart';

class FeeManagementScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Fee Management')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Card(child: ListTile(title: Text('Balance'), trailing: Text('UGX 2,500,000'))),
            Card(child: ListTile(title: Text('Last Payment'), trailing: Text('UGX 1,000,000 • 5 Jan'))),
            ElevatedButton(onPressed: () {}, child: Text('Pay Now')),
          ],
        ),
      ),
    );
  }
}