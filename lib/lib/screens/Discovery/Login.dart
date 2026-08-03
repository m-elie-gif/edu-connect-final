import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  bool _obscure = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Login')),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Welcome Back', style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold)),
              SizedBox(height: 30),
              TextFormField(decoration: InputDecoration(labelText: 'Email', prefixIcon: Icon(Icons.email)), validator: (v) => v!.isEmpty ? 'Enter email' : null),
              SizedBox(height: 16),
              TextFormField(
                obscureText: _obscure,
                decoration: InputDecoration(
                  labelText: 'Password',
                  prefixIcon: Icon(Icons.lock),
                  suffixIcon: IconButton(icon: Icon(_obscure ? Icons.visibility : Icons.visibility_off), onPressed: () => setState(() => _obscure = !_obscure)),
                ),
                validator: (v) => v!.length < 6 ? 'Min 6 chars' : null,
              ),
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [Checkbox(value: false, onChanged: (v) {}), Text('Remember me'), TextButton(onPressed: () {}, child: Text('Forgot?'))]),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () => Navigator.pushReplacementNamed(context, '/'),
                child: Text('Login', style: TextStyle(fontSize: 18)),
                style: ElevatedButton.styleFrom(minimumSize: Size(double.infinity, 50)),
              ),
              TextButton(onPressed: () => Navigator.pushNamed(context, '/signup'), child: Text('Create Account')),
            ],
          ),
        ),
      ),
    );
  }
}