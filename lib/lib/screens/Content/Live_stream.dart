import 'package:flutter/material.dart';

class LiveStreamScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Live Stream'), actions: [Container(width: 40, height: 40, child: Center(child: Text('🔴', style: TextStyle(fontSize: 20))))]),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(height: 200, width: double.infinity, color: Colors.black, child: Center(child: Icon(Icons.live_tv, size: 60, color: Colors.white))),
            SizedBox(height: 16),
            Text('School Assembly - Live', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            Text('Viewers: 127', style: TextStyle(color: Colors.grey)),
          ],
        ),
      ),
    );
  }
}