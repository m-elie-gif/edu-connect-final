import 'package:flutter/material.dart';

class UnatuIntegrationScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('UNATU Integration')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Card(child: ListTile(title: Text('Membership Status'), subtitle: Text('Active'), trailing: Icon(Icons.check_circle, color: Colors.green))),
            Card(child: ListTile(title: Text('Latest News'), subtitle: Text('UNATU AGM 2026 called'), trailing: Icon(Icons.arrow_forward))),
            Card(child: ListTile(title: Text('Subscription'), subtitle: Text('Paid until Dec 2026'), trailing: Icon(Icons.payment))),
            ElevatedButton(onPressed: () {}, child: Text('View Union Resources'), style: ElevatedButton.styleFrom(minimumSize: Size(double.infinity, 50))),
          ],
        ),
      ),
    );
  }
}