import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class AttendanceScreen extends StatefulWidget {
  @override
  _AttendanceScreenState createState() => _AttendanceScreenState();
}

class _AttendanceScreenState extends State<AttendanceScreen> {
  DateTime _currentMonth = DateTime.now();
  final Map<DateTime, bool> _attendance = {};

  @override
  void initState() {
    super.initState();
    _generateDummyAttendance();
  }

  void _generateDummyAttendance() {
    // Mark 80% of days as present
    final now = DateTime.now();
    for (int i = 1; i <= 30; i++) {
      final day = DateTime(now.year, now.month, i);
      if (day.weekday != DateTime.saturday && day.weekday != DateTime.sunday) {
        _attendance[day] = i % 5 != 0; // random but consistent
      }
    }
  }

  int _getDaysInMonth(DateTime date) {
    return DateTime(date.year, date.month + 1, 0).day;
  }

  void _changeMonth(int offset) {
    setState(() {
      _currentMonth = DateTime(_currentMonth.year, _currentMonth.month + offset);
    });
  }

  @override
  Widget build(BuildContext context) {
    final daysInMonth = _getDaysInMonth(_currentMonth);
    final firstDayOfMonth = DateTime(_currentMonth.year, _currentMonth.month, 1);
    final startWeekday = firstDayOfMonth.weekday; // 1=Mon, 7=Sun

    return Scaffold(
      appBar: AppBar(
        title: Text('Attendance Tracker'),
        actions: [
          IconButton(icon: Icon(Icons.summarize), onPressed: () {
            // Show summary dialog
            _showSummaryDialog();
          }),
        ],
      ),
      body: Column(
        children: [
          // Month selector
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(icon: Icon(Icons.arrow_back), onPressed: () => _changeMonth(-1)),
              Text(DateFormat('MMMM yyyy').format(_currentMonth), style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              IconButton(icon: Icon(Icons.arrow_forward), onPressed: () => _changeMonth(1)),
            ],
          ),
          // Weekday headers
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'].map((day) {
                return SizedBox(width: 40, child: Center(child: Text(day, style: TextStyle(fontWeight: FontWeight.bold))));
              }).toList(),
            ),
          ),
          // Calendar grid
          Expanded(
            child: GridView.builder(
              physics: NeverScrollableScrollPhysics(),
              padding: EdgeInsets.all(8),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 7, childAspectRatio: 1),
              itemCount: 42, // 6 rows max
              itemBuilder: (context, index) {
                final dayNumber = index - startWeekday + 2; // because Monday is 1
                if (dayNumber < 1 || dayNumber > daysInMonth) {
                  return Container(); // empty placeholder
                }
                final date = DateTime(_currentMonth.year, _currentMonth.month, dayNumber);
                final isPresent = _attendance[date] ?? false;
                final isWeekend = date.weekday == DateTime.saturday || date.weekday == DateTime.sunday;

                return Container(
                  margin: EdgeInsets.all(2),
                  decoration: BoxDecoration(
                    color: isWeekend
                        ? Colors.grey[200]
                        : isPresent
                            ? Colors.green[100]
                            : Colors.red[100],
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(dayNumber.toString(), style: TextStyle(fontWeight: FontWeight.bold)),
                        if (!isWeekend)
                          Icon(
                            isPresent ? Icons.check_circle : Icons.cancel,
                            size: 16,
                            color: isPresent ? Colors.green : Colors.red,
                          ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
          // Legend
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _legendItem(Colors.green[100]!, 'Present'),
                _legendItem(Colors.red[100]!, 'Absent'),
                _legendItem(Colors.grey[200]!, 'Weekend'),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _legendItem(Color color, String label) {
    return Row(
      children: [
        Container(width: 20, height: 20, decoration: BoxDecoration(color: color, borderRadius: BorderRadius.circular(4))),
        SizedBox(width: 4),
        Text(label),
      ],
    );
  }

  void _showSummaryDialog() {
    final present = _attendance.values.where((v) => v == true).length;
    final total = _attendance.values.length;
    final percentage = total > 0 ? (present / total * 100).toStringAsFixed(1) : '0';
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: Text('Attendance Summary'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text('Present: $present days'),
            Text('Absent: ${total - present} days'),
            Text('Attendance Rate: $percentage%'),
          ],
        ),
        actions: [
          TextButton(onPressed: () => Navigator.pop(context), child: Text('Close')),
        ],
      ),
    );
  }
}