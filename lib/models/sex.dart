// lib/models/sex.dart

class Sex {
  final int id;
  final String name;

  Sex({
    required this.id,
    required this.name,
  });

  factory Sex.fromJson(Map<String, dynamic> json) {
    return Sex(
      id: json['id'] as int,
      name: json['name'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
    };
  }

  @override
  String toString() {
    return 'Sex(id: $id, name: $name)';
  }
}
