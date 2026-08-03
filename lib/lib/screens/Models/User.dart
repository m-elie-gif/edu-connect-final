class User {
  final String uid, name, email, role; // role: parent, student, teacher, admin
  final List<String> schoolIds;
  User({required this.uid, required this.name, required this.email, required this.role, required this.schoolIds});
}