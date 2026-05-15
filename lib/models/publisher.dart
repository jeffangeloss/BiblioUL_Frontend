// lib/models/publisher.dart
class Publisher {
  final int id;
  final String name;
  final String logo;

  Publisher({
    required this.id,
    required this.name,
    required this.logo,
  });

  factory Publisher.fromJson(Map<String, dynamic> json) {
    return Publisher(
      id: json['id'] as int,
      name: json['name'] as String,
      logo: json['logo'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'logo': logo,
    };
  }

  @override
  String toString() {
    return 'Publisher(id: $id, name: $name, logo: $logo)';
  }
}
