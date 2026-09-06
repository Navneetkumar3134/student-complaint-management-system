import 'package:flutter/material.dart';
import '../models/complaint.dart';

class ComplaintDetailsScreen extends StatelessWidget {
  final Complaint complaint;

  const ComplaintDetailsScreen({
    super.key,
    required this.complaint,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Complaint Details'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Complaint Information',
              style: TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 25),

            _buildDetailCard(
              title: 'Complaint ID',
              value: complaint.id,
              icon: Icons.tag,
            ),

            const SizedBox(height: 15),

            _buildDetailCard(
              title: 'Title',
              value: complaint.title,
              icon: Icons.title,
            ),

            const SizedBox(height: 15),

            _buildDetailCard(
              title: 'Category',
              value: complaint.category,
              icon: Icons.category,
            ),

            const SizedBox(height: 15),

            _buildDetailCard(
              title: 'Description',
              value: complaint.description,
              icon: Icons.description,
            ),

            const SizedBox(height: 15),

            _buildDetailCard(
              title: 'Status',
              value: complaint.status,
              icon: Icons.pending_actions,
            ),

            const SizedBox(height: 15),

            _buildDetailCard(
              title: 'Submitted On',
              value: _formatDate(complaint.createdAt),
              icon: Icons.calendar_today,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDetailCard({
    required String title,
    required String value,
    required IconData icon,
  }) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(icon, size: 28),

            const SizedBox(width: 15),

            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 6),

                  Text(
                    value,
                    style: const TextStyle(
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  String _formatDate(DateTime date) {
    return '${date.day}/${date.month}/${date.year} '
        '${date.hour}:${date.minute.toString().padLeft(2, '0')}';
  }
}