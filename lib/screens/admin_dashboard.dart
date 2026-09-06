import 'package:flutter/material.dart';
import '../services/complaint_service.dart';
import 'all_complaints_screen.dart';
import 'login_screen.dart';

class AdminDashboard extends StatefulWidget {
  const AdminDashboard({super.key});

  @override
  State<AdminDashboard> createState() => _AdminDashboardState();
}

class _AdminDashboardState extends State<AdminDashboard> {

  @override
  Widget build(BuildContext context) {
    final complaints = ComplaintService.complaints;

    final totalComplaints = complaints.length;

    final pendingComplaints = complaints
        .where((complaint) => complaint.status == 'Pending')
        .length;

    final resolvedComplaints = complaints
        .where((complaint) => complaint.status == 'Resolved')
        .length;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Admin Dashboard'),
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
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Welcome, Admin',
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 8),

            const Text(
              'Manage and monitor student complaints.',
              style: TextStyle(
                fontSize: 16,
              ),
            ),

            const SizedBox(height: 30),

            Row(
              children: [
                Expanded(
                  child: _buildStatCard(
                    icon: Icons.inbox,
                    title: 'Total',
                    value: totalComplaints.toString(),
                  ),
                ),

                const SizedBox(width: 12),

                Expanded(
                  child: _buildStatCard(
                    icon: Icons.pending_actions,
                    title: 'Pending',
                    value: pendingComplaints.toString(),
                  ),
                ),

                const SizedBox(width: 12),

                Expanded(
                  child: _buildStatCard(
                    icon: Icons.check_circle,
                    title: 'Resolved',
                    value: resolvedComplaints.toString(),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 30),

           SizedBox(
             width: double.infinity,
             height: 55,
             child: ElevatedButton.icon(
               onPressed: () async {
                 await Navigator.push(
                   context,
                   MaterialPageRoute(
                    builder: (context) =>
                        const AllComplaintsScreen(),
                  ),
                );

                setState(() {});
              },
              icon: const Icon(Icons.list_alt),
              label: const Text(
                'View All Complaints',
                style: TextStyle(fontSize: 17),
               ),
             ),
           ),
          ],
        ),
      ),
    );
  }

  Widget _buildStatCard({
    required IconData icon,
    required String title,
    required String value,
  }) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 20,
          horizontal: 8,
        ),
        child: Column(
          children: [
            Icon(
              icon,
              size: 30,
            ),

            const SizedBox(height: 8),

            Text(
              value,
              style: const TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 4),

            Text(
              title,
              style: const TextStyle(
                fontSize: 13,
              ),
            ),
          ],
        ),
      ),
    );
  }
}