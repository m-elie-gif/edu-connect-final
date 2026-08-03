import 'package:flutter/material.dart';

class SchoolComparisonScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('School Comparison')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Table(
          border: TableBorder.all(),
          children: [
            TableRow(children: [Padding(padding: EdgeInsets.all(8), child: Text('Criteria')), Padding(padding: EdgeInsets.all(8), child: Text('School A')), Padding(padding: EdgeInsets.all(8), child: Text('School B'))]),
            TableRow(children: [Padding(padding: EdgeInsets.all(8), child: Text('Fees')), Padding(padding: EdgeInsets.all(8), child: Text('UGX 3M')), Padding(padding: EdgeInsets.all(8), child: Text('UGX 2.5M'))]),
            TableRow(children: [Padding(padding: EdgeInsets.all(8), child: Text('Pass Rate')), Padding(padding: EdgeInsets.all(8), child: Text('82%')), Padding(padding: EdgeInsets.all(8), child: Text('78%'))]),
            TableRow(children: [Padding(padding: EdgeInsets.all(8), child: Text('Location')), Padding(padding: EdgeInsets.all(8), child: Text('Kampala')), Padding(padding: EdgeInsets.all(8), child: Text('Gulu'))]),
          ],
        ),
      ),
    );
  }
}