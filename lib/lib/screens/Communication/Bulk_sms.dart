import 'package:flutter/material.dart';

class BulkSMSScreen extends StatefulWidget {
  @override
  _BulkSMSScreenState createState() => _BulkSMSScreenState();
}

class _BulkSMSScreenState extends State<BulkSMSScreen> {
  final TextEditingController _messageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Bulk SMS')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(decoration: InputDecoration(labelText: 'Recipients (parents/teachers)', hintText: 'e.g. All Parents')),
            SizedBox(height: 16),
            TextField(controller: _messageController, maxLines: 5, decoration: InputDecoration(labelText: 'Message', border: OutlineInputBorder())),
            SizedBox(height: 8),
            Align(alignment: Alignment.bottomRight, child: Text('${_messageController.text.length}/160', style: TextStyle(fontSize: 12))),
            SizedBox(height: 20),
            ElevatedButton(onPressed: () {}, child: Text('Send Now'), style: ElevatedButton.styleFrom(minimumSize: Size(double.infinity, 50))),
          ],
        ),
      ),
    );
  }
}