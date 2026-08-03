import 'package:flutter/material.dart';

class OnboardingScreen extends StatefulWidget {
  @override
  _OnboardingScreenState createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _controller = PageController();
  int _currentPage = 0;

  final List<Map<String, String>> slides = [
    {'title': 'Welcome to EduConnect', 'desc': 'All Ugandan schools in one place.'},
    {'title': 'Stay Connected', 'desc': 'Chat, share posts and videos.'},
    {'title': 'Track Progress', 'desc': 'Monitor attendance and grades.'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: PageView.builder(
              controller: _controller,
              onPageChanged: (i) => setState(() => _currentPage = i),
              itemCount: slides.length,
              itemBuilder: (context, index) {
                return Container(
                  padding: EdgeInsets.all(40),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.school, size: 100, color: Colors.green),
                      SizedBox(height: 30),
                      Text(slides[index]['title']!, style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold)),
                      SizedBox(height: 16),
                      Text(slides[index]['desc']!, style: TextStyle(fontSize: 18), textAlign: TextAlign.center),
                    ],
                  ),
                );
              },
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(slides.length, (i) => Container(width: 10, height: 10, margin: EdgeInsets.all(4), decoration: BoxDecoration(shape: BoxShape.circle, color: _currentPage == i ? Colors.green : Colors.grey))),
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: ElevatedButton(
              onPressed: () => Navigator.pushReplacementNamed(context, '/login'),
              child: Text(_currentPage == slides.length - 1 ? 'Get Started' : 'Next'),
              style: ElevatedButton.styleFrom(minimumSize: Size(double.infinity, 50)),
            ),
          ),
        ],
      ),
    );
  }
}