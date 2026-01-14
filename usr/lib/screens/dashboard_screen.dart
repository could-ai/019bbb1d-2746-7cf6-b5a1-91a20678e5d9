import 'package:flutter/material.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dashboard'),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
        elevation: 2,
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications_outlined),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () {
              Navigator.pushReplacementNamed(context, '/login');
            },
          ),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const UserAccountsDrawerHeader(
              accountName: Text('Admin User'),
              accountEmail: Text('admin@school.com'),
              currentAccountPicture: CircleAvatar(
                backgroundColor: Colors.white,
                child: Icon(Icons.person, size: 40, color: Colors.blue),
              ),
              decoration: BoxDecoration(color: Colors.blue),
            ),
            ListTile(
              leading: const Icon(Icons.dashboard),
              title: const Text('Dashboard'),
              onTap: () => Navigator.pop(context),
            ),
            ListTile(
              leading: const Icon(Icons.people),
              title: const Text('Students'),
              onTap: () {
                Navigator.pop(context);
                Navigator.pushNamed(context, '/students');
              },
            ),
            ListTile(
              leading: const Icon(Icons.person_outline),
              title: const Text('Teachers'),
              onTap: () {
                Navigator.pop(context);
                Navigator.pushNamed(context, '/teachers');
              },
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Overview',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            GridView.count(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              crossAxisCount: 2,
              crossAxisSpacing: 16,
              mainAxisSpacing: 16,
              childAspectRatio: 1.1,
              children: [
                _buildDashboardCard(
                  context,
                  'Students',
                  '1,250',
                  Icons.people,
                  Colors.orange,
                  () => Navigator.pushNamed(context, '/students'),
                ),
                _buildDashboardCard(
                  context,
                  'Teachers',
                  '85',
                  Icons.person_outline,
                  Colors.green,
                  () => Navigator.pushNamed(context, '/teachers'),
                ),
                _buildDashboardCard(
                  context,
                  'Classes',
                  '42',
                  Icons.class_,
                  Colors.purple,
                  () {}, // Placeholder
                ),
                _buildDashboardCard(
                  context,
                  'Attendance',
                  '95%',
                  Icons.calendar_today,
                  Colors.red,
                  () {}, // Placeholder
                ),
                _buildDashboardCard(
                  context,
                  'Exams',
                  'Active',
                  Icons.assignment,
                  Colors.teal,
                  () {}, // Placeholder
                ),
                _buildDashboardCard(
                  context,
                  'Finance',
                  '\$12k',
                  Icons.attach_money,
                  Colors.blueGrey,
                  () {}, // Placeholder
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDashboardCard(BuildContext context, String title, String subtitle, IconData icon, Color color, VoidCallback onTap) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(16),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: 24,
                backgroundColor: color.withOpacity(0.1),
                child: Icon(icon, size: 24, color: color),
              ),
              const SizedBox(height: 12),
              Text(
                title,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: Colors.black87,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                subtitle,
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: color,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
