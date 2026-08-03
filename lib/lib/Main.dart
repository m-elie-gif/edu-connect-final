import 'package:flutter/material.dart';
import 'screens/home/home_screen.dart';
import 'screens/discovery/onboarding.dart';
import 'screens/discovery/login.dart';
import 'screens/discovery/signup.dart';
import 'screens/discovery/school_selection.dart';
import 'screens/directory/school_search.dart';
import 'screens/directory/school_profile.dart';
import 'screens/directory/school_stats.dart';
import 'screens/directory/virtual_tour.dart';
import 'screens/directory/reviews.dart';
import 'screens/directory/scholarships.dart';
import 'screens/communication/direct_messaging.dart';
import 'screens/communication/group_chats.dart';
import 'screens/communication/announcements.dart';
import 'screens/communication/appointments.dart';
import 'screens/communication/bulk_sms.dart';
import 'screens/academic/student_dashboard.dart';
import 'screens/academic/report_cards.dart';
import 'screens/academic/attendance.dart';
import 'screens/academic/timetable.dart';
import 'screens/academic/fee_management.dart';
import 'screens/academic/assignments.dart';
import 'screens/content/video_library.dart';
import 'screens/content/post_feed.dart';
import 'screens/content/learning_resources.dart';
import 'screens/content/live_stream.dart';
import 'screens/content/forums.dart';
import 'screens/content/collaborative_uploads.dart';
import 'screens/teachers/teacher_dashboard.dart';
import 'screens/teachers/professional_dev.dart';
import 'screens/teachers/unatu_integration.dart';
import 'screens/teachers/resource_sharing.dart';
import 'screens/parents/child_dashboard.dart';
import 'screens/parents/performance_tracking.dart';
import 'screens/parents/fee_dashboard.dart';
import 'screens/parents/events_calendar.dart';
import 'screens/parents/school_comparison.dart';
import 'screens/community/community_feed.dart';
import 'screens/community/peer_mentorship.dart';
import 'screens/community/alumni_network.dart';
import 'screens/community/events.dart';
import 'screens/community/chat_rooms.dart';
import 'screens/government/emis_integration.dart';
import 'screens/government/ministry_updates.dart';
import 'screens/government/policy_library.dart';
import 'screens/government/school_registration.dart';
import 'screens/government/teacher_recruitment.dart';
import 'screens/notifications/push_notifications.dart';
import 'screens/notifications/notification_inbox.dart';
import 'screens/notifications/preference_settings.dart';
import 'screens/profile/user_profile.dart';
import 'screens/profile/privacy_settings.dart';
import 'screens/profile/language_preference.dart';
import 'screens/profile/offline_mode.dart';
import 'screens/profile/data_usage.dart';
import 'screens/support/help_center.dart';
import 'screens/support/live_support.dart';
import 'screens/support/report_issue.dart';
import 'screens/support/feedback.dart';

void main() => runApp(EduConnectApp());

class EduConnectApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'EduConnect Uganda',
      theme: ThemeData(primarySwatch: Colors.green, fontFamily: 'Roboto'),
      initialRoute: '/',
      routes: {
        '/': (context) => HomeScreen(),
        '/onboarding': (context) => OnboardingScreen(),
        '/login': (context) => LoginScreen(),
        '/signup': (context) => SignupScreen(),
        '/school_selection': (context) => SchoolSelectionScreen(),
        '/school_search': (context) => SchoolSearchScreen(),
        '/school_profile': (context) => SchoolProfileScreen(),
        '/school_stats': (context) => SchoolStatsScreen(),
        '/virtual_tour': (context) => VirtualTourScreen(),
        '/reviews': (context) => ReviewsScreen(),
        '/scholarships': (context) => ScholarshipsScreen(),
        '/direct_messaging': (context) => DirectMessagingScreen(),
        '/group_chats': (context) => GroupChatsScreen(),
        '/announcements': (context) => AnnouncementsScreen(),
        '/appointments': (context) => AppointmentsScreen(),
        '/bulk_sms': (context) => BulkSMSScreen(),
        '/student_dashboard': (context) => StudentDashboardScreen(),
        '/report_cards': (context) => ReportCardsScreen(),
        '/attendance': (context) => AttendanceScreen(),
        '/timetable': (context) => TimetableScreen(),
        '/fee_management': (context) => FeeManagementScreen(),
        '/assignments': (context) => AssignmentsScreen(),
        '/video_library': (context) => VideoLibraryScreen(),
        '/post_feed': (context) => PostFeedScreen(),
        '/learning_resources': (context) => LearningResourcesScreen(),
        '/live_stream': (context) => LiveStreamScreen(),
        '/discussion_forums': (context) => DiscussionForumsScreen(),
        '/collaborative_uploads': (context) => CollaborativeUploadsScreen(),
        '/teacher_dashboard': (context) => TeacherDashboardScreen(),
        '/professional_dev': (context) => ProfessionalDevScreen(),
        '/unatu': (context) => UnatuIntegrationScreen(),
        '/resource_sharing': (context) => ResourceSharingScreen(),
        '/child_dashboard': (context) => ChildDashboardScreen(),
        '/performance_tracking': (context) => PerformanceTrackingScreen(),
        '/fee_dashboard': (context) => FeeDashboardScreen(),
        '/events_calendar': (context) => EventsCalendarScreen(),
        '/school_comparison': (context) => SchoolComparisonScreen(),
        '/community_feed': (context) => CommunityFeedScreen(),
        '/peer_mentorship': (context) => PeerMentorshipScreen(),
        '/alumni_network': (context) => AlumniNetworkScreen(),
        '/community_events': (context) => CommunityEventsScreen(),
        '/chat_rooms': (context) => ChatRoomsScreen(),
        '/emis': (context) => EmisIntegrationScreen(),
        '/ministry_updates': (context) => MinistryUpdatesScreen(),
        '/policy_library': (context) => PolicyLibraryScreen(),
        '/school_registration': (context) => SchoolRegistrationScreen(),
        '/teacher_recruitment': (context) => TeacherRecruitmentScreen(),
        '/push_notifications': (context) => PushNotificationsScreen(),
        '/notification_inbox': (context) => NotificationInboxScreen(),
        '/preference_settings': (context) => PreferenceSettingsScreen(),
        '/user_profile': (context) => UserProfileScreen(),
        '/privacy_settings': (context) => PrivacySettingsScreen(),
        '/language_preference': (context) => LanguagePreferenceScreen(),
        '/offline_mode': (context) => OfflineModeScreen(),
        '/data_usage': (context) => DataUsageScreen(),
        '/help_center': (context) => HelpCenterScreen(),
        '/live_support': (context) => LiveSupportScreen(),
        '/report_issue': (context) => ReportIssueScreen(),
        '/feedback': (context) => FeedbackScreen(),
      },
    );
  }
}