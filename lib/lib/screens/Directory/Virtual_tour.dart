import 'package:flutter/material.dart';

class VirtualTourScreen extends StatelessWidget {
  final List<String> images = [
    'https://picsum.photos/seed/v1/400/300',
    'https://picsum.photos/seed/v2/400/300',
    'https://picsum.photos/seed/v3/400/300',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Virtual Tour')),
      body: Column(
        children: [
          Container(height: 250, child: PageView.builder(itemCount: images.length, itemBuilder: (context, i) => Image.network(images[i], fit: BoxFit.cover))),
          SizedBox(height: 16),
          Text('Swipe to view campus facilities', style: TextStyle(fontSize: 16)),
        ],
      ),
    );
  }
}