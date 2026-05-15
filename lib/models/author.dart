// lib/models/author.dart
class Author {
  final int id;
  final String fullName;
  final DateTime birthDate;
  final String picture;

  Author({
    required this.id,
    required this.fullName,
    required this.birthDate,
    required this.picture,
  });

  factory Author.fromJson(Map<String, dynamic> json) {
    return Author(
      id: json['id'] as int,
      fullName: json['full_name'] as String,
      birthDate: DateTime.parse(json['birth_date'] as String),
      picture: json['picture'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'full_name': fullName,
      'birth_date': birthDate.toIso8601String(),
      'picture': picture,
    };
  }

  @override
  String toString() {
    return 'Author(id: $id, fullName: $fullName, birthDate: $birthDate, picture: $picture)';
  }
}
