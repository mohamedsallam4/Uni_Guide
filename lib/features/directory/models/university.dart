import 'package:equatable/equatable.dart';

class University extends Equatable {
  final String id;
  final String name;
  final String location;
  final String description;

  const University({
    required this.id,
    required this.name,
    required this.location,
    required this.description,
  });

  factory University.fromJson(Map<String, dynamic> json) {
    return University(
      id: json['id'] as String,
      name: json['name'] as String,
      location: json['location'] as String,
      description: json['description'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'location': location,
      'description': description,
    };
  }

  @override
  List<Object?> get props => [id, name, location, description];
}