import 'package:flutter/material.dart';
import '../services/complaint_service.dart';
import 'complaint_details_screen.dart';

class FilteredComplaintsScreen extends StatelessWidget {
  final String status;

  const FilteredComplaintsScreen({
    super.key,
    required this.status,
  });

  @override
  Widget build(BuildContext context) {
    final complaints = ComplaintService.complaints
        .where((complaint) => complaint.status == status)
        .toList();

    return Scaffold(
      appBar: AppBar(
        title: Text('$status Complaints'),
      ),
      body: complaints.isEmpty
          ? Center(
              child: Text(
                'No $status complaints.',
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            )
          : ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: complaints.length,
              itemBuilder: (context, index) {
                final complaint = complaints[index];

                return Card(
                  margin: const EdgeInsets.only(bottom: 15),
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment:
                          CrossAxisAlignment.start,
                      children: [
                        Text(
                          complaint.title,
                          style: const TextStyle(
                            fontSize: 19,
                            fontWeight: FontWeight.bold,
                          ),
                        ),

                        const SizedBox(height: 10),

                        Text(
                          'Category: ${complaint.category}',
                          style: const TextStyle(
                            fontSize: 15,
                          ),
                        ),

                        const SizedBox(height: 6),

                        Text(
                          'Status: ${complaint.status}',
                          style: const TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                          ),
                        ),

                        const SizedBox(height: 12),

                        SizedBox(
                          width: double.infinity,
                          child: ElevatedButton.icon(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      ComplaintDetailsScreen(
                                    complaint: complaint,
                                  ),
                                ),
                              );
                            },
                            icon: const Icon(Icons.visibility),
                            label: const Text('View Details'),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
    );
  }
}