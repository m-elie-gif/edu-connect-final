import 'package:flutter/material.dart';

class SignupScreen extends StatefulWidget {
  @override
  _SignupScreenState createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  String? _selectedRole;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Sign Up')),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Text('Create Account', style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold)),
              SizedBox(height: 20),
              TextFormField(decoration: InputDecoration(labelText: 'Full Name', prefixIcon: Icon(Icons.person))),
              SizedBox(height: 16),
              TextFormField(decoration: InputDecoration(labelText: 'Email', prefixIcon: Icon(Icons.email))),
              SizedBox(height: 16),
              TextFormField(decoration: InputDecoration(labelText: 'Password', prefixIcon: Icon(Icons.lock)), obscureText: true),
              SizedBox(height: 16),
              DropdownButtonFormField<String>(
                value: _selectedRole,
                items: ['Parent', 'Student', 'Teacher', 'Administrator'].map((role) => DropdownMenuItem(value: role, child: Text(role))).toList(),
                onChanged: (v) => setState(() => _selectedRole = v),
                decoration: InputDecoration(labelText: 'I am a...', prefixIcon: Icon(Icons.person_outline)),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () => Navigator.pushReplacementNamed(context, '/'),
                child: Text('Sign Up', style: TextStyle(fontSize: 18)),
                style: ElevatedButton.styleFrom(minimumSize: Size(double.infinity, 50)),
              ),
              TextButton(onPressed: () => Navigator.pushNamed(context, '/login'), child: Text('Already have an account? Login')),
            ],
          ),
        ),
      ),
    );
  }
}