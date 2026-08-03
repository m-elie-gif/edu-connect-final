import 'package:flutter/material.dart';
import 'feed.dart';
import '../directory/school_search.dart';
import '../communication/direct_messaging.dart';
import '../profile/user_profile.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;
  final List<Widget> _pages = [
    FeedScreen(),
    SchoolSearchScreen(),
    DirectMessagingScreen(),
    UserProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('EduConnect Uganda'), actions: [
        IconButton(icon: Icon(Icons.notifications), onPressed: () => Navigator.pushNamed(context, '/notification_inbox')),
      ]),
      drawer: _buildDrawer(),
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: (i) => setState(() => _selectedIndex = i),
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Directory'),
          BottomNavigationBarItem(icon: Icon(Icons.chat), label: 'Messages'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
        ],
      ),
    );
  }

  Widget _buildDrawer() {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(decoration: BoxDecoration(color: Colors.green), child: Column(crossAxisAlignment: CrossAxisAlignment.start, mainAxisAlignment: MainAxisAlignment.end, children: [Text('EduConnect', style: TextStyle(color: Colors.white, fontSize: 24)), Text('Uganda', style: TextStyle(color: Colors.white70))])),
          _section('Discovery', Icons.explore, ['/onboarding', '/login', '/signup', '/school_selection']),
          _section('School Directory', Icons.school, ['/school_search', '/school_profile', '/school_stats', '/virtual_tour', '/reviews', '/scholarships']),
          _section('Communication', Icons.message, ['/direct_messaging', '/group_chats', '/announcements', '/appointments', '/bulk_sms']),
          _section('Academic', Icons.book, ['/student_dashboard', '/report_cards', '/attendance', '/timetable', '/fee_management', '/assignments']),
          _section('Content & Learning', Icons.video_library, ['/video_library', '/post_feed', '/learning_resources', '/live_stream', '/discussion_forums', '/collaborative_uploads']),
          _section('Teacher Tools', Icons.person, ['/teacher_dashboard', '/professional_dev', '/unatu', '/resource_sharing']),
          _section('Parent Portal', Icons.family_restroom, ['/child_dashboard', '/performance_tracking', '/fee_dashboard', '/events_calendar', '/school_comparison']),
          _section('Community', Icons.people, ['/community_feed', '/peer_mentorship', '/alumni_network', '/community_events', '/chat_rooms']),
          _section('Government', Icons.account_balance, ['/emis', '/ministry_updates', '/policy_library', '/school_registration', '/teacher_recruitment']),
          _section('Notifications', Icons.notifications, ['/push_notifications', '/notification_inbox', '/preference_settings']),
          _section('Settings', Icons.settings, ['/user_profile', '/privacy_settings', '/language_preference', '/offline_mode', '/data_usage']),
          _section('Help & Support', Icons.help, ['/help_center', '/live_support', '/report_issue', '/feedback']),
          ListTile(leading: Icon(Icons.logout), title: Text('Logout'), onTap: () => Navigator.pushReplacementNamed(context, '/login')),
        ],
      ),
    );
  }

  Widget _section(String title, IconData icon, List<String> routes) {
    return ExpansionTile(
      leading: Icon(icon),
      title: Text(title),
      children: routes.map((route) {
        String label = route.replaceAll('/', '').replaceAll('_', ' ').toUpperCase();
        return ListTile(title: Text(label), onTap: () => Navigator.pushNamed(context, route));
      }).toList(),
    );
  }
}