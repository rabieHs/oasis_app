import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class UserModel {
  final String name;
  final String email;
  String? id;
  final bool isAdmin;
  UserModel({
    required this.name,
    required this.email,
    this.id,
    required this.isAdmin,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'email': email,
      'id': id,
      'isAdmin': isAdmin,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      name: map['name'] as String,
      email: map['email'] as String,
      id: map['id'] != null ? map['id'] as String : null,
      isAdmin: map['isAdmin'] as bool,
    );
  }
}
