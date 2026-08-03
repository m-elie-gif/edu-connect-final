import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class SchoolProfileScreen extends StatefulWidget {
  @override
  _SchoolProfileScreenState createState() => _SchoolProfileScreenState();
}

class _SchoolProfileScreenState extends State<SchoolProfileScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  final List<String> _galleryImages = [
    'https://picsum.photos/seed/sch1/400/300',
    'https://picsum.photos/seed/sch2/400/300',
    'https://picsum.photos/seed/sch3/400/300',
    'https://picsum.photos/seed/sch4/400/300',
  ];

  final List<Map<String, String>> _reviews = [
    {'name': 'John P.', 'rating': '5', 'text': 'Excellent school. Great teachers.'},
    {'name': 'Mary K.', 'rating': '4', 'text': 'Good but fees are a bit high.'},
    {'name': 'David L.', 'rating': '3', 'text': 'Average facilities.'},
  ];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Kampala High School'),
        bottom: TabBar(
          controller: _tabController,
          tabs: [
            Tab(text: 'About'),
            Tab(text: 'Gallery'),
            Tab(text: 'Reviews'),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          _buildAboutTab(),
          _buildGalleryTab(),
          _buildReviewsTab(),
        ],
      ),
    );
  }

  Widget _buildAboutTab() {
    return SingleChildScrollView(
      padding: EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('About the School', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
          SizedBox(height: 8),
          Text(
            'Kampala High School is a leading secondary institution in Uganda, known for its strong STEM program, sports excellence, and community engagement. Founded in 1990, we have produced over 5,000 graduates.',
            style: TextStyle(fontSize: 16, height: 1.5),
          ),
          SizedBox(height: 16),
          _infoRow(Icons.location_on, 'Kampala, Uganda'),
          _infoRow(Icons.phone, '+256 700 123 456'),
          _infoRow(Icons.email, 'info@kampalahigh.ug'),
          _infoRow(Icons.web, 'www.kampalahigh.ug'),
          SizedBox(height: 16),
          Text('Statistics', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _statCard('1,200', 'Students'),
              _statCard('30', 'Teachers'),
              _statCard('82%', 'Pass Rate'),
            ],
          ),
        ],
      ),
    );
  }

  Widget _infoRow(IconData icon, String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(children: [Icon(icon, size: 20, color: Colors.green), SizedBox(width: 8), Text(text)]),
    );
  }

  Widget _statCard(String value, String label) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [Text(value, style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)), Text(label)],
        ),
      ),
    );
  }

  Widget _buildGalleryTab() {
    return GridView.builder(
      padding: EdgeInsets.all(8),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2, crossAxisSpacing: 8, mainAxisSpacing: 8),
      itemCount: _galleryImages.length,
      itemBuilder: (context, index) {
        return ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: Image.network(_galleryImages[index], fit: BoxFit.cover),
        );
      },
    );
  }

  Widget _buildReviewsTab() {
    return ListView.builder(
      padding: EdgeInsets.all(16),
      itemCount: _reviews.length,
      itemBuilder: (context, index) {
        final review = _reviews[index];
        return Card(
          child: ListTile(
            title: Text(review['name']!),
            subtitle: Text(review['text']!),
            leading: Text('⭐' * int.parse(review['rating']!)),
          ),
        );
      },
    );
  }
}