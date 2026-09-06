import 'package:flutter/material.dart';
import 'submit_complaint_screen.dart';
import 'my_complaints_screen.dart';
import 'login_screen.dart';

class StudentDashboard extends StatelessWidget {
  const StudentDashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Student Dashboard'),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => const LoginScreen(),
                ),
              );
            },
            icon: const Icon(Icons.logout),
            tooltip: 'Logout',
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Welcome, Student!',
              style: TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 8),

            const Text(
              'Manage your complaints easily.',
              style: TextStyle(
                fontSize: 16,
              ),
            ),

            const SizedBox(height: 25),

            Expanded(
              child: GridView.count(
                crossAxisCount: 2,
                crossAxisSpacing: 15,
                mainAxisSpacing: 15,
                children: [
                  _dashboardCard(
                    context,
                    Icons.add_circle,
                    'Submit Complaint',
                    () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              const SubmitComplaintScreen(),
                        ),
                      );
                    },
                  ),

                  _dashboardCard(
                    context,
                    Icons.list_alt,
                    'My Complaints',
                    () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              const MyComplaintsScreen(),
                        ),
                      );
                    },
                  ),

                  _dashboardCard(
                    context,
                    Icons.pending_actions,
                    'Pending',
                    () {},
                  ),

                  _dashboardCard(
                    context,
                    Icons.check_circle,
                    'Resolved',
                    () {},
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _dashboardCard(
    BuildContext context,
    IconData icon,
    String title,
    VoidCallback onTap,
  ) {
    return Card(
      elevation: 3,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(12),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                icon,
                size: 50,
              ),

              const SizedBox(height: 12),

              Text(
                title,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}