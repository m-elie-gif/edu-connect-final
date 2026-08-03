import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class GroupChatsScreen extends StatefulWidget {
  @override
  _GroupChatsScreenState createState() => _GroupChatsScreenState();
}

class _GroupChatsScreenState extends State<GroupChatsScreen> {
  int _selectedGroupIndex = 0;
  final TextEditingController _msgController = TextEditingController();

  final List<Map<String, dynamic>> _groups = [
    {
      'name': 'S.3 Chemistry Class',
      'members': '12 members',
      'messages': [
        {'sender': 'Teacher', 'text': 'Read chapter 5 for tomorrow.', 'time': DateTime.now().subtract(Duration(hours: 2))},
        {'sender': 'You', 'text': 'Noted, sir.', 'time': DateTime.now().subtract(Duration(hours: 1))},
      ],
    },
    {
      'name': 'Parents - Kampala High',
      'members': '45 members',
      'messages': [
        {'sender': 'Admin', 'text': 'School closed on 15th June.', 'time': DateTime.now().subtract(Duration(days: 1))},
        {'sender': 'Parent Peter', 'text': 'Thanks for the update.', 'time': DateTime.now().subtract(Duration(days: 1))},
      ],
    },
    {
      'name': 'Teachers Staff Room',
      'members': '28 members',
      'messages': [
        {'sender': 'Principal', 'text': 'Meeting at 9 AM.', 'time': DateTime.now().subtract(Duration(hours: 4))},
      ],
    },
  ];

  void _sendMessage() {
    final text = _msgController.text.trim();
    if (text.isEmpty) return;
    setState(() {
      _groups[_selectedGroupIndex]['messages'].add({
        'sender': 'You',
        'text': text,
        'time': DateTime.now(),
      });
      _msgController.clear();
    });
    // Simulate a reply
    Future.delayed(Duration(seconds: 2), () {
      setState(() {
        _groups[_selectedGroupIndex]['messages'].add({
          'sender': 'Other',
          'text': 'Thanks! I will check.',
          'time': DateTime.now(),
        });
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final currentGroup = _groups[_selectedGroupIndex];
    return Scaffold(
      appBar: AppBar(
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(currentGroup['name']),
            Text(currentGroup['members'], style: TextStyle(fontSize: 12, fontWeight: FontWeight.normal)),
          ],
        ),
        actions: [
          IconButton(icon: Icon(Icons.people), onPressed: () {}),
        ],
      ),
      body: Column(
        children: [
          // Group selector (horizontal scroll)
          Container(
            height: 50,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: _groups.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 4),
                  child: ChoiceChip(
                    label: Text(_groups[index]['name'].substring(0, 10) + '...'),
                    selected: _selectedGroupIndex == index,
                    onSelected: (selected) {
                      if (selected) setState(() => _selectedGroupIndex = index);
                    },
                  ),
                );
              },
            ),
          ),
          Divider(height: 0),
          // Messages
          Expanded(
            child: ListView.builder(
              reverse: true, // newest at bottom
              itemCount: currentGroup['messages'].length,
              itemBuilder: (context, index) {
                final msg = currentGroup['messages'][currentGroup['messages'].length - 1 - index];
                final isMe = msg['sender'] == 'You';
                return Align(
                  alignment: isMe ? Alignment.centerRight : Alignment.centerLeft,
                  child: Container(
                    margin: EdgeInsets.symmetric(vertical: 4, horizontal: 8),
                    padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                    decoration: BoxDecoration(
                      color: isMe ? Colors.green[300] : Colors.grey[200],
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          msg['sender'],
                          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12, color: isMe ? Colors.white : Colors.grey[700]),
                        ),
                        Text(msg['text'], style: TextStyle(color: isMe ? Colors.white : Colors.black87)),
                        Text(
                          DateFormat('HH:mm').format(msg['time']),
                          style: TextStyle(fontSize: 10, color: isMe ? Colors.white70 : Colors.grey[600]),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
          // Input
          Container(
            padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            decoration: BoxDecoration(color: Colors.white, boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 4)]),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _msgController,
                    decoration: InputDecoration(hintText: 'Type to group...', border: InputBorder.none),
                    onSubmitted: (_) => _sendMessage(),
                  ),
                ),
                IconButton(icon: Icon(Icons.send, color: Colors.green), onPressed: _sendMessage),
              ],
            ),
          ),
        ],
      ),
    );
  }
}