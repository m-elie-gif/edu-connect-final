import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class FeeDashboardScreen extends StatefulWidget {
  @override
  _FeeDashboardScreenState createState() => _FeeDashboardScreenState();
}

class _FeeDashboardScreenState extends State<FeeDashboardScreen> {
  final List<Map<String, dynamic>> _transactions = [
    {'date': DateTime.now().subtract(Duration(days: 5)), 'desc': 'Term 2 Fees', 'amount': 1500000, 'status': 'Paid'},
    {'date': DateTime.now().subtract(Duration(days: 12)), 'desc': 'Sports Uniform', 'amount': 150000, 'status': 'Paid'},
    {'date': DateTime.now().subtract(Duration(days: 20)), 'desc': 'Science Lab', 'amount': 200000, 'status': 'Pending'},
    {'date': DateTime.now().subtract(Duration(days: 30)), 'desc': 'Tuition Balance', 'amount': 500000, 'status': 'Overdue'},
  ];

  double get _totalDue => _transactions.fold(0, (sum, item) => sum + (item['status'] != 'Paid' ? item['amount'] : 0));
  double get _totalPaid => _transactions.fold(0, (sum, item) => sum + (item['status'] == 'Paid' ? item['amount'] : 0));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Fee Dashboard')),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            // Summary cards
            Row(
              children: [
                Expanded(child: _summaryCard('Total Due', 'UGX ${NumberFormat('#,###').format(_totalDue)}', Colors.red)),
                Expanded(child: _summaryCard('Total Paid', 'UGX ${NumberFormat('#,###').format(_totalPaid)}', Colors.green)),
              ],
            ),
            SizedBox(height: 16),
            // Quick pay button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton.icon(
                icon: Icon(Icons.payment),
                label: Text('Pay Now'),
                style: ElevatedButton.styleFrom(padding: EdgeInsets.symmetric(vertical: 16)),
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Payment gateway coming soon!')));
                },
              ),
            ),
            SizedBox(height: 16),
            // Transaction history
            Text('Transaction History', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            SizedBox(height: 8),
            ..._transactions.map((tx) {
              return Card(
                child: ListTile(
                  leading: Icon(
                    tx['status'] == 'Paid' ? Icons.check_circle : Icons.warning,
                    color: tx['status'] == 'Paid' ? Colors.green : Colors.orange,
                  ),
                  title: Text(tx['desc']),
                  subtitle: Text(DateFormat('dd MMM yyyy').format(tx['date'])),
                  trailing: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text('UGX ${NumberFormat('#,###').format(tx['amount'])}'),
                      Text(tx['status'], style: TextStyle(color: tx['status'] == 'Paid' ? Colors.green : Colors.red)),
                    ],
                  ),
                ),
              );
            }).toList(),
          ],
        ),
      ),
    );
  }

  Widget _summaryCard(String label, String value, Color color) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Text(label, style: TextStyle(fontSize: 14, color: Colors.grey[600])),
            Text(value, style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: color)),
          ],
        ),
      ),
    );
  }
}