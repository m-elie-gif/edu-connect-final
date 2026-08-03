import 'package:flutter/material.dart';

class LanguagePreferenceScreen extends StatefulWidget {
  @override
  _LanguagePreferenceScreenState createState() => _LanguagePreferenceScreenState();
}

class _LanguagePreferenceScreenState extends State<LanguagePreferenceScreen> {
  String _selected = 'English';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Language Preference')),
      body: ListView(
        children: ['English', 'Luganda', 'Swahili', 'Runyankore'].map((lang) {
          return RadioListTile(
            title: Text(lang),
            value: lang,
            groupValue: _selected,
            onChanged: (v) => setState(() => _selected = v as String),
          );
        }).toList(),
      ),
    );
  }
}