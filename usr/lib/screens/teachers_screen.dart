import 'package:flutter/material.dart';

class TeachersScreen extends StatelessWidget {
  const TeachersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Dummy data
    final List<Map<String, String>> teachers = [
      {'name': 'Mr. Anderson', 'subject': 'Mathematics', 'experience': '10 years'},
      {'name': 'Mrs. Roberts', 'subject': 'English', 'experience': '8 years'},
      {'name': 'Mr. Clark', 'subject': 'Science', 'experience': '5 years'},
      {'name': 'Ms. Lewis', 'subject': 'History', 'experience': '3 years'},
      {'name': 'Mr. Walker', 'subject': 'Physical Ed', 'experience': '12 years'},
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Teachers'),
        backgroundColor: Colors.green,
        foregroundColor: Colors.white,
        actions: [
          IconButton(icon: const Icon(Icons.search), onPressed: () {}),
        ],
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(8),
        itemCount: teachers.length,
        itemBuilder: (context, index) {
          final teacher = teachers[index];
          return Card(
            elevation: 2,
            margin: const EdgeInsets.symmetric(vertical: 6, horizontal: 4),
            child: ListTile(
              leading: CircleAvatar(
                backgroundColor: Colors.green.shade100,
                child: Text(
                  teacher['name']![0],
                  style: TextStyle(color: Colors.green.shade800, fontWeight: FontWeight.bold),
                ),
              ),
              title: Text(
                teacher['name']!,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Subject: ${teacher['subject']}'),
                  Text('Exp: ${teacher['experience']}', style: const TextStyle(fontSize: 12, color: Colors.grey)),
                ],
              ),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(
                    icon: const Icon(Icons.email_outlined, color: Colors.blue),
                    onPressed: () {},
                  ),
                  IconButton(
                    icon: const Icon(Icons.phone_outlined, color: Colors.green),
                    onPressed: () {},
                  ),
                ],
              ),
              onTap: () {
                // Call or view details
              },
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Add teacher
        },
        backgroundColor: Colors.green,
        child: const Icon(Icons.add),
      ),
    );
  }
}
