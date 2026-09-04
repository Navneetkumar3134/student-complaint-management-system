import 'package:flutter/material.dart';
import 'screens/login_screen.dart';

void main() {
  runApp(const StudentComplaintApp());
}

class StudentComplaintApp extends StatelessWidget {
  const StudentComplaintApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Student Complaint Management System',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const LoginScreen(),
    );
  }
}