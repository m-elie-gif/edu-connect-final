import 'package:flutter/material.dart';

class SchoolSearchScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('School Directory')),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Search by district, level, name...',
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(30)),
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: 10,
              itemBuilder: (context, index) => ListTile(
                leading: Icon(Icons.school),
                title: Text('School ${index+1}'),
                subtitle: Text('Kampala • Secondary'),
                onTap: () => Navigator.pushNamed(context, '/school_profile'),
              ),
            ),
          ),
        ],
      ),
    );
  }
}