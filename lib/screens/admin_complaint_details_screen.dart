import 'package:flutter/material.dart';
import '../models/complaint.dart';

class AdminComplaintDetailsScreen extends StatefulWidget {
  final Complaint complaint;

  const AdminComplaintDetailsScreen({
    super.key,
    required this.complaint,
  });

  @override
  State<AdminComplaintDetailsScreen> createState() =>
      _AdminComplaintDetailsScreenState();
}

class _AdminComplaintDetailsScreenState
    extends State<AdminComplaintDetailsScreen> {
  late String selectedStatus;

  @override
  void initState() {
    super.initState();
    selectedStatus = widget.complaint.status;
  }

  void updateStatus(String? value) {
    if (value == null) {
      return;
    }

    setState(() {
      selectedStatus = value;
      widget.complaint.status = value;
    });

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          'Status updated to $value',
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Manage Complaint'),
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

            _detailCard(
              'Complaint ID',
              widget.complaint.id,
              Icons.tag,
            ),

            const SizedBox(height: 15),

            _detailCard(
              'Title',
              widget.complaint.title,
              Icons.title,
            ),

            const SizedBox(height: 15),

            _detailCard(
              'Category',
              widget.complaint.category,
              Icons.category,
            ),

            const SizedBox(height: 15),

            _detailCard(
              'Description',
              widget.complaint.description,
              Icons.description,
            ),

            const SizedBox(height: 25),

            const Text(
              'Update Complaint Status',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 12),

            DropdownButtonFormField<String>(
              initialValue: selectedStatus,
              decoration: const InputDecoration(
                labelText: 'Status',
                border: OutlineInputBorder(),
                prefixIcon: Icon(
                  Icons.pending_actions,
                ),
              ),
              items: const [
                DropdownMenuItem(
                  value: 'Pending',
                  child: Text('Pending'),
                ),
                DropdownMenuItem(
                  value: 'In Progress',
                  child: Text('In Progress'),
                ),
                DropdownMenuItem(
                  value: 'Resolved',
                  child: Text('Resolved'),
                ),
              ],
              onChanged: updateStatus,
            ),

            const SizedBox(height: 25),

            _detailCard(
              'Current Status',
              selectedStatus,
              Icons.check_circle,
            ),
          ],
        ),
      ),
    );
  }

  Widget _detailCard(
    String title,
    String value,
    IconData icon,
  ) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(
              icon,
              size: 28,
            ),

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
}