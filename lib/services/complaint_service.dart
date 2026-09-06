import '../models/complaint.dart';

class ComplaintService {
  static final List<Complaint> _complaints = [];

  static List<Complaint> get complaints {
    return List.unmodifiable(_complaints);
  }

  static void addComplaint(Complaint complaint) {
    _complaints.add(complaint);
  }
}