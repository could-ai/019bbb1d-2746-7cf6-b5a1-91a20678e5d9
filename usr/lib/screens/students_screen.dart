import 'package:flutter/material.dart';

class StudentsScreen extends StatelessWidget {
  const StudentsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Dummy data
    final List<Map<String, String>> students = [
      {'name': 'John Doe', 'grade': '10th', 'roll': '101', 'status': 'Present'},
      {'name': 'Jane Smith', 'grade': '10th', 'roll': '102', 'status': 'Absent'},
      {'name': 'Mike Johnson', 'grade': '9th', 'roll': '201', 'status': 'Present'},
      {'name': 'Emily Davis', 'grade': '9th', 'roll': '202', 'status': 'Present'},
      {'name': 'Chris Brown', 'grade': '8th', 'roll': '301', 'status': 'Late'},
      {'name': 'Sarah Wilson', 'grade': '8th', 'roll': '302', 'status': 'Present'},
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Students'),
        backgroundColor: Colors.orange,
        foregroundColor: Colors.white,
        actions: [
          IconButton(icon: const Icon(Icons.search), onPressed: () {}),
          IconButton(icon: const Icon(Icons.filter_list), onPressed: () {}),
        ],
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(8),
        itemCount: students.length,
        itemBuilder: (context, index) {
          final student = students[index];
          Color statusColor;
          switch (student['status']) {
            case 'Present':
              statusColor = Colors.green;
              break;
            case 'Absent':
              statusColor = Colors.red;
              break;
            case 'Late':
              statusColor = Colors.orange;
              break;
            default:
              statusColor = Colors.grey;
          }

          return Card(
            elevation: 2,
            margin: const EdgeInsets.symmetric(vertical: 6, horizontal: 4),
            child: ListTile(
              leading: CircleAvatar(
                backgroundColor: Colors.orange.shade100,
                child: Text(
                  student['name']![0],
                  style: TextStyle(color: Colors.orange.shade800, fontWeight: FontWeight.bold),
                ),
              ),
              title: Text(
                student['name']!,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: Text('Grade: ${student['grade']} | Roll No: ${student['roll']}'),
              trailing: Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color: statusColor.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: statusColor.withOpacity(0.5)),
                ),
                child: Text(
                  student['status']!,
                  style: TextStyle(color: statusColor, fontSize: 12, fontWeight: FontWeight.bold),
                ),
              ),
              onTap: () {
                // Navigate to details
              },
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Add student
        },
        backgroundColor: Colors.orange,
        child: const Icon(Icons.add),
      ),
    );
  }
}
