class Post {
  final String id, authorId, content, schoolId;
  final List<String> mediaUrls;
  final DateTime timestamp;
  Post({required this.id, required this.authorId, required this.content, required this.schoolId, required this.mediaUrls, required this.timestamp});
}