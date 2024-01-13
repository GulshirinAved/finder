import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class RegisterModal {
  final String token;
  User user;
  RegisterModal({
    required this.token,
    required this.user,
  });

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'token': token,
      'user': user.toJson(),
    };
  }

  factory RegisterModal.fromJson(Map<String, dynamic> map) {
    return RegisterModal(
      token: map['token'] as String,
      user: User.fromJson(map['user'] as Map<String, dynamic>),
    );
  }
}

class User {
  final String name;
  final String phone;
  final String updated_at;
  final String created_at;
  final int id;
  User({
    required this.name,
    required this.phone,
    required this.updated_at,
    required this.created_at,
    required this.id,
  });

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'name': name,
      'phone': phone,
      'updated_at': updated_at,
      'created_at': created_at,
      'id': id,
    };
  }

  factory User.fromJson(Map<String, dynamic> map) {
    return User(
      name: map['name'] as String,
      phone: map['phone'] as String,
      updated_at: map['updated_at'] as String,
      created_at: map['created_at'] as String,
      id: map['id'] as int,
    );
  }
}
