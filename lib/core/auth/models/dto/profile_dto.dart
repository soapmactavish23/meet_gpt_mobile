import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first

class ProfileDto {
  int id;
  String name;
  String contact;
  ProfileDto({
    required this.id,
    required this.name,
    required this.contact,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'contact': contact,
    };
  }

  factory ProfileDto.fromMap(Map<String, dynamic> map) {
    return ProfileDto(
      id: map['id'] as int,
      name: map['name'] as String,
      contact: map['contact'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory ProfileDto.fromJson(String source) => ProfileDto.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'ProfileDto(id: $id, name: $name, contact: $contact)';
}

