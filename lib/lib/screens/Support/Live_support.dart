import 'package:flutter/material.dart';

class LiveSupportScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Live Support')),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              reverse: true,
              itemCount: 3,
              itemBuilder: (context, i) {
                return Align(
                  alignment: i.isEven ? Alignment.centerLeft : Alignment.centerRight,
                  child: Container(
                    margin: EdgeInsets.all(8),
                    padding: EdgeInsets.all(12),
                    decoration: BoxDecoration(color: i.isEven ? Colors.grey[200] : Colors.green[300], borderRadius: BorderRadius.circular(12)),
                    child: Text(i.isEven ? 'How can I help?' : 'I need help with login.'),
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(child: TextField(decoration: InputDecoration(hintText: 'Type your message...'))),
                IconButton(icon: Icon(Icons.send, color: Colors.green), onPressed: () {}),
              ],
            ),
          ),
        ],
      ),
    );
  }
}