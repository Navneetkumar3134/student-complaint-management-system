import 'package:flutter/material.dart';

class SubmitComplaintScreen extends StatefulWidget {
  const SubmitComplaintScreen({super.key});

  @override
  State<SubmitComplaintScreen> createState() =>
      _SubmitComplaintScreenState();
}

class _SubmitComplaintScreenState extends State<SubmitComplaintScreen> {
  String selectedCategory = 'Academic';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Submit Complaint'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Register a Complaint',
              style: TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 25),

            TextField(
              decoration: const InputDecoration(
                labelText: 'Complaint Title',
                hintText: 'Enter complaint title',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.title),
              ),
            ),

            const SizedBox(height: 18),

            DropdownButtonFormField<String>(
              initialValue: selectedCategory,
              decoration: const InputDecoration(
                labelText: 'Category',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.category),
              ),
              items: const [
                DropdownMenuItem(
                  value: 'Academic',
                  child: Text('Academic'),
                ),
                DropdownMenuItem(
                  value: 'Hostel',
                  child: Text('Hostel'),
                ),
                DropdownMenuItem(
                  value: 'Transport',
                  child: Text('Transport'),
                ),
                DropdownMenuItem(
                  value: 'Infrastructure',
                  child: Text('Infrastructure'),
                ),
                DropdownMenuItem(
                  value: 'Other',
                  child: Text('Other'),
                ),
              ],
              onChanged: (value) {
                if (value != null) {
                  setState(() {
                    selectedCategory = value;
                  });
                }
              },
            ),

            const SizedBox(height: 18),

            TextField(
              maxLines: 6,
              decoration: const InputDecoration(
                labelText: 'Description',
                hintText: 'Describe your complaint...',
                border: OutlineInputBorder(),
                alignLabelWithHint: true,
              ),
            ),

            const SizedBox(height: 25),

            SizedBox(
              width: double.infinity,
              height: 52,
              child: ElevatedButton.icon(
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Complaint submitted successfully!'),
                    ),
                  );
                },
                icon: const Icon(Icons.send),
                label: const Text(
                  'Submit Complaint',
                  style: TextStyle(fontSize: 17),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}