class Complaint {
  final String id;
  final String title;
  final String category;
  final String description;
  String status;
  final DateTime createdAt;

  Complaint({
    required this.id,
    required this.title,
    required this.category,
    required this.description,
    required this.status,
    required this.createdAt,
  });
}