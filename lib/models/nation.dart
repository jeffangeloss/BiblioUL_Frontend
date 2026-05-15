// lib/models/nation.dart
class Nation {
  final int id;
  final String demonym;

  Nation({
    required this.id,
    required this.demonym,
  });

  factory Nation.fromJson(Map<String, dynamic> json) {
    return Nation(
      id: json['id'] as int,
      demonym: json['demonym'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'demonym': demonym,
    };
  }

  @override
  String toString() {
    return 'Nation(id: $id, demonym: $demonym)';
  }
}
