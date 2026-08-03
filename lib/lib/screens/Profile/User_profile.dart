import 'package:flutter/material.dart';

class UserProfileScreen extends StatefulWidget {
  @override
  _UserProfileScreenState createState() => _UserProfileScreenState();
}

class _UserProfileScreenState extends State<UserProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('User Profile'), actions: [IconButton(icon: Icon(Icons.edit), onPressed: () {})]),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            CircleAvatar(radius: 60, backgroundColor: Colors.green[100], child: Icon(Icons.person, size: 60, color: Colors.green)),
            SizedBox(height: 16),
            Text('John Doe', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
            Text('john@email.com', style: TextStyle(color: Colors.grey[600])),
            Text('Role: Parent', style: TextStyle(color: Colors.grey[600])),
            SizedBox(height: 30),
            ListTile(leading: Icon(Icons.school), title: Text('Associated Schools'), trailing: Icon(Icons.arrow_forward), onTap: () {}),
            ListTile(leading: Icon(Icons.phone), title: Text('+256 700 123 456'), trailing: Icon(Icons.arrow_forward), onTap: () {}),
          ],
        ),
      ),
    );
  }
}